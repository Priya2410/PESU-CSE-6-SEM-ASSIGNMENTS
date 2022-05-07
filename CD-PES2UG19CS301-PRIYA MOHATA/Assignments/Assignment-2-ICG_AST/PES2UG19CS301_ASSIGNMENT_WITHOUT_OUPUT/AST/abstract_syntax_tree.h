typedef struct expression_node
{
	struct expression_node* left;
	struct expression_node* mid;
	struct expression_node* right;
	char* val;
	
	
}expression_node;

expression_node* init_exp_node(char* val, expression_node* left, expression_node* middle, expression_node* right);
void display_exp_tree(expression_node* exp_node);
