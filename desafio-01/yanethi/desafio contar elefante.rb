def contador_elefantes()

singular = " elefante se balanceaba sobre la tela de una arana, como veia que resistia fue a llamar otro elefante..."
plural = " elefantes se balanceaban sobre la tela de una arana, como veian que resistian fueron a llamar otro elefante..."

  1.upto(100) do |numero|     #Estructura repetitiva del 1 al 100

    unidades = [nil, 'un', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 'ocho', 'nueve']
    decenas = [nil, 'dieci', 'veinti', 'treinta', 'cuarenta', 'cincuenta', 'sesenta', 'setenta', 'ochenta', 'noventa']
    especiales = {10 => 'diez', 11 => 'once', 12 => 'doce', 13 => 'trece', 14 => 'catorce', 15 => 'quince', 20 => 'veinte', 100 => 'cien'}

    if especiales.has_key?(numero)      #Preguntamos si existe la llave en el hash especiales

        puts "#{especiales[numero].capitalize}#{plural}"

      else                              #Si no pertenece

        decena, unidad = numero.to_s.rjust(2,'0').scan(/\d/).collect{|i| i.to_i}      #Convertimos a String, utilizamos el método rjust para las unidades, luego utilizamos scan y luego el método map para crear un array con valores enteros
        palabras = []
        palabras << decenas[decena]

        texto_1 = "#{decenas[decena]}"
        texto_2 = texto_1 + "#{' y ' if decena > 2 && unidad > 0}"
        texto_3 = texto_2 + "#{unidades[unidad]}"

        if texto_3 == "un"
          puts "#{texto_3.capitalize}#{singular}"
        else
          puts "#{texto_3.capitalize}#{plural}"
        end
    end
  end
end

contador_elefantes()

