using System;

public class Temperature
{
    private double _celsius;

    public double Celsius
    {
        get => _celsius;
        set
        {
            if (value < -273.15) throw new ArgumentOutOfRangeException("Temperature below absolute zero");
            _celsius = value;
        }
    }

    public double Fahrenheit
    {
        get => _celsius * 9 / 5 + 32;
        set => Celsius = (value - 32) * 5 / 9;
    }

    public Temperature(double celsius)
    {
        Celsius = celsius;
    }

    public void Print()
    {
        Console.WriteLine($"{Celsius:0.##}°C / {Fahrenheit:0.##}°F");
    }
}

class Program
{
    static void Main()
    {
        try
        {
            Temperature t = new Temperature(25);
            t.Print();

            t.Fahrenheit = 100;
            t.Print();

            t.Celsius = -300;
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
        }
    }
}