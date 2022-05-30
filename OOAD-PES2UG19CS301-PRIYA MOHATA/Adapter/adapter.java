//Java implementation of Adapter pattern

interface Bird
{
	// birds implement Bird interface that allows
	// them to fly and make sounds adaptee interface
	public void fly();
	public void makeSound();
}

class Sparrow implements Bird
{
	// a concrete implementation of bird
	// Write your code here
    @Override
    public void fly(){
        System.out.println("Bird is flying");
    }

    @Override
    public void makeSound(){
        System.out.println("cheep cheep");
    }
}

interface ToyDuck
{
	// target interface
	// toyducks dont fly they just make
	// squeaking sound
	public void squeak();
}

class PlasticToyDuck implements ToyDuck
{
	// write your code here
    @Override
    public void squeak(){
        System.out.println("Quack Quack");
    }
}

class BirdAdapter implements ToyDuck
{
    Bird bird;
    public BirdAdapter(Bird bird)
    {
        this.bird = bird;
    }
  
    @Override
    public void squeak()
    {
        bird.makeSound();
    }
}

class adapter
{
	public static void main(String args[])
	{
		Sparrow sparrow = new Sparrow();
		ToyDuck toyDuck = new PlasticToyDuck();
        ToyDuck birdAdapter = new BirdAdapter(sparrow);

        sparrow.fly();
        sparrow.makeSound();

        toyDuck.squeak();
        birdAdapter.squeak();

		// Wrap a bird in a birdAdapter so that it
		// behaves like toy duck
		// write your code

		// toy duck behaving like a bird
		//write your code
	}
}


