class Box{
    double width;
    double height;
    double depth;

    // Default constructor - user defined 

    Box(){
        width=0.0;
        height=0.0;
        depth=0.0;
    }

    // Parameterized constructor 

    Box(double w,double h,double d){
        width=w;
        height=h;
        depth=d;
    }

    // Calculating the volume 

    void volume(){
        System.out.println("The volume is :"+(width*height*depth));
    }

}

class Main{
    public static void main(String[] args){

        // Initializing the default constructor 
            Box b1=new Box();
            Box b2=new Box(10.0,20.0,15.0);

            b1.volume();

            b2.volume();
        // Initializing the parameterized constructor 
    }
}

