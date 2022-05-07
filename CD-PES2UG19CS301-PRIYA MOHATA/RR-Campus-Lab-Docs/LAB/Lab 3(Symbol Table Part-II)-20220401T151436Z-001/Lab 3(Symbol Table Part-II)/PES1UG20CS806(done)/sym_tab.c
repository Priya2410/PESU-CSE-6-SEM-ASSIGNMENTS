#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sym_tab.h"

table* allocate_space_for_table()	
{
	/*
        allocate space for table pointer structure eg (t_name)* t
        initialise head variable eg t->head
        return structure
    	*/
    t = (table*)malloc(sizeof(table));
    t-> head = NULL;
    return t;
}

symbol* allocate_space_for_table_entry(char* name, int size, int type, int lineno, int scope) //allocates space for items in the list
{
	/*
        allocate space for entry pointer structure eg (s_name)* s
        initialise all struct variables(name, value, type, scope, length, line number)
        return structure
    	*/
    symbol* sym = (symbol*)malloc(sizeof(symbol));
    sym->name = name;
    sym->size = size;
    sym->type = type;
    sym->val = "~";
    sym->line = lineno;
    sym->scope = scope;
    sym->next = NULL;
    return sym;
}

void insert_into_table(symbol* s)/* 
 arguments can be the structure s_name already allocated before this function call
 or the variables to be sent to allocate_space_for_table_entry for initialisation        
*/
{
    /*
        check if table is empty or not using the struct table pointer
        else traverse to the end of the table and insert the entry
    */
    if(t->head==NULL)
    {
        t->head = s;
        return;
    }
    symbol* sym = t->head;
    while(sym->next!=NULL)
        sym = sym->next;
    sym->next = s;
}

int check_symbol_table(char* name) //return a value like integer for checking
{
    /*
        check if table is empty and return a value like 0
        else traverse the table
        if entry is found return a value like 1
        if not return a value like 0
    */
    if (t->head==NULL)
            return 0;
    symbol* sym = t->head;
    int found=0;
    while(sym->next!=NULL)
    {
        if(strcmp(sym->name, name)==0)
        {
            found=1;
            break;
        }
        sym = sym->next;
    }
    return found;
}

void insert_value_to_name(char* name, char* value)
{
    /*
        if value is default value return back
        check if table is empty
        else traverse the table and find the name
        insert value into the entry structure
    */
    if(strcmp(value, "~") == 0)
        return;
    symbol* sym = t->head;
    while(sym->next!=NULL)
    {
        if(strcmp(sym->name, name)==0)
            break;
        sym = sym->next;
    }
    sym->val = value;
}

void display_symbol_table()
{
    /*
        traverse through table and print every entry
        with its struct variables
    */
    printf("Name      size      type      lineno    scope     value\n");
    symbol* sym = t->head;
    while(sym!=NULL)
    {
        printf("%-10s%-10d%-10d%-10d%-10d%-10s\n", sym->name, sym->size, sym->type, sym->line, sym->scope, sym->val);
        sym = sym->next;
    }
}
