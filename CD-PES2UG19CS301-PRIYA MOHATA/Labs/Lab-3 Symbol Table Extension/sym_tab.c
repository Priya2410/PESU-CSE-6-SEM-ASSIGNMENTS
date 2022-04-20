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
    	t->head = NULL;
    	return t;
}

symbol* allocate_space_for_table_entry(char* name, int size, int type, int lineno, int scope) //allocates space for items in the list
{
	/*
        allocate space for entry pointer structure eg (s_name)* s
        initialise all struct variables(name, value, type, scope, length, line number)
        return structure
    	*/
    symbol *s = (symbol*)malloc(sizeof(symbol));
    	s->name = name;
    	s->size = size;
    	s->type = type;
    	s->scope = scope;
    	s->line = lineno;
    	s->next = NULL;
    	s->val = "~";
    	return s;
}

insert_into_table(symbol* arguments)/* 
 arguments can be the structure s_name already allocated before this function call
 or the variables to be sent to allocate_space_for_table_entry for initialisation        
*/
{
    /*
        check if table is empty or not using the struct table pointer
        else traverse to the end of the table and insert the entry
    */
    symbol *p = t->head;
    if(p!=NULL)
    {
    	while(p->next!=NULL)
    	{
    		p=p->next;
    	}
   	p->next = arguments;
    }
    else
    {
	t->head = arguments;
    }
    return 1;
}

check_symbol_table(char* name) //return a value like integer for checking
{
    /*
        check if table is empty and return a value like 0
        else traverse the table
        if entry is found return a value like 1
        if not return a value like 0
    */
    symbol *p = t->head;
    if(p==NULL)
    {
    	return 0;
    }
    
    while(p!=NULL)
    {
    	if(strcmp(p->name, name)==0)
    	{
    		return 1;
    	}
    	p=p->next;
    }
}

insert_value_to_name(char* name,char* value)
{
    /*
        if value is default value return back
        check if table is empty
        else traverse the table and find the name
        insert value into the entry structure
    */
    symbol *p = t->head;
    if(p==NULL)
    {
    	return 0;
    }
    while(p!=NULL)
    {
    	if(strcmp(p->name, name)==0)
    	{
    		p->val = value;
    		//p->type = type;
    		return 1;
    	}
    	p=p->next;
    }
    return 0;
}

display_symbol_table()
{
    /*
        traverse through table and print every entry
        with its struct variables
    */
    printf("Name\tSize\tType\tLineNo\tScope\tValue\n");
    symbol *p = t->head;
    while(p!=NULL)
    {
    	printf("%s\t%d\t%d\t%d\t%d\t%s\n",p->name, p->size, p->type, p->line, p->scope, p->val);
    	p=p->next;
    }
    return 1;
}


int retrieve_type(char* name){
	
	symbol* ptr = t->head;
    while(ptr != NULL){
       if(strcmp(ptr->name,name) == 0){
           return ptr->type;
       }
       ptr = ptr->next;
   }
	
	//if(strcmp(ptr->name,name) == 0)   {return ptr->type;}

}

int type_check(char* name){
	
	float temp=atof(name);
	
	if(sizeof(temp)==4)
		{return(3);}
	else if(sizeof(temp)==2)
		{return(2);}
	else if(sizeof(temp)==8)
		{return(4);}
	else
		{return(1);}
}

char* retrieve_val(char* name){

	symbol* ptr = t->head;
    while(ptr != NULL){
       if(strcmp(ptr->name,name) == 0){
           return ptr->val;
       }
       ptr = ptr->next;
   }


}

