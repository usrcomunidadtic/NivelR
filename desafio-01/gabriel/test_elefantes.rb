require_relative 'Elefantes'
require "test/unit"

class TestElefante < Test::Unit::TestCase

    def test_simple
        assert_equal(99, Elefante.new($lista, $primeros, $aparte, $decimales).prueba())
    end

end