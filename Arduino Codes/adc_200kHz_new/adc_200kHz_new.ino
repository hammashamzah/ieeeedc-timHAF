//#define x1
//#define x2
//#define y1
#define y2

volatile bool readyFlag;
volatile uint8_t data;

void setup()
{
  /** ADC Configuration **/
  //analogReference(DEFAULT);
  // Left-adjust ADC result
  // MUX = 0: ADC Channel 0
  ADMUX = (0b01<<REFS0) | (1<<ADLAR) | (0<<MUX0);

  // ADIE: Enable ADC Interrupt Routine
  // ADIF: Reset ADC Interrupt Flag
  // ADPS = 0b010: ADC clock = 16MHz/4 = 4MHz
  // ADC Result Refresh = 4MHz/13 = 307.692kHz
  ADCSRA = (1<<ADEN) | (1<<ADATE) | (1<<ADIF) | (1<<ADIE) | (0b010<<ADPS0);

  // ADTS = 0b000: ADC in Free Running Mode
  ADCSRB = (0b000<<ADTS0);

  /** Digital I/O Config **/
  DDRD = 0xFF;

  /** Reset flag **/
  readyFlag = 0;
  data = 0;

  /** Serial Config **/
  Serial.begin(1000000);

  sei();

  // Kick-start ADC
  ADCSRA |= (1<<ADSC);
}

ISR(ADC_vect)
{
  #ifdef x1
  data = ((ADCH-0) / 6) + 107;
  #endif
  #ifdef x2
  data = ((ADCH-2) / 5) + 103;
  #endif
  #ifdef y1
  data = ((ADCH-0) / 6) + 107;
  #endif
  #ifdef y2
  data = ((ADCH-2) / 5) + 103;
  #endif
  PORTD = data;
  readyFlag = 1;
}

void loop()
{
  // put your main code here, to run repeatedly:
  if(readyFlag)
  {
    Serial.println(data);
    readyFlag = 0;
  }
}
