public abstract class Task {
    String taskName="Project Requirements Specification Discussion";
    String taskType="Meeting";
    String taskStatus="Completed";
    int taskLevel;
    String taskSize="Medium";
    String effortRequired="5 days";
    protected Task successor;

    Task(int taskLevel)
    {
        this.taskLevel=taskLevel;
    }

    public void setSuccessor(Task successor) {  
        this.successor = successor;  
    }

    public abstract void taskOpen();
    public abstract void taskExecute();
}

