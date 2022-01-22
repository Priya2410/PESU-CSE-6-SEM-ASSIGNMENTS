#include<stdio.h>
#include<stdlib.h>
#include<iostream>
#include <string> // for string class
using namespace std;

// PRIYA MOHATA 
// PES2UG19CS301
// SECTION E - WEEK 1 ASSIGNMENT 

struct Node
{
	string data;
	struct Node * link;
};

struct Node* getnode()
{
	struct Node  *x;
	x=(struct Node *)malloc(sizeof(struct Node));
	if(x==NULL)
	{
		printf("insufficient memory");
		return(0);
	}
	return(x);
}
struct Node* insert_at_front(struct Node* head,string ele)
{
	struct Node *temp;
	temp=getnode();
	temp->data=ele;
	temp->link=head;
	return(temp);
}
struct Node* insert_at_rear(struct Node* head,string ele)
{
	struct Node *temp=NULL;
	temp=getnode();
	temp->data=ele;
	temp->link=NULL;
	struct Node *cur=head;
	if(head==NULL)
	{
		return(temp);
	}
	while(cur->link!=NULL)
	{
		cur=cur->link;
	}
	cur->link=temp;
	return(head);
}
	
	
void display(struct Node *head)
{
	struct Node *cur=head;
	while(cur!=NULL)
	{
		cout<<cur->data<<" ";
		cur=cur->link;
	}
}

	
struct Node* insert_at_position(struct Node *head,string ele,int pos)
{
	struct Node *temp=getnode();
	temp->data=ele;
	temp->link=NULL;
	struct Node* first=head;
	if(pos==1)
	{
		temp->link=head;
		return(temp);
	}
	struct Node *cur=first;
	struct Node *prev=NULL;
	for(int i=1;i<=pos-1;i++)
	{
		prev=cur;
		cur=cur->link;
	}
	prev->link=temp;
	temp->link=cur;
	return(head);
}

void search(struct Node* head,string ele){
	struct Node *cur=head;
	int count=0;
	int pos=-1;
	while(cur!=NULL)
	{
		if(cur->data==ele)
		pos=count;
		count++;
		cur=cur->link;
	}
	if(pos!=-1){
		cout<<"Element found at position : "<<pos<<"\n";
	}
	else{
		cout<<"Element not found\n";
	}
}

int main(void)
{
  struct Node *first=NULL;
 string ele;
 int position;
 for(;;)
 {
 printf("\n 1.Insert at front\n 2.Insert at rear\n 3.Display\n 4.Insert at position\n 5.Search for a word\n");
 printf("\n enter your choice\n");
 int ch;
 scanf("%d",&ch);

 switch(ch)
 {
	 case 1: printf("\n enter the element\n");
			 cin>>ele;
			 first=insert_at_front(first,ele);
			 break;
	case 2: printf("\n enter the element\n");
			cin>>ele;
			first=insert_at_rear(first,ele);
			break;
	 case 3: display(first);
			break;
	 case 4:printf("\n enter the element\n");
			cin>>ele;
			printf("enter the position");
			scanf("%d",&position);
			first=insert_at_position(first,ele,position);
			break;
	 case 5:printf("\n enter the element\n");
			cin>>ele;
			search(first,ele);
			break;
	default:exit(0);
 }
 }
 return(0);
 }



