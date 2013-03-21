=begin
Kata Fizz-Buzz.
OK Si el número es divisible por 3, tienes que decir “Fizz” en vez del número
OK Si es divisible por 5, debes decir “Buzz”. 
OK Devuelve FizzBuzz si el número es divisible por 3 y por 5.
OK Sino dice el Numero que es.
OK Tienes que obtener la lista completa impresa para saber qué decir
OK Tu clase tiene unos 33 alumnos y se pueden llegar a hacer unas tres rondas 
Salida Ejemplo:
 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz

Extra: Resto = dividendo - (divisor x cociente)
=end

require 'test/unit'
require './FizzBuzz_Matias.rb'

class Pruebas_Kata_FizzBuzz < Test::Unit::TestCase
  def setup
    @alumno = Alumnos.new
  end

  def test_parametros_invalidos
  	 assert_equal("Parametro equivocado, debe ser un número natural", @alumno.que_digo(-1))
   	 assert_equal("Parametro equivocado, debe ser un número natural", @alumno.que_digo(0) )
  end

  def test_numeros_normales
      assert_equal(1, @alumno.que_digo(1))
      assert_equal(2, @alumno.que_digo(2))
  end
 
  def test_Divisible_por_tres 
      assert_equal("Fizz", @alumno.que_digo(3))
      assert_equal("Fizz", @alumno.que_digo(6))
      assert_equal("Fizz", @alumno.que_digo(9))
      assert_equal("Fizz", @alumno.que_digo(12))
      assert_equal("Fizz", @alumno.que_digo(18))
  end

  def test_divisible_por_cinco
  	assert_equal("Buzz", @alumno.que_digo(5))
  end

  def test_divisible_por_quince
  	assert_equal("FizzBuzz", @alumno.que_digo(15))
    assert_equal("FizzBuzz", @alumno.que_digo(30))
  	assert_equal("FizzBuzz", @alumno.que_digo(45))
  end

  def test_imprimir_lista 
     assert_equal(33, @alumno.machete(33).size)
     puts @alumno.machete(99)
   # lista = []
   # 1.upto(99) do |index| 
   # 	lista[index] = @alumno.que_digo(index)
   # end
   # puts lista
   # assert_equal(100 ,lista.size )  
  end
end


