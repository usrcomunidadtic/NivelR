require 'test/unit'
require_relative 'FizzBuzz.rb'

class Prueba < Test::Unit::TestCase

    def test_tres_divisible
        assert_equal("Fizz", fizz_buzz(3))
        assert_equal("Fizz", fizz_buzz(9))
        assert_equal("Fizz", fizz_buzz(21))
    end

    def test_cinco_divisible
        assert_equal("Buzz", fizz_buzz(5))
        assert_equal("Buzz", fizz_buzz(10))
        assert_equal("Buzz", fizz_buzz(20))
    end

    def test_tres_cinco_divisible
        assert_equal("FizzBuzz", fizz_buzz(30))
        assert_equal("FizzBuzz", fizz_buzz(60))
        assert_equal("FizzBuzz", fizz_buzz(90))
    end
end