require "test/unit"

def FizzBuzzIt(num)
    out = ''
    if (num % 3) == 0
        out = out + 'Fizz'
    end
    if (num % 5) == 0
        out = out + 'Buzz'
    end
    if out == '' 
        out = num
    end
    return out 
end

for i in 1..100
    puts "#{i}: #{FizzBuzzIt(i)}"
end

class FizzBuzzTest < Test::Unit::TestCase
    def test_class
        assert_equal(1,FizzBuzzIt(1))
    end

    def test_divisibles_tres
        assert_equal('Fizz', FizzBuzzIt(3))
        assert_equal('Fizz', FizzBuzzIt(24))
        assert_equal('Fizz', FizzBuzzIt(36))
    end

    def test_divisibles_cinco
        assert_equal('Buzz', FizzBuzzIt(5))
        assert_equal('Buzz', FizzBuzzIt(25))
        assert_equal('Buzz', FizzBuzzIt(55))
    end

    def test_divisible_tres_cinco
        assert_equal('FizzBuzz', FizzBuzzIt(15))
        assert_equal('FizzBuzz', FizzBuzzIt(45))
        assert_equal('FizzBuzz', FizzBuzzIt(75))
    end
end
