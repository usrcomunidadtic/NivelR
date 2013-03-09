#ejercicio_factoriales
## Requisitos via Ejemplos:
#Para todo entero positivo n, el factorial de n o n factorial se define como e#l producto de todos 
#los números enteros positivos desde 1 (es decir, los números naturales) hasta n.

# # 0 = 1
# # -8 = nil
# # 1 = 1
# # 2 = 2
# #	3 = 6
# # 4 = 24
# # 20 = 2.432.902.008.176.640.000

#Codigo
def factorial(parametro)
	if parametro < 0 
		return nil
	end
	if parametro == 0
		return 1 
	end
	parametro * (factorial(parametro-1))
end

#--
#Template TEST.
require 'test/unit'
#require_relative 'Script a probar.rb'
class Nombre_Clase  < Test::Unit::TestCase
  def test_factorial_negativo
      assert_equal( nil ,factorial(-8))
  end

  def test_factorial_de_cero
  	assert_equal(1, factorial(0))
  end

  def test_factorial_normal
  	assert_equal(1, factorial(1))
  	assert_equal(2, factorial(2))
  	assert_equal(6, factorial(3))
	assert_equal(24, factorial(4))
	assert_equal( 2432902008176640000, factorial(20))
  end

end