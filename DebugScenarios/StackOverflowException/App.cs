using System;

public class Program
{
    public static void Main (string[] args)
    {
	DoWork();
    }   
   
    private static void DoWork()
    {
	DateTime now = DateTime.UtcNow;
	Console.WriteLine(now.ToString());
    	DoWork();
    }
} 