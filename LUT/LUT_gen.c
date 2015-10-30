#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

#define PI 3.1415926535897932384626433832795
#define v 345.0
#define n_def	87
#define d_def	15.0
#define Fs_def	200.0

int main(int argc, char *argv[]) {
	int n;
	double d,	// inter-mic distance (in cm)
		   Fs;	// Sampling frequency (in kHz)
	
	// Parameter input
	if(argc>1)
	{
		sscanf(argv[1],"%d",&n);
		if(argc>2)
		{
			sscanf(argv[2],"%lf",&d);
			if(argc>3)
			{
				sscanf(argv[3],"%lf",&Fs);
			}
			else
			{
				Fs = Fs_def;
				printf("Fs not defined.\nUsing ");
			}
		}
		else
		{
			d = d_def; Fs = Fs_def;
			printf("d and Fs not defined.\nUsing ");
		}
	}
	else
	{
		n = n_def; d = d_def; Fs = Fs_def;
		printf("n, d, and Fs not defined.\nUsing ");
	}
	printf("n = %d d = %lf Fs = %lf.\n",n,d,Fs);
	
	FILE *fp;
	
	fp = fopen("LUT.v","w");
	if(fp == NULL)
	{
		printf("Error opening LUT.v!\n");
		return -1;
	}
	
	fprintf(fp,"module LUT(clock,code,theta);\n");
	fprintf(fp,"    parameter n = %d;\n",n);
	fprintf(fp,"    input         clock;\n");
	fprintf(fp,"    input   [7:0] code;\n");
	fprintf(fp,"    output  [7:0] theta;\n\n");
	
	fprintf(fp,"    reg [7:0] theta;\n");
	fprintf(fp,"    reg [7:0] code_in;\n\n");
	
	fprintf(fp,"    always @(posedge clock)\n");
	fprintf(fp,"        code_in <= code;\n\n");
	
	fprintf(fp,"    always @(code_in)\n");
	fprintf(fp,"    case(code_in)\n");
	
	int i = 0;
	for(i=0;i<n;i++)
	{	
		double num = v * (double)i;
		double denum = d * Fs * 10.0;
		
		double theta = acos(num/denum) * 180.0/PI;
		
		printf("%lf %lf %lf",num,denum,theta);
		
		theta = round(theta);
		
		int O_i = 0; // BCD for theta (in degree)
		
/*		for(uint8_t j=0;j<2;j++)
		{
			uint8_t bcd = 0;
			bcd = (uint8_t)floor(theta/10.0);
			O_i = (O_i << 4) + bcd;
			theta = fmod(theta,10.0) * 10.0;
		}
*/		
		O_i = (int)theta;
		printf(" %d\n",O_i);
		
		fprintf(fp,"        (8'd%d): theta = 8'd%d;\n",i,O_i);
	}
	fprintf(fp,"        default : theta = 8'd0;\n");
	fprintf(fp,"    endcase\n");
	fprintf(fp,"endmodule ");
	
	fclose(fp);
	
	return 0;
}
