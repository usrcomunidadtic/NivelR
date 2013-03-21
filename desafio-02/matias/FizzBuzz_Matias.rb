
class Alumnos
  attr_accessor :numero_de_orden
  @@instancias = []
	
  def initialize
       @@instancias.push self 
	   @numero_de_orden = @@instancias.size
  end

  def check_parametro(parametro_check)
    #is Integer? #puts "expre: #{!!(parametro_check.to_s =~ /^[-+]?[0-9]+$/) }"
    !!(parametro_check.to_s =~ /^[-+]?[0-9]+$/) && parametro_check.to_i <= 0 ? false : true
  end
  
  def que_digo(parametro)	
   if not self.check_parametro(parametro)
   	  return "Parametro equivocado, debe ser un número natural"
   elsif (parametro % 15) == 0 || parametro == 15
   	 	return	"FizzBuzz"
   elsif (parametro % 3) == 0 || parametro == 3
   	    return "Fizz"
     elsif (parametro % 5) == 0 || parametro == 5
   	    return "Buzz"

   	 else
   	    return	parametro
     end
   end

   def machete(cantidad) #Machete: eso que se hace para copiar en un examen, antiguamente una minima pieza de papel que contenia información clave para el examen.
    machete = []
    cantidad.times do  |i| 
      machete[i] = que_digo(i+1)
    end
    return machete
   end
end