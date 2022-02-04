class car{
	int regno;
	String make;
	car(int a,String b)
	{
		this.regno=a;
		this.make=b;
	}
}

class queue{
	int i=0,n=0;
	car arr[] = new car[10];
	void wait(car c)
	{
		if(n-i==10)
			System.out.println("Queue full.Unable to add car "+c.regno+" to the queue");
		else
		{
			arr[n]=c;
			n++;
			System.out.println("Car "+c.regno+" add to queue");
		}
	}
	void park()
	{
		if(n==i)
			System.out.println("Queue Empty.No car to park");
		else
		{
			i++;
			System.out.println("Car "+arr[i-1].regno+" parked");
			if(i==n)
				System.out.println("Queue is empty now.");
			else
				System.out.println("Next in queue is car "+arr[i].regno);
		}
	}
}
  
public class program2{  
 public static void main(String args[]){  
		car c1=new car(1,"Q");
		car c2=new car(2,"K");
		car c3=new car(3,"A");
		car c4=new car(4,"Q");
		car c5=new car(5,"K");
		car c6=new car(6,"A");
		car c7=new car(7,"Q");
		car c8=new car(8,"K");
		car c9=new car(9,"A");
		car c10=new car(10,"Q");
		car c11=new car(11,"K");
		queue Q = new queue();
		Q.wait(c1);
		Q.wait(c2);
		Q.wait(c3);
		Q.wait(c4);
		Q.wait(c5);
		Q.wait(c6);
		Q.wait(c7);
		Q.wait(c8);
		Q.wait(c9);
		Q.wait(c10);
		Q.wait(c11);
		Q.park();
		Q.park();
		Q.park();
		Q.park();
		Q.park();
		Q.park();
		Q.park();
		Q.park();
		Q.park();
		Q.park();
		Q.park();
   }  
}