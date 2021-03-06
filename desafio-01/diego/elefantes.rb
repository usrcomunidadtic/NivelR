# encoding: UTF-8
 
$fijos = { 
        1 => "Un", 
        2 => "Dos", 
        3 => "Tres", 
        4 => "Cuatro",
        5 => "Cinco",
        6 => "Seis",
        7 => "Siete",
        8 => "Ocho",
        9 => "Nueve",
        10=> "Diez",
        11=> "Once",
        12=> "Doce",
        13=> "Trece",
        14=> "Catorce",
        15=> "Quince",
        20=> "Veinte",
        30=> "Treinta",
        40=> "Cuarenta",
        50=> "Cincuenta",
        60=> "Sesenta",
        70=> "Setenta",
        80=> "Ochenta",
        90=> "Noventa",
        100=> "Cien",
}
 
$pre = {
        10 => "Dieci",
        20 => "Veinti",
        30 => "Treinta y ",
        40 => "Cuarenta y ",
        50 => "Cincuenta y ",
        60 => "Sesenta y ",
        70 => "Setenta y ",
        80 => "Ochenta y ",
        90 => "Noventa y ",
}
 
def obtener_numero_en_string(numero)
        if $fijos.has_key?(numero)
                return $fijos[numero]
        else
                decena = numero / 10 * 10
                unidad = numero % 10
                return "#{$pre[decena]}" + "#{$fijos[unidad].downcase}"
        end
end
 
def contar_elefantes(elefantes=2)
        puts "Un elefante se balanceaba sobre la tela de una araña, como veia que resistía fue a buscar a otro elefante mas.\n\n"
        
        while elefantes <= 100
                puts "#{obtener_numero_en_string(elefantes)} elefantes se balanceaban sobre la tela de una araña, como veian que resistían fueron a buscar a otro elefante mas.\n\n"
                elefantes = elefantes + 1
        end
end
 
contar_elefantes