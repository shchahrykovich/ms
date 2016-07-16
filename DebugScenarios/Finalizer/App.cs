using System;

public class MyClass
{
	public int Id;
	
	~MyClass()
	{
		Console.WriteLine("~MyClass - " + Id);
	}
}

public class Program
{
    public static void Main (string[] args)
    {
		int counter = 0;
		int maxObjectCount = 100000;
		
		MyClass[] objects = new MyClass[maxObjectCount];		
		while(true)
		{
			objects[counter] = new MyClass();
			objects[counter].Id = counter;
			
			counter++;
			
			if (maxObjectCount == counter)
			{
				objects = new MyClass[maxObjectCount];
				counter = 0;
			}
		}
    }   
} 