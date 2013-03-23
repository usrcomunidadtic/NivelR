#encoding: utf-8

#demuestra el funcionamiento diferente en return() entre un Proc.new y un lambda

class A
	def un_metodo_1
		a = [1, 2]
		proc = Proc.new do
			return 1
		end
		proc.call
		2
	end

	def un_metodo_2
		un_lambda = lambda do
			return 1
			puts "siguiendo con el lambda"
		end
		un_lambda.call
		# => 1
		puts "debajo del llamado a lambda....no retornó de un_metodo_2()"
		2
	end
end

#####################

a = A.new
puts "Resultado con return de Proc.new => #{a.un_metodo_1}"
puts "Resultado con return de lambda => #{a.un_metodo_2}"

#Resultado con return del método en donde está lambda Proc.new => 1
#debajo del llamado a lambda....no retornó de un_metodo_2()
#Resultado con return del método en donde está lambda => 2