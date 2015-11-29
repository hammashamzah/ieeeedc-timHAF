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

	
	//generate time offset because of delay

	initial_offset1 = (int)(217 + floor(217.5 * cos(PI*theta/180)));
	initial_offset2 = (int)(217 + (-1 * floor(217.5 * cos(PI*theta/180))));
	initial_offset3 = (int)(217 + (-1 * floor(217.5 * sin(PI*theta/180))));
	initial_offset4 = (int)(217 + floor(217.5 * sin (PI*theta/180)));

	printf("initial_offset1: %d\n", initial_offset1);
	printf("initial_offset2: %d\n", initial_offset2);
	printf("initial_offset3: %d\n", initial_offset3);
	printf("initial_offset4: %d\n", initial_offset4);

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
	fprintf(fp, "#(clk_periode*2) rst = 1'b0%c\n", 59);

	for (i = 0; i < initial_offset1; i++)
	{
		fprintf(fp, "#(clk_periode*%d) x1 = %d%c\n", i, 0, 59);
	}

	for (i = 0; i < initial_offset2; i++)
	{
		fprintf(fp, "#(clk_periode*%d) x2 = %d%c\n", i, 0, 59);
	}

	for (i = 0; i < initial_offset3; i++)
	{
		fprintf(fp, "#(clk_periode*%d) y1 = %d%c\n", i, 0, 59);
	}

	for (i = 0; i < initial_offset4; i++)
	{
		fprintf(fp, "#(clk_periode*%d) y2 = %d%c\n", i, 0, 59);
	}

	for(i = 0; i <300000; i++){
		random = rand() % 2;
		fprintf(fp, "#(clk_periode*%d) x1 = %d%c\n", i+initial_offset1, random, 59);
		fprintf(fp, "#(clk_periode*%d) x2 = %d%c\n", i+initial_offset2, random, 59);
		fprintf(fp, "#(clk_periode*%d) y1 = %d%c\n", i+initial_offset3, random, 59);
		fprintf(fp, "#(clk_periode*%d) y2 = %d%c\n", i+initial_offset4, random, 59);

	}

	fprintf(fp, "end\n");

	fprintf(fp, "always#(clk_periode/2) clk = ! clk%c\n", 59);
	fprintf(fp, "endmodule\n");

	fclose(fp);

	return 0;
}