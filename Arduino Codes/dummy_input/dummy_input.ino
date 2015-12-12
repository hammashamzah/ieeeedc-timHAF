#include <avr/io.h>
#include <avr/interrupt.h>
#include <SD.h>

#define CS 10
#define x1 2
#define x2 3
#define y1 4
#define y2 5
#define LED 13
//#define PI 3.14159265359

bool valueBuffer[100];
File dataFile;
uint8_t theta = 60;
uint8_t offset1, offset2, offset3, offset4;

void setup()
{  
  //noInterrupts();
  
  pinMode(x1,OUTPUT);
  pinMode(x2,OUTPUT);
  pinMode(y1,OUTPUT);
  pinMode(y2,OUTPUT);
  //pinMode(LED,OUTPUT);
  //digitalWrite(LED,1);
  
  // Open serial communications and wait for port to open
  Serial.begin(1000000);
  while(!Serial);

  Serial.println("Initializing SD card...");

  // see if the card is present and can be initialized:
  if (!SD.begin(CS))
  {
    Serial.println("Card failed or not present.");
    // don't do anything more:
    return;
  }
  Serial.println("Card initialized.");

  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  dataFile = SD.open("input.txt", FILE_READ);

  // if the file is available, write to it:
  if(dataFile)
  {
    uint8_t i = 0;
    Serial.println("File opened.");
    while(dataFile.available() && i<100)
    {
      uint8_t data = dataFile.read();
      //Serial.write(data);
      if(data == '0' || data == '1')
      {
        valueBuffer[i] = data - '0';
        //Serial.write(valueBuffer[i]);
        i++;
      }
      
    }
    //dataFile.close();

    /** Timer 2 Configuration **/
    // WGM2 = 0b010: CTC mode
    // CS2 = 0b001: Running with no prescaling
    // OCR2A = 16MHz/200kHz - 1 = 80-1 = 79
    
    //cli();
    TCCR2A = 0;
    TCCR2B = 0;
    TCNT2 = 0;
    OCR2A = 79;
    TIFR2 |= (1<<OCF2A);
    TIMSK2 |= (1<<OCIE2A);
    TCCR2A = 0b10<<WGM20;
    TCCR2B = (0<<WGM22) | (0b001<<CS20);
    //sei(); 

    /** Timer 1 Configuration **/
    // WGM1 = 0b0100: CTC mode with OCR1A as TOP value
    // CS1 = 0b001: Running with no prescaling
    // OCR1A = 16MHz/200kHz - 1 = 80-1 = 79
/*    TCCR1A = 0;
    TCCR1B = 0;
    TCNT1 = 0;
    OCR1A = 79;
    TIMSK1 |= (1<<OCIE1A);
    TCCR1A = (0b00<<WGM10);
    TCCR1B = (0b01<<WGM12) | (0b001<<CS10); */
  }
  // if the file isn't open, pop up an error:
  else {
    Serial.println("error opening input.txt");
  }

  offset1 = (44 + (int8_t)(-1.0 * 43.478 * cos(PI*(float)theta/180.0)));
  offset2 = (44 + (int8_t)(       43.478 * cos(PI*(float)theta/180.0)));
  offset3 = (44 + (int8_t)(       43.478 * sin(PI*(float)theta/180.0)));
  offset4 = (44 + (int8_t)(-1.0 * 43.478 * sin(PI*(float)theta/180.0)));
  Serial.println(offset1);
  Serial.println(offset2);
  Serial.println(offset3);
  Serial.println(offset4);

  /** Timer 1: One-second timer **/
  // WGM1 = 0b0100: CTC mode
  // CS1 = 0b101: Prescaler 1024
  cli();
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = 0;
  OCR1A = 15624;
  TIFR1 |= (1<<OCF1A);
  TIMSK1 |= (1<<OCIE1A);
  TCCR1A = 0b00<<WGM10;
  TCCR1B = 0b01<<WGM12 | 0b101<<CS10; 
  sei();
}

volatile uint8_t kHz200 = 0, Hz1 = 0;
ISR(TIMER2_COMPA_vect)
{
  kHz200 = 1;
}

ISR(TIMER1_COMPA_vect)
{
  Hz1 = 1;
  //digitalWrite(LED, !digitalRead(LED)); // toggle LED pin
}

void loop() {
  // put your main code here, to run repeatedly:
  static uint8_t pointer = 0;
  static uint32_t count = 0;

  if(dataFile && kHz200)
  { 
    kHz200 = 0;
    //Serial.print(pointer);
    //Serial.println((pointer+offset1)%100);
    
    if(valueBuffer[(pointer + offset1) % 100])
      digitalWrite(x1,HIGH);
    else
      digitalWrite(x1,LOW);

    if(valueBuffer[(pointer + offset2) % 100])
      digitalWrite(x2,HIGH);
    else
      digitalWrite(x2,LOW);

    if(valueBuffer[(pointer + offset3) % 100])
      digitalWrite(y1,HIGH);
    else
      digitalWrite(y1,LOW);

    if(valueBuffer[(pointer + offset4) % 100])
      digitalWrite(y2,HIGH);
    else
      digitalWrite(y2,LOW);

    /** Read new value and insert it to buffer **/
    bool newDataNotFound = 1;
    while(newDataNotFound)
    {
      if(!(dataFile.available()))
        dataFile.seek(0);
      
      uint8_t data = dataFile.read();
      
      if(data == '0' || data == '1')
      {
        valueBuffer[pointer%100] = data - '0';
        //Serial.write(valueBuffer[pointer % 100]);
        newDataNotFound = 0;
      }
    }
    
    pointer++;
    if(pointer>=100)
      pointer = 0;

    count++;
  }

  if(Hz1)
  {
    Serial.println(count);
    Hz1 = 0;
    count = 0;
  }
}
