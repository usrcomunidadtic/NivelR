require_relative "evento.rb"
def recorrer(array)
  array.each do |x|
	if x.respond_to?(:to_i)
		puts "entero #{x.to_i}"
	elsif x.respond_to?(:imprimir)
		puts x.imprimir
	else
	"No se puede convertir"
	end
   end
end




def recorrer_hash(hash)
	hash.each do |key,value|
	   puts "key: " + key.to_s + " value: " + value.to_s
	end
end
 	
def usar_while
 	a = 10 
	while a > 0 do 
	  puts "#{a}"
	  a = a - 1
	  if a == 2 
		puts "salimos"
		break
	  end
	end
end

################################
################################
####### HASH y ARRAYS  #########
################################
################################

a=[] #nuevo array
#agrego elementos a la varible
a << 1 
a << "array"
a << Evento.new("Corrientes","22/02/2013","Ruby Hangout")

recorrer a

h={} #nuevo hash
h[:saludo]="hola"
h[:bienvenida]=" sean bienvenidos "
h[:despedida]="chau"
h[:evento]=Evento.new("Corrientes","22/02/2013","Ruby Hangout")

recorrer_hash h
