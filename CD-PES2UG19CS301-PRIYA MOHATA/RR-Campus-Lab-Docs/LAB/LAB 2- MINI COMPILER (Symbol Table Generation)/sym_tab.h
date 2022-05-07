#define CHAR 1
#define INT 2
#define FLOAT 3
#define DOUBLE 4

typedef struct symbol		//data structure of items in the list
{
	char* name;			//identifier name
	int size;			//storage size of identifier name
	int type;			//identifier type
	char* val;			//value of the identifier
	int line;			//declared line number
	int scope;			//scope of the variable
	struct symbol* next;
}symbol;

typedef struct table		//keeps track of the start of the list
{
	symbol* head;
}table;

static table* t;

table* allocate_space_for_table();	//allocate space for start of table
// thus making a new symbol table

symbol* allocate_space_for_table_entry(char* name, int size, int type, int lineno, int scope);		
//allocates space for items in the list and initialisation

insert_into_table(arguments);	//arguments can vary based on implementation
//inserts symbols into the table when declared

insert_value_to_name(name,value,type);	
//inserts values into the table when a variable is initialised

check_symbol_table(name);
//checks symbol table whether the variable has been declared or not

display_symbol_table();			//displays symbol table
