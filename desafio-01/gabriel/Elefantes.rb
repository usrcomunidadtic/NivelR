# Para nivel R por Gabriel

class Elefante


  attr_accessor :primeros, :lista, :aparte, :decimales

  $z = 10
  $a = 2
  $b = 1

  def initialize(lista, primeros, aparte, decimales)
       @lista = lista
       @primeros = primeros
       @aparte = aparte
       @decimales = decimales
  end

  def calculo(param)
    if param <= 10
       @lista << @primeros[param]
    elsif param > 10 && param < 20
       @lista << @aparte[param]
    elsif param >= 20
      if param % 10 == 0
        $z+=10
        @lista << @aparte[$z]
      else
        until $b > 9
          @lista << "#{@decimales[$a]}" + "#{@primeros[$b]}"
          $b +=1
        end
        $b = 1
        $a +=1
      end
    end
  end

  def agregar
    numero = 2
    until numero > 100
        calculo(numero)
        if numero > 20 && numero % 10 != 0
          numero += 9
        else
          numero += 1
        end  
    end
  end

  def cancion
    agregar()
    puts 'Un elefante se columpiaba'    
    @lista.each do |n|
      puts "#{n} elefantes se columpiaban"
    end 
    # puts @lista.length
  end

  def prueba 
    cancion()
    @lista.length
  end

end

$primeros = { 
    1 => "Uno", 
    2 => "Dos", 
    3 => "Tres", 
    4 => "Cuatro",
    5 => "Cinco",
    6 => "Seis",
    7 => "Siete",
    8 => "Ocho",
    9 => "Nueve",
    10 => "Diez" 
}

$aparte = {
    11 => "Once",
    12 => "Doce",
    13 => "Trece",
    14 => "Catorce",
    15 => "Quince",
    16 => "Dieciseis",
    17 => "Diecisiete",
    18 => "Dieciocho",
    19 => "Diecinueve",
    20 => "Veinte",
    30 => "Treinta",
    40 => "Cuarenta",
    50 => "Cincuenta",
    60 => "Sesenta",
    70 => "Setenta",
    80 => "Ochenta",
    90 => "Noventa",
    100 => "Cien"
}

$decimales = {
    1 => "Dieci",
    2 => "Veinti",
    3 => "Treinta y ",
    4 => "Cuarenta y ",
    5 => "Cincuenta y ",
    6 => "Sesenta y ",
    7 => "Setenta y ",
    8 => "Ochenta y ",
    9 => "Noventa y ",
}

$lista = Array.new

ar = Elefante.new($lista, $primeros, $aparte, $decimales)

# ar.cancion()

# # Template TEST.
# require 'test/unit'
# # require_relative 'Script a probar.rb'
# class Nombre_Clase < Test::Unit::TestCase
# def test_digitos 
#   assert_equal( @lista.length, 99 )
# end
# end
