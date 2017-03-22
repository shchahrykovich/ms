using System;
using System.Runtime.CompilerServices;

public class Worker2
{
    [MethodImpl(MethodImplOptions.NoInlining)]
    public void Process()
    {
        try
        {
            throw new Exception("42");
        }
        finally
        {
            Program.Counter++;
        }
    }
}

public class Worker1
{
    [MethodImpl(MethodImplOptions.NoInlining)]
    public void Process()
    {
        try
        {
            Worker2 w = new Worker2();
            w.Process();
        }
        finally
        {
            Program.Counter++;
        }
    }
}

public class Program
{    
    public static int Counter;

    public static void Main (string[] args)
    {
        Process();
    }   

    [MethodImpl(MethodImplOptions.NoInlining)]
    public static void Process()
    {
        while(true)
        {
            try
            {
                Worker1 w = new Worker1();
                w.Process();    
            }
            catch
            {
                Counter++;
            }
        }
    }
} 