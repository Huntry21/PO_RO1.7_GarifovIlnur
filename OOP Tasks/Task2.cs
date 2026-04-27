using System;

public class BankAccount
{
    public string Owner { get; }
    public decimal Balance { get; private set; }

    public BankAccount(string owner, decimal initialDeposit)
    {
        if (initialDeposit < 0) throw new ArgumentException("Initial deposit cannot be negative");
        Owner = owner;
        Balance = initialDeposit;
    }

    public void Deposit(decimal amount)
    {
        if (amount > 0)
        {
            Balance += amount;
        }
    }

    public void Withdraw(decimal amount)
    {
        if (amount <= 0) return;
        if (amount > Balance) throw new InvalidOperationException("Insufficient funds");
        Balance -= amount;
    }

    public void PrintStatement()
    {
        Console.WriteLine($"Owner: {Owner}, Balance: {Balance:C}");
    }
}

class Program
{
    static void Main()
    {
        BankAccount acc = new BankAccount("Nurik", 100m);
        acc.Deposit(50m);
        acc.Withdraw(30m);
        acc.PrintStatement();

        // acc.Balance = 9999m; // Compile error: The property 'Balance' cannot be assigned to because the set accessor is private.

        try
        {
            acc.Withdraw(1000m);
        }
        catch (InvalidOperationException e)
        {
            Console.WriteLine(e.Message);
        }
    }
}