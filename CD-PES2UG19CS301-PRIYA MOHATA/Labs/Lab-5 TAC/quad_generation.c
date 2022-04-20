#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "quad_generation.h"

void quad_code_gen(char* a, char* b, char* op, char* c)
{
	//use fprintf to output the quadruple code to icg_quad_file
	fprintf(icg_quad_file,"%s,%s,%s,%s\n",op,b,c,a);
}

char* new_temp()
{
		//returns a pointer to a new temporary
		char* temp = (char*)malloc(sizeof(char)*4);
		sprintf(temp,"t%d",temp_no);
		++temp_no;
		return temp;
}
