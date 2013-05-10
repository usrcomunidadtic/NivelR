#Orange tree. 
#Make an OrangeTree class that has a height method that returns its height
# and a one_year_passes method that, when called, ages the tree one year. Each year the tree grows taller 
#(how-ever much you think an orange tree should grow in a year), and
#after some number of years (again, your call) the tree should die.
#For the first few years, it should not produce fruit, but after a while it should, and 
#I guess that older trees produce more each year than younger trees...whatever you think makes the most sense.
#And, of course, you should be able to count_the_oranges (which
#returns the number of oranges on the tree) and pick_an_orange
#(which reduces the @orange_count by 1 and returns a string telling
#you how delicious the orange was, or else it just tells you that there
#are no more oranges to pick this year). Make sure any oranges you
#don’t pick one year fall off before the next year.
#Ejercicio del Libro: Aprende a programar con Ruby de Chris Pine

class OrangeTree
	def initialize 
		@years_old = 0
		@orange_count = 0
		@height = 0.25 #Entre 7 y 8 metros. Maximo 13 en condiciones optimas.
	end

	def one_year_passes
		if @orange_count >= 1
			puts ''
			puts "Una lastima se calleron del arbol y se pudrieron #{@orange_count} naranjas"
			puts ''
			@orange_count =0
		end

		@years_old = @years_old + 1
		@height = @height + (@height * 0.15) #Crece un 30% anual en altura.
		
		if @years_old == 40 
			puts "The orange tree has been died. There will be no oranges for a while."
			@orange_count = 0
			exit
		end

		if @years_old <= 9
			#Un arbol de naranja, no injertado, tarda unos 8 años en producir frutos.
			@orange_count = 0
			puts "Another year and nothing happened =("	
			#entre los 10 y los 15 años es el periodo de mayor producción.
		elsif @years_old >= 10 || @years_old <= 15
			#Serian unos 350 naranjas, como super exitoso 800
			@orange_count = ((rand(3..5)*100) + (rand(5)*10) + rand(9)).to_i
			puts "Excelente Year! We have obtained a lot of oranges. It was #{@orange_count} =D"
			else
			@orange_count = (rand(3)*100 + rand(5)*10 + rand(9)).to_i
			puts "Good Work! This year we have obtained an average production. It was #{@orange_count} =)"
		end
	end

	def height
		@height
	end
	def years_old
		@years_old
	end
	def orange_count
		@orange_count
	end
	def hay
		@orange_count >= 1
	end

	def pick_an_orange
		while true do
				print "Quiere tomar una Naranja del arbol?"
				respuesta = ''
				respuesta = gets.chomp
				if respuesta.downcase == 'si'
					@orange_count = @orange_count - 1
					puts 'mmmm que rica estaba esa naranja'
					puts "quedan #{@orange_count} naranja/s"
					if hay
						pick_an_orange
					end
					true
				else
				  false
				  break
				end
		end 
	end



end #Class end.

#Probando el codigo.

naranjito = OrangeTree.new

puts "Edad #{naranjito.years_old}"
puts "Altura #{naranjito.height}"
puts "Cantidad de Naranjas: #{naranjito.orange_count}"

while true do 
	print "Desea que pase otro annio? (Escriba SI para continuar, o NO para finalizar): "
	respuesta = gets.chomp
	if respuesta.downcase == 'si'
		naranjito.one_year_passes
		if naranjito.hay
			naranjito.pick_an_orange
		end
		true
	else
		break 
	end
	puts "Edad #{naranjito.years_old}"
    puts "Altura #{naranjito.height}"
    puts "Cantidad de Naranjas: #{naranjito.orange_count}"
   	puts "\n\n\n"
end

puts "I\'ll be back"