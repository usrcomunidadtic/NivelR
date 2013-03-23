=begin
Enunciado:
Escribe un programa que imprima los números del 1 al 100, pero aplicando las siguientes normas:
OK ->Devuelve Fizz si el número es divisible por 3.
OK ->Devuelve Buzz si el número es divisible por 5.
OK ->Devuelve FizzBuzz si el número es divisible por 3 y por 5.
Salida de ejemplo: 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz … etc hasta el 100
Fase 2 – Nuevos requerimientos:
OK ->Un número es Fizz si es divisible por 3 o si incluye un 3 en el número
OK ->Un número es Buzz si es divisible por 5 o si incluye un 5 en el número
------------------
esto me faltoooo
-------------------
El proceso para aplicar TDD es el siguiente:
1- Definimos la prueba unitaria. (Preparar valores, hacer, Assert)
2. Ejecutar la prueba y falla.
3- Agregar código mínimo necesario para pasar la prueba. Y probar hasta que pase (o luz verde)
4- Refactorizar el código. Aplicar los principios SOLID.	
=end
numero = 0
until numero == 100
	numero += 1 
	if (numero%3 == 0) && (numero%5 == 0)
		puts "FizzBuzz"
	elsif (numero%3 == 0) || (numero.to_s.match(/3/)) #la unica solucion q se me ocurrio es usar expresiones XD	
		puts "Fizz"
	elsif (numero%5 == 0) || (numero.to_s.match(/5/)) 
		puts "Buzz"
	else
		puts numero
	end
end
