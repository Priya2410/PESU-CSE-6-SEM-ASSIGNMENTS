
public class TechLead extends Task
{
    TechLead(int taskLevel){
        super(taskLevel);
    }

    public void taskOpen(){
        if(super.taskLevel==  1){
            System.out.println("Task opened by Tech Lead!");
        }

        else if (successor != null){
            successor.taskOpen();
        }
    }

    public void taskExecute(){
        if(super.taskLevel==2){
            System.out.println("Task executed by TechLead!");
        }

        else if (successor != null){
            successor.taskExecute();
        }
    }
}