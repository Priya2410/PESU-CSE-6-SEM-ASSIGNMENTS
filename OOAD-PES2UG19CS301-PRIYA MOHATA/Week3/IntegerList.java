// PRIYA MOHATA // PES2UG19CS301  // SECTION E
import java.util.Scanner;

class IntegerList{
    int list[];
    int numElements=0;

    public IntegerList(int size) {
        list = new int[size];
    }
    // Function to add in a value
    void add(int value){
        if(numElements==list.length){
            System.out.println("Sorry its not possible to add elements!\n");
        }
        else
        {
            list[numElements]=value;
            numElements++;
        }

    }

    @Override
    public String toString(){
        String returnString = "";
        for (int i = 0; i < numElements; i++) {
            returnString += i + ": " + list[i] + "\n";
        }
        return returnString;
    }
}

class SortedList extends IntegerList{

    public SortedList(int size){
        super(size);
    }
    void add(int value){
        if(numElements==list.length){
            System.out.println("Sorry its not possible to add elements!\n");
        }
        else
        {
            list[numElements]=value;
            numElements++;
            for (int i = 0; i < list.length; i++) {
                if (list[i] > value) {
                    for (int j = list.length - 1; j > i; j--) {
                        list[j] = list[j - 1];
                    }
                    list[i] = value;
                    break;
                }
            }
        }
    }
}


class Main{

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        // Fixed size array of 10 elements 
        IntegerList myList = new IntegerList(10);
        int count = 0;
        int num=0;
        while (count < 10) {
            System.out.println("Please enter the element of the array, enter 0 to quit");
            num = scan.nextInt();
            if (num != 0) {
                myList.add(num);
                count++;
            } else {
                break;
            }
        }
        System.out.println(myList);

        
        SortedList mylist1=new SortedList(10);
        int count1 = 0;
        int num1;
        while (count1 < 10) {
            System.out.println("Please enter the element of the array, enter 0 to quit");
            num1 = scan.nextInt();
            if (num1 != 0) {
                mylist1.add(num1);
                count1++;
            } else {
                break;
            }
        }

        System.out.println(mylist1);
        scan.close();
    }
}


