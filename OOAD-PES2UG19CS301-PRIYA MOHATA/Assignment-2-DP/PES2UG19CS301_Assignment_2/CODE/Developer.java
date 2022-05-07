public class Developer extends Task
{
    public Developer(int taskLevel){
        super(taskLevel);
    }

    public void taskOpen()
    {
        successor.taskOpen();
    }

    public void taskExecute()
    {
        if(super.taskLevel==1)
        {
            System.out.println("Task executed by Developer!");
        }

        else if (successor != null)
        {
            successor.taskExecute();
        }
    }
}