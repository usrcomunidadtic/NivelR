def devolucion(num)

	if num < 0
		return nil
	elsif num % 3 == 0 && num % 5 == 0
		return "FizzBuzz"
	elsif num % 5 == 0 || num.to_s.match(/5/)
		return "Buzz"
	elsif num % 3 == 0 || num.to_s.match(/3/)
		return "Fizz"
	else
		return num
	end
end

def contar()

	for i in 1..100
		puts devolucion(i)
	end

end
		
contar()

