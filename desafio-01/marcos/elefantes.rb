unidades = %w(Uno Dos Tres Cuatro Cinco Seis Siete Ocho Nueve Diez)

decenas = %w(Treinta Cuarenta Cincuenta Sesenta Setenta Ochenta Noventa)

$unicos = { 
    11 => 'Once',
    12 => 'Doce',
    13 => 'Trece',
    14 => 'Catorce',
    15 => 'Quince',
    16 => 'Dieciseis',
    17 => 'Diecisiete',
    18 => 'Dieciocho',
    19 => 'Diecinueve',
    20 => 'Veinte',
    21 => 'Veintiuno',
    22 => 'Veintidos',
    23 => 'Veintitres',
    24 => 'Veinticuatro',
    25 => 'Veinticinco',
    26 => 'Veintiseis',
    27 => 'Veintisiete',
    28 => 'Veintiocho',
    29 => 'Veintinueve'
}

for i in 1..100
    sPlural = "s"
    nPlural = "n"
    vPlural = "ron"
    if i < 2 
        sPlural = ""
        nPlural = ""
        vPlural = ""
        out = 'Un' 
    elsif i > 1 && i < 11
        out = unidades[i - 1]
    elsif i > 10 && i < 30
        out = $unicos[i]
    elsif i > 29 && i < 100
        out = decenas[(i / 10) - 3] + (((i % 10) > 0) ? " y " + unidades[(i - 1) % 10].downcase : "")
    else
        out = 'Cien'
    end
    out += " elefante" + sPlural
    out += " se balanceaba" + nPlural
    out += " sobre la tela de una ara#a, como veia" + nPlural
    out += " que resistia" + nPlural
    out += " fue" + vPlural
    out += " a buscar a otro elefante mas."
    #puts out
end

#Template TEST.
require 'test/unit'
class Nombre_Clase < Test::Unit::TestCase
  def test_digitos 
    assert_equal($unicos[11], 'Once')
    assert_equal($unicos[12], 'Doce')
    assert_equal($unicos[13], 'Trece')
    assert_equal($unicos[14], 'Catorce')
    assert_equal($unicos[15], 'Quince')
    assert_equal($unicos[16], 'Dieciseis')
    assert_equal($unicos[16], 'Dieciseis')
  end
end
