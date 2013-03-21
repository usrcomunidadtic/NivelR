require 'test/unit'
require_relative 'Numero_a_nombre_numero.rb'
class Numero_a_nombre_del_numero < Test::Unit::TestCase
  def test_digitos 
      assert_equal('cero' , 0.to_palabras )
      assert_equal('uno' , 1.to_palabras )
      assert_equal('nueve' , 9.to_palabras )
  end
 
  def test_diecis 
      assert_equal('diez' , 10.to_palabras )
      assert_equal('quince' , 15.to_palabras )
      assert_equal('dieciseis' , 16.to_palabras )
  end

  def test_veintis
      assert_equal('veinte', 20.to_palabras)
      assert_equal('veintinueve', 29.to_palabras)
  end

  def test_treinta_y_pico
    assert_equal('treinta', 30.to_palabras)
    assert_equal('treinta y uno', 31.to_palabras)
  end

  def test_decenas
    assert_equal('diez', 10.to_palabras)
    assert_equal('veinte', 20.to_palabras)
    assert_equal('treinta', 30.to_palabras)
    assert_equal('cuarenta', 40.to_palabras)
    assert_equal('cincuenta', 50.to_palabras)
    assert_equal('sesenta', 60.to_palabras)
    assert_equal('setenta', 70.to_palabras)
    assert_equal('ochenta', 80.to_palabras)
    assert_equal('noventa', 90.to_palabras)
  end

  def test_centenares
    assert_equal('cien', 100.to_palabras)
    assert_equal('ciento uno', 101.to_palabras)
    assert_equal('novecientos noventa y nueve', 999.to_palabras)
  end

  def test_valores_extremos
    assert_equal('Error de Parametro', 1000.to_palabras)
    assert_equal('cero', 0.5.to_palabras)
    assert_equal('Error de Parametro', -0.09.to_palabras)
  end
end