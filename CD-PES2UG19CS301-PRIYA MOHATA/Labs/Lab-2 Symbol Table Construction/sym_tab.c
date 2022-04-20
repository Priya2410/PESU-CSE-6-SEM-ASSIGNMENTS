#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sym_tab.h"

table* allocate_space_for_table()	
{
	t = (table*) malloc(sizeof(table));
	t->head = NULL;
	return t;
}

symbol* allocate_space_for_table_entry(char* name, int size, int type, int lineno, int scope)
{
	symbol *sym = (symbol*) malloc(sizeof(symbol));
	sym->name = name;
	sym->size = size;
	sym->type = type;
	sym->line = lineno;
	sym->scope = scope;
	sym->val = "~";
	sym->next = NULL;
	return sym;
}

void insert_into_table(symbol *sym)
{
	symbol *s1;
	if(t->head == NULL)
		t->head = sym;
	else
	{
		s1 = t->head;
		while(s1->next != NULL)
			s1 = s1->next;
		s1->next = sym;
	}
}

int check_symbol_table(char* name) 
{
	if(t->head == NULL)
		return 0;
	symbol *s1 = t->head;
	int c=0;
	while(s1!=NULL)
    {
        if(strcmp(s1->name, name)==0)
        {
            c++;
			break;
        }
        s1 = s1->next;
    }
    return c;
}

void insert_value_to_name(char* name, char* value, int type)
{
    /*
        if value is default value return back
        check if table is empty
        else traverse the table and find the name
        insert value into the entry structure
    */
}

void display_symbol_table()
{
	symbol* sym = t->head;
	if(sym == NULL)
	{
		printf("Empty Symbol Table");
		exit(0);
	}
	printf("Name      Size      Type      Lineno    Scope     Value\n");
	while(sym != NULL)
	{
		printf("%-10s%-10d%-10d%-10d%-10d%-10s\n", sym->name, sym->size, sym->type, sym->line, sym->scope, sym->val);
		sym = sym->next;
	}
	symbol *s1, *s2=NULL;
	s1 = t->head;
	while(s1->next != NULL)
	{
		s2 = s1;
		s1 = s1->next;
		free(s2);
	}
	free(t);
}
