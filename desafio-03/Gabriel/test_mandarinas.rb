require "test/unit"
require_relative 'ArbolMandarinas.rb'

class TestArbolMandarinas < Test::Unit::TestCase

    @@m = ArbolMandarinas.new(100, 1)

    def test_altura_inicio
        assert_equal(100, @@m.altura())
    end

    def test_cantidad_inico
        assert_equal(0, @@m.mandarinas())
    end

    def test_edad_al_anio
        @@m.paso365Dias()
        assert_equal(2, @@m.edad )
    end

    def test_cantidad_final
        @otro = ArbolMandarinas.new(800, 20)
        assert_equal(0, @otro.mandarinas)
    end

end