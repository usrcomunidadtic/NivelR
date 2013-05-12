#--
#Template TEST.
require 'test/unit'
require_relative 'clase_matematicas.rb'

class Nombre_Clase < Test::Unit::TestCase

    def test_numero_negativo
        assert_equal( nil ,devolucion(-3))
    end

    def test_numero_cero
        assert_equal( "FizzBuzz" , devolucion(0))
    end

    def test_numeros_mayores_a_cero
        
        assert_equal( 1, devolucion(1))
        assert_equal( 2, devolucion(2))
        assert_equal( "Fizz", devolucion(3))
        assert_equal( 4, devolucion(4))
        assert_equal( "Buzz", devolucion(5))
        assert_equal( "FizzBuzz", devolucion(15))

    end

end

=begin

    SOLID
    
    S – Single Responsibility Principal.

        Principio de unica responsabilidad: Un objeto solo debe tener una única responsabilidad.

    O – Open Closed Principle

        Open: Una entidad debe estar abierta a implementación

        Close Una entidad deber estar abierta a modificación

    L – Liskov Substitution Principle

        Una clase B debe cumplir todas las especificaciones de A siendo B una clase heredada de A.

    I – Interface Segregation Principle

        Cada Interface tiene que cumplir el principio de única responsabilidad

    D – Dependency Inversion Principle

        Nunca hemos de pasar de las especificaciones a la plataforma tecnológica en un solo paso.
    
=end