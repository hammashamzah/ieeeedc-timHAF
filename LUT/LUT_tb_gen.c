#include <math.h>
#include <stdio.h>

#define PI 3.1415926535897932384626433832795
#define v 345.0
#define n_def	87
#define d_def	15.0
#define Fs_def	200.0

int main(void)
{
	FILE *out;
	
	out = fopen("LUT_tb.v","w");
	
	fprintf(out,"`timescale 1ns/1ns\n");
	fprintf(out,"module LUT_tb(theta);\n\n");
	
	fprintf(out,"    reg      clock;\n");
	fprintf(out,"    reg [7:0]code_x1,\n");
	fprintf(out,"             code_x2,\n");
	fprintf(out,"             code_y1,\n");
	fprintf(out,"             code_y2;\n");
	fprintf(out,"    output [8:0]theta;\n\n");
	
	fprintf(out,"    LUT_toplevel top\n");
	fprintf(out,"    (\n");
	fprintf(out,"        .clock   (clock),\n");
	fprintf(out,"        .code_x1 (code_x1),\n");
	fprintf(out,"        .code_x2 (code_x2),\n");
	fprintf(out,"        .code_y1 (code_y1),\n");
	fprintf(out,"        .code_y2 (code_y2),\n");
	fprintf(out,"        .theta   (theta)\n");
	fprintf(out,"    );\n\n");
    
	fprintf(out,"    initial begin\n");
	fprintf(out,"        clock = 1'b1;\n");
	fprintf(out,"        code_x1 = 8'd255;\n");
	fprintf(out,"        code_x2 = 8'd255;\n");
	fprintf(out,"        code_y1 = 8'd255;\n");
	fprintf(out,"        code_y2 = 8'd255;\n\n");
	
	// First quadrant
	fprintf(out,"        #3\n");
	for(int i=0;i<90;i++)
	{
		double x1 = d_def*Fs_def*cos(i*PI/180.0)*10.0/v;
		double y2 = d_def*Fs_def*sin(i*PI/180.0)*10.0/v;
		printf("%d: %10f %10f\n",i,x1,y2);
		
		int code_x1 = (int)floor(x1);
		int code_y2 = (int)floor(y2);
		
		fprintf(out,"        code_x1 = 8'd%d;\n",code_x1);
		fprintf(out,"        code_y2 = 8'd%d;\n\n",code_y2);
		fprintf(out,"        #50\n");
	}
	
	// Second quadrant
	fprintf(out,"        code_x1 = 8'd255;\n");
	fprintf(out,"        code_y1 = 8'd255;\n");
	for(int i=90;i<180;i++)
	{
		double x2 = (-1.0)*d_def*Fs_def*cos(i*PI/180.0)*10.0/v;
		double y2 =        d_def*Fs_def*sin(i*PI/180.0)*10.0/v;
		printf("%d: %10f %10f\n",i,x2,y2);
		
		int code_x2 = (int)floor(x2);
		int code_y2 = (int)floor(y2);
		
		fprintf(out,"        code_x2 = 8'd%d;\n",code_x2);
		fprintf(out,"        code_y2 = 8'd%d;\n\n",code_y2);
		fprintf(out,"        #50\n");
	}
	
	// Third quadrant
	fprintf(out,"        code_x1 = 8'd255;\n");
	fprintf(out,"        code_y2 = 8'd255;\n");
	for(int i=180;i<270;i++)
	{
		double x2 = (-1.0)*d_def*Fs_def*cos(i*PI/180.0)*10.0/v;
		double y1 = (-1.0)*d_def*Fs_def*sin(i*PI/180.0)*10.0/v;
		printf("%d: %10f %10f\n",i,x2,y1);
		
		
		int code_x2 = (int)floor(x2);
		int code_y1 = (int)floor(y1);
		
		fprintf(out,"        code_x2 = 8'd%d;\n",code_x2);
		fprintf(out,"        code_y1 = 8'd%d;\n\n",code_y1);
		fprintf(out,"        #50\n");
	}
	
	// Fourth quadrant
	fprintf(out,"        code_x2 = 8'd255;\n");
	fprintf(out,"        code_y2 = 8'd255;\n");
	for(int i=270;i<360;i++)
	{
		double x1 =        d_def*Fs_def*cos(i*PI/180.0)*10.0/v;
		double y1 = (-1.0)*d_def*Fs_def*sin(i*PI/180.0)*10.0/v;
		printf("%d: %10f %10f\n",i,x1,y1);
		
		int code_x1 = (int)floor(x1);
		int code_y1 = (int)floor(y1);
		
		fprintf(out,"        code_x1 = 8'd%d;\n",code_x1);
		fprintf(out,"        code_y1 = 8'd%d;\n\n",code_y1);
		fprintf(out,"        #50\n");
	}

	fprintf(out,"    end\n\n");
	
	fprintf(out,"    always\n");
	fprintf(out,"        #5  clock =  ! clock;\n\n");
	
	fprintf(out,"endmodule ");
	
	fclose(out);
}
