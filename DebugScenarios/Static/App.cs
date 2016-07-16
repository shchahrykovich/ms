using System;

public class Program
{
    public class MyClass
    {
        private static int _counter;
        
        public MyClass()
        {
            _counter++;
        }
        
        public void PrintCounter()
        {
            Console.WriteLine(_counter.ToString());    
        }
    }   

    public class ParentClass 
    {
        public void CreateMyClass()
        {
            var obj = new MyClass();
            obj.PrintCounter();    
        }
    }

    public static void Main (string[] args)
    {
	    int counter = 0;
		int maxObjectCount = 100000;
		
		ParentClass[] objects = new ParentClass[maxObjectCount];		
		while(true)
		{
			objects[counter] = new ParentClass();
            objects[counter].CreateMyClass();			
			counter++;
			
			if (maxObjectCount == counter)
			{
				objects = new ParentClass[maxObjectCount];
				counter = 0;
			}
		}
    }   
} 