// Requirement - Stack Data Structure - like an array 
// Array of objects is the requirement 
// Solutions should include classes : Card will contain - suite and value 
// Pile : [ Stack ] , capacity of pile : 10
// Also have to check for stack underflow and stack overflow 
// main function - instantiate all cards - draw , peek , insert the card .
// Peek - just display value don't remove / add .
// Submit in pdf 
// Watermark of your name 
// PDF SRN_Week2.pdf

import java.util.Scanner;

class Card{
    String suite;
    String value;

    // Parameterized Constructor 
    Card(String suite,String value){
        this.suite=suite;
        this.value=value;
    }    
}

class Pile{

    // To peek the stack 
    int top=0; 
    // Creating a stack as array of objects
    // 10 since - pile limit is 10 
    Card[] card=new Card[10];

    void insert(String suite,String value){
        // Checking for overflow
        top=top+1;
        card[top]=new Card(suite,value);
    }

    void draw(){
        // Checking for underflow 
        if(top<=0){
            System.out.println("Sorry! Drawing of Card is not possible!");
        }
        else
        {
        System.out.println("Card Drawn of suite: "+card[top].suite+" the value is :"+card[top].value+"\n");
        card[top].suite=null;
        card[top].value=null;
        top-=1;
        }
    }

    void peek(){
        if(top<=0){
            System.out.println("Sorry there is no card present");
        }
        else
        {
            System.out.println("Card of suite:"+card[top].suite+" the value is :"+card[top].value+"\n");
        }
    }
}

class Main{
    public static void main(String[] args){
        Pile p=new Pile();

        int ch;

        Scanner scanner=new Scanner(System.in);

        while(true){
            System.out.println("\nEnter 1 to insert card");
            System.out.println("Enter 2 to draw card");
            System.out.println("Enter 3 to peek card");
            System.out.println("Enter 4 to quit");
            System.out.println("Enter your choice\n");

            ch=scanner.nextInt();

            switch(ch){
                case 1:
                if(p.top>=9){
                    System.out.println("Sorry! Insertion of Card is not possible!\n");
                }
                else{
                System.out.println("Enter the suite and value");
                String suite=scanner.next();
                System.out.println("Enter the value");
                String value=scanner.next();
                p.insert(suite,value);
                }
                break;

                case 2:
                p.draw();
                break;

                case 3:
                p.peek();
                break;

                case 4:
                System.exit(0);
            }
        }
    }
}