
// PRIYA MOHATA
// PES2UG19CS301 
// SECTION E

import java.util.Scanner;

abstract class TestQuestion{
    // Data members :
    String question;
    abstract void readQuestion();
}

class ShortAnswer extends TestQuestion{
    
    int numlines=1;

    // Method to read the question 
    void readQuestion(){
        System.out.println("\nEnter the question please:");
        Scanner sc=new Scanner(System.in);
        question=sc.nextLine();
    }

    // Method to display the output 
    public String toString(){
        String str="The short answer question is:"+question+"\nThe number of lines are :"+numlines;
        return str;
    }
}

class LongAnswer extends TestQuestion{
    int numlines;

    // Method to read the question 
    void readQuestion(){
        System.out.println("\nEnter the question please:");
        Scanner sc=new Scanner(System.in);
        question=sc.nextLine();
        System.out.println("\nEnter the number of lines:");
        numlines=sc.nextInt();
    }

    // Method to display the output 
    public String toString(){
        String str="The long answer question is:"+question+"\nThe number of lines are :"+numlines;
        return str;
    }
}

class MCQ extends TestQuestion{
    int numchoices;
    String[] choices;

    // Method to read the question 
    void readQuestion(){
        System.out.println("\nEnter the question please:");
        Scanner sc=new Scanner(System.in);
        question=sc.nextLine();
        System.out.println("\nEnter the number of choices please:");
        numchoices=sc.nextInt();
        choices=new String[numchoices+1];
        System.out.println("\nEnter the choices:");
        sc.nextLine();
        for(int i=0;i<numchoices;i++)
        {
            choices[i] = sc.nextLine();
        }
    }

    // Method to display the output 
    public String toString(){
        String str="The MCQ question is:"+question+"\nThe number of choices are :"+numchoices+"\n";
        str=str+"The choices are as follows:\n";
        for(int i=0;i<numchoices;i++){
            str=str+"Choice "+(i+1)+" "+choices[i]+"\n";
        }
        return str;
    }

}

public class TQManager {

    public static void main(String[] args) 
    {
        int noq,choice;
        Scanner scanner = new Scanner(System.in);
        System.out.println("\nEnter the number of questions: ");
        noq = scanner.nextInt();
        scanner.nextLine();
        TestQuestion[] pointer=new TestQuestion[noq];
        
        for(int j=0;j<noq;j++)
        {    
                System.out.println("\nPress 1 for SHORT ANSWER");
                System.out.println("Press 2 for LONG ANSWER");
                System.out.println("Press 3 for MCQ");
                System.out.println("Press any other number to exit\n");
                System.out.println("Enter your choice: ");
                 
                choice = scanner.nextInt();
                scanner.nextLine();
                switch(choice)
                {
                    case 1:
                        ShortAnswer sa=new ShortAnswer();
                        sa.readQuestion();
                        pointer[j]=sa;
                        break;
    
                    case 2:
                        LongAnswer la=new LongAnswer();
                        la.readQuestion();
                        pointer[j]=la;
                        break;
                    
                    case 3:
                        MCQ mcq=new MCQ();
                        mcq.readQuestion();
                        pointer[j]=mcq;
                        break;
                    
                    default:
                        System.exit(0);
                }
        }
        for(int i= 0;i<noq;i++)
        {
            System.out.println(pointer[i]+"\n\n");
        }
        scanner.close();
    }
}