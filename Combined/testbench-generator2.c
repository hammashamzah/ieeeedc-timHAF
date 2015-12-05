#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

#define PI 3.14159265359

int main(int argc, char const *argv[]){
	FILE *fp;
	int i;
	int random;
	int theta;
	int initial_offset1, initial_offset2, initial_offset3, initial_offset4;
	int *value_temp;
	theta = atoi(argv[1]);

	if(argc != 2){
		printf("usage: %s theta, theta in degree\n", argv[0]);
		exit(1);
	}else{
		if(theta < 0 || theta > 360){
			printf("theta argument is invalid!\nit should be between 0 to 360\n");
			exit(1);
		} 
	}

	srand(time(NULL));

	value_temp = malloc(300000 * sizeof(int));

	for(i = 0; i <300000; i++){
			random = (int)(2+ 2*sin(rand())) % 2;
			value_temp[i] = random;
			printf("%d ", value_temp[i]);
	}
	printf("\n");

	//generate time offset because of delay
	// d / v / 2 = 0.15 / 345 / 2 = 0,000217391 seconds * 200 kHz = 43,478 clock cycle

	initial_offset1 = (int)(44 + (-1.0 * 43.478 * cos(PI*theta/180.0)));
	initial_offset2 = (int)(44 + (       43.478 * cos(PI*theta/180.0)));
	initial_offset3 = (int)(44 + (       43.478 * sin(PI*theta/180.0)));
	initial_offset4 = (int)(44 + (-1.0 * 43.478 * sin (PI*theta/180.0)));

	/*
	printf("initial_offset1: %d\n", initial_offset1);
	printf("initial_offset2: %d\n", initial_offset2);
	printf("initial_offset3: %d\n", initial_offset3);
	printf("initial_offset4: %d\n", initial_offset4);
	*/

	fp = fopen("system_testbench.v", "w+");
	
	fprintf(fp, "module system_testbench%c\n", 59);
	fprintf(fp, "parameter clk_periode = 10%c\n", 59);

	fprintf(fp, "reg clk%c\n", 59);
	fprintf(fp, "reg en%c\n", 59);
	fprintf(fp, "reg rst%c\n", 59);
	fprintf(fp, "reg x1%c\n", 59);
	fprintf(fp, "reg x2%c\n", 59);
	fprintf(fp, "reg y1%c\n", 59);
	fprintf(fp, "reg y2%c\n", 59);
	
	fprintf(fp, "wire[8:0] angle%c\n", 59);
	
	fprintf(fp, "top_level derivative\n(\n\t.clk(clk),\n\t.en(en),\n\t.rst(rst),\n\t.x1(x1),\n\t.x2(x2),\n\t.y1(y1),\n\t.y2(y2),\n\t.angle(angle)\n)%c\n",
				59);
	fprintf(fp, "initial begin\n");
	
	fprintf(fp, "clk = 1'b1%c\n", 59);
	fprintf(fp, "rst = 1'b1%c\n", 59);
	fprintf(fp, "en = 1'b1%c\n", 59); 

	fprintf(fp, "x1 = 1'b%d%c\n", 0, 59);
	fprintf(fp, "x2 = 1'b%d%c\n", 0, 59);
	fprintf(fp, "y1 = 1'b%d%c\n", 0, 59);
	fprintf(fp, "y2 = 1'b%d%c\n", 0, 59);
	fprintf(fp, "#(clk_periode*2) rst = 1'b0%c\n", 59);

	for(i = 0; i <300000; i++){

		fprintf(fp, "#(clk_periode) x1 = 1'b%d%c\n", value_temp[i+initial_offset1], 59);
		fprintf(fp, "x2 = 1'b%d%c\n", value_temp[i+initial_offset2], 59);
		fprintf(fp, "y1 = 1'b%d%c\n", value_temp[i+initial_offset3], 59);
		fprintf(fp, "y2 = 1'b%d%c\n", value_temp[i+initial_offset4], 59);

	}

	fprintf(fp, "end\n");

	fprintf(fp, "always#(clk_periode/2) clk = ! clk%c\n", 59);
	fprintf(fp, "endmodule\n");

	fclose(fp);

	return 0;
}