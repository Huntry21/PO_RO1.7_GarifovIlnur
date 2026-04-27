using System;

public class Student
{
    public string Name { get; set; }
    public int Grade1 { get; set; }
    public int Grade2 { get; set; }
    public int Grade3 { get; set; }

    public double GetAverage()
    {
        return (Grade1 + Grade2 + Grade3) / 3.0;
    }

    public string GetLetterGrade()
    {
        double average = GetAverage();
        if (average >= 90) return "A";
        if (average >= 75) return "B";
        if (average >= 60) return "C";
        return "F";
    }

    public void Print()
    {
        Console.WriteLine($"{Name} - Average: {GetAverage():F2}, Grade: {GetLetterGrade()}");
    }
}

class Program
{
    static void Main()
    {
        Student[] roster = new Student[4];
        roster[0] = new Student { Name = "Nurik", Grade1 = 85, Grade2 = 90, Grade3 = 92 };
        roster[1] = new Student { Name = "Ilnur", Grade1 = 70, Grade2 = 65, Grade3 = 75 };
        roster[2] = new Student { Name = "Max", Grade1 = 95, Grade2 = 98, Grade3 = 94 };
        roster[3] = new Student { Name = "Artur", Grade1 = 50, Grade2 = 60, Grade3 = 55 };

        foreach (Student s in roster)
        {
            s.Print();
        }

        Student best = roster[0];
        foreach (Student s in roster)
        {
            if (s.GetAverage() > best.GetAverage())
            {
                best = s;
            }
        }

        Console.WriteLine("\nStudent with the highest average:");
        best.Print();
    }
}