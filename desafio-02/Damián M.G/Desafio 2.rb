#encoding: utf-8

#Desafío 2 - Kata TDD FizzBuzz
#Fizz Buzz. Kata TDD sin cosas raras.
#
#Tipo Home. Objetivo: Aplicar TDD simple, sin mokcs ni stub.
#
#El enunciado del ejercicio es el siguiente:
#Imagínate el siguiente escenario. Tienes 11 años y en los últimos 5 minutos del final de la lección, tu profesor de matemáticas decide hacer la clase más divertida, introduciendo un
#juego. El explica que irá señalando a cada compañero de clase en orden y preguntándole el siguiente número de la secuencia, comenzando por el número uno. La parte divertida es que, si
#el número es divisible por 3, tienes que decir “Fizz” en vez del número. Y si es divisible por 5, debes decir “Buzz”. Las matemáticas no es tu fuerte y tienes miedo de que te llegue el
#turno y no sepas qué decir. Así que, con el fin de evitar la vergüenza delante de toda la clase, tienes que obtener la lista completa impresa para saber qué decir. Tu clase tiene unos
#33 alumnos y se pueden llegar a hacer unas tres rondas antes de que suene el timbre para el recreo. La siguiente clase de matemáticas es el jueves. ¡Codifícalo!
#
#Enunciado:
#Escribe un programa que imprima los números del 1 al 100, pero aplicando las siguientes normas:
#Devuelve Fizz si el número es divisible por 3.
#Devuelve Buzz si el número es divisible por 5.
#Devuelve FizzBuzz si el número es divisible por 3 y por 5.
#Salida de ejemplo: 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 Fizz Buzz 16 17 Fizz 19 Buzz … etc hasta el 100
#
#Fase 2 – Nuevos requerimientos:
#Un número es Fizz si es divisible por 3 o si incluye un 3 en el número Un número es Buzz si es divisible por 5 o si incluye un 5 en el número
#
#El proceso para aplicar TDD es el siguiente:
#1- Definimos la prueba unitaria. (Preparar valores, hacer, Assert) 2- Ejecutar la prueba y falla. 3- Agregar código mínimo necesario para pasar la prueba.
#Y probar hasta que pase (o luz verde) 4- Refactorizar el código. Aplicar los principios SOLID.

#Nota del autor del siguiente código: no me siento cómodo utilizando la técnica TDD, si voy a escribir testeos, la mayor cantidad que se puedan escribir.
#Como para no hacer dos archivos diferentes incluí los test acá adentro, no es sugerido en proyectos mas grandes.


#Una instancia de esta clase representa un determinado juego en clase por el profesor.
class JuegoEnClase

	#Constructor
	def initialize(cantidad_de_alumnos)
		@cantidad_de_alumnos = cantidad_de_alumnos #: Fixnum
	end

	#Imprime en "hoja" el machete de la secuencia de palabras que deben decir los alumnos al ser preguntados por el profesor.
	def imprimir_machete(rondas_del_juego = 1)
		1.upto(@cantidad_de_alumnos.*(rondas_del_juego)) do |numero|
			print juzgar_numero(numero).<<(' ')
		end
		print "\n\n"
	end

	private
	
	#Juzga el *numero* pasado como argumento devolviendo Fizz si este es divisible por 3 o si incluye el número 3 en sí, Buzz si este es divisible por 5 o si incluye el número 5 en sí,
	#FizzBuzz si el número es divisible por 3 y por 5. La devolución siempre es en #String.
	def juzgar_numero(numero)
		if (numero.%(3).==(0)) && (numero.%(5).==(0))
			'FizzBuzz'
		elsif (numero.%(3).==(0)) || (numero.to_s.match(/3/))
			'Fizz'
		elsif (numero.%(5).==(0)) || (numero.to_s.match(/5/))
			'Buzz'
		else
			numero.to_s
		end
	end
end

##########################TESTEO#############################

require 'test/unit'

class Testeo < Test::Unit::TestCase

	def test_juzgar_numero
		#observar que utilizo send() ya que juzgar_numero() es un método privado y de esta manera "hackeo" lo que es privado y prtegido(protected)
		assert_equal('FizzBuzz', JuegoEnClase.new(33).send(:juzgar_numero, 15))
		assert_equal('FizzBuzz', JuegoEnClase.new(33).send(:juzgar_numero, 30))
		assert_equal('FizzBuzz', JuegoEnClase.new(33).send(:juzgar_numero, 45))
		assert_equal('FizzBuzz', JuegoEnClase.new(33).send(:juzgar_numero, 60))
		assert_equal('FizzBuzz', JuegoEnClase.new(33).send(:juzgar_numero, 75))
		assert_equal('FizzBuzz', JuegoEnClase.new(33).send(:juzgar_numero, 90))
		#con dos de los siguientes me parece bien...
		assert_equal('Fizz', JuegoEnClase.new(33).send(:juzgar_numero, 6))
		assert_equal('Fizz', JuegoEnClase.new(33).send(:juzgar_numero, 24))
		#con dos de los siguientes me parece bien...
		assert_equal('Buzz', JuegoEnClase.new(33).send(:juzgar_numero, 40))
		assert_equal('Buzz', JuegoEnClase.new(33).send(:juzgar_numero, 85))
		#con cuatro de los siguientes me parece bien...
		assert_equal('74', JuegoEnClase.new(33).send(:juzgar_numero, 74))
		assert_equal('61', JuegoEnClase.new(33).send(:juzgar_numero, 61))
		assert_equal('2', JuegoEnClase.new(33).send(:juzgar_numero, 2))
		assert_equal('4', JuegoEnClase.new(33).send(:juzgar_numero, 4))
	end
end

##########################RUN##############################

juego_en_clase = JuegoEnClase.new(33)
juego_en_clase.imprimir_machete(3)