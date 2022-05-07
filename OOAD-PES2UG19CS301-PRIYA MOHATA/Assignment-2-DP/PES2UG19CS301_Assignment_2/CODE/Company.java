// PRIYA MOHATA - PES2UG19CS301
public class Company {
    public static void main(String args[]) {
        int test=3;
        System.out.println("Task level is :"+test);
        Developer developer=new Developer(test);
        TechLead techlead=new TechLead(test);
        Manager manager=new Manager(test);
        System.out.println("Task name : "+manager.taskName);
        System.out.println("Task type : "+manager.taskType);
        System.out.println("Task size : "+manager.taskSize);
        System.out.println("Task status : "+manager.taskStatus);
        manager.setSuccessor(techlead);
        techlead.setSuccessor(developer);
        manager.taskOpen();
        manager.taskExecute();
        }
}


