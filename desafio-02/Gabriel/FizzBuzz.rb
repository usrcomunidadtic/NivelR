def fizz_buzz(var)
    if (var % 3 == 0) && (var % 5 == 0)
        "FizzBuzz"
    elsif var % 3 == 0
        "Fizz"
    elsif var % 5 == 0
        "Buzz"
    else
        var
    end
end

def inicio
    for i in 1..100 
        p fizz_buzz(i)
    end
end

inicio

