class Car{
        int yearModel;
        String make;
        int speed;

        int limit_accelerate=5;
        int limit_brake=5;

        void acceleration()
        {
            speed=speed+5;
            limit_accelerate--;
            if(limit_accelerate<0){
                System.out.println("You have reached the limit!");
            }
            else
            {
                System.out.println("Speed is:"+speed);
            }
        }

        void brake()
        {
            speed=speed-5;
            limit_brake--;
            if(limit_brake<0){
                System.out.println("You have reached the limit!");
            }
            else
            {
                System.out.println("Speed is:"+speed);
            }
        }
}


class Sample{
    public static void main(String args[]){
        // Creation of the object 
        Car car=new Car();
        car.yearModel=2021;
        car.make="Volvo";
        car.speed=80;

        // Calling function 5 times 

        int count=0;
        System.out.println("-----Accelerating----");
        while(count<=5)
        {
        car.acceleration();
        count++;
        }

        System.out.println("-----Applying brake----");
        
        count=0;
        while(count<=5)
        {
            car.brake();
            count++;
        }
}
}