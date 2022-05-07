public class Manager extends Task
{
    public Manager(int taskLevel){
        super(taskLevel);
    }

    public void taskOpen()
    {
        if(super.taskLevel==  2 || super.taskLevel==3){
            System.out.println("Task opened by Manager!");
        }
        else if (successor != null){
            successor.taskOpen();
        }
    }

    public void taskExecute()
    {
        if(super.taskLevel==3){
            System.out.println("Task executed by Manager!");
        }

        else if (successor != null){
            successor.taskExecute();
        }
    }
}

