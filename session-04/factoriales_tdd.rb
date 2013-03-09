#### Codigo a probar #####
def factorial(n)
	n == 0 ? 1 : n * factorial(n-1)
end


## Requisitos via Ejemplos:
#Para todo entero positivo n, el factorial de n o n factorial se define como e#l producto de todos 
#los números enteros positivos desde 1 (es decir, los números naturales) hasta n.

# * 0 = 1
# * 1 = 1
# * 2 = 2
# * 4 = 24
# * 20 = 2.432.902.008.176.640.000

require 'test/unit'
#require_relative 'Numero_a_nombre_numero.rb'
class Prueba_de_Numeros_Factoriales  < Test::Unit::TestCase
 def test_factorial_0 
      assert_equal(1 , factorial(0) )
      assert_equal(1 , factorial(1) )
 end
 def test_factorial_de_2
 	assert_equal(2, factorial(2))
 end

 def test_factorial_de_3
 	assert_equal(6, factorial(3))
 end

 def test_factorial_de_4
 	assert_equal(24, factorial(4))
 end

 def test_factorial_de_20
 	assert_equal(2432902008176640000, factorial(20))
 end
end

#--
#Template TEST.
#require 'test/unit'
#require_relative 'Script a probar.rb'
#class Nombre_Clase  < Test::Unit::TestCase
#  def test_digitos 
      #assert_equal('valor esperado' , 'valor actual/devuelto' )
#  end