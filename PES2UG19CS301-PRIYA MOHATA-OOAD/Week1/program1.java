class DemoAccess{
        private int age=21; // Private variable
        String srn; // Default variable
        public int marks; // public variable 

        // Protected method
        protected void display()
        {
            System.out.println("Marks are:"+marks);
        }
}

class DemoProtect extends DemoAccess{
    public static void main(String[] args)
    {
        DemoProtect obj1=new DemoProtect();

        // Demonstrating public access modifier
        obj1.marks=98;

        //System.out.println("Age:"+obj1.age);
        System.out.println("Marks:"+obj1.marks);

        // Demonstrating default access modifier
        obj1.srn="PES2UG19CS301";
        System.out.println("SRN:"+obj1.srn);

        // Demonstrating protected access modifier 
        obj1.display();
    }
}
