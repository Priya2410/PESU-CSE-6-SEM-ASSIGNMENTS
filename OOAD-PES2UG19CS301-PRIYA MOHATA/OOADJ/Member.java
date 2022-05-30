abstract class Member{

    String membername;
    String memberType;

    public Member(String membername){
        this.membername=membername;
    }

    abstract void addtodb(String name); 

}

abstract class Booking extends Member{

    public Booking(String membername,String memberType){
        super(membername);
    }
}
class LifeTimeMember extends Booking{

    public LifeTimeMember(String membername){
        //super(membername);
        this.memberType="Lifetime member";
    }

    void addtodb(String name){
        System.out.println("Added details to database");
    }
} 

class AnnualMember extends Booking{

    public AnnualMember(String membername){
        //super(membername);
        this.memberType="Annual member";
    }

    void addtodb(String name){
        System.out.println("Added details to database");
    }
}

class Enquiry extends Member{

    public Enquiry(String membername){
        super(membername);
        this.memberType="Enquiry Member";
    }

    void addtodb(String name){
        System.out.println("Enquire member added");
    }

}



