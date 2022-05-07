#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "quad_generation.h"


void quad_code_gen(char* a, char* b, char* op, char* c)
{	
	fprintf(icg_quad_file,"%s\t%s\t%s\t%s\n",op,b,c,a);
}

char* new_temp()
{
		char* tempNew = (char*)malloc(sizeof(char)*4);
		sprintf(tempNew,"t%d",temp_no);	
		temp_no++;
		return tempNew;
}

char* new_label()
{
		char* label = (char*)malloc(sizeof(char)*4);
		sprintf(label,"L%d",label_no);
		label_no++;
		return label;
}
