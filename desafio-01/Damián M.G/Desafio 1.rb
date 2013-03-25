#encoding: utf-8

#Desafío 1
#
#Tipo Homework. Aplicar estructuras de iteración e impresión por pantalla.
#
#Escriba una script que de al ejecutarlo esto: escriba la canción de los Elefantes hasta 100 elefantes.
#
#"Un elefante se balanceaba sobre la tela de una araña,
#como veía que resistía fue a buscar a otro elefante.
#Dos elefantes se balanceaban sobre la tela de una araña,
#como veían que resistía fueron a buscar a otro elefante más.
#Tres elefantes..."
#
#TIP: al imprimir no utilice acentos ni caracteres que no sean US-ASCII



#Una instancia de esta clase representa la clásica canción de los elefantes.
class CancionDeElefantes

	#Constructor
	def initialize(letra = '')
		@letra = letra
	end

	#Arma la letra de la canción.
	def armar_letra
		#primera frase, diferente a las siguiente, luego elefante es plural
		@letra.<<("Un elefante se balanceaba sobre la tela de una araña,\ncomo veía que resistía fue a buscar a otro elefante.\n")
		equivalencia_de_numeros_hasta_15_en_string = {1 => 'uno', 2 => 'dos', 3 => 'tres', 4 => 'cuatro', 5 => 'cinco', 6 => 'seis', 7 => 'siete', 8 => 'ocho', 9 => 'nueve', 10 => 'diez', \
			11 => 'once', 12 => 'doce', 13 => 'trece', 14 => 'catorce', 15 => 'quince'}
		#observar que 10 obtiene un valor raro, es porque "diez" está referenciado en el anterior #Hash, en este se utilica para los números entre 16 y 19
		equivalencia_de_multiplos_de_10_en_string = {10 => 'dieci', 20 => 'veinte', 30 => 'treinta', 40 => 'cuarenta', 50 => 'cincuenta', 60 => 'sesenta', 70 => 'setenta', 80 => 'ochenta', \
			90 => 'noventa', 100 => 'cien'}
		2.upto(100) do |iteracion|
			if (posible_numero_en_string = equivalencia_de_numeros_hasta_15_en_string[iteracion]).!=(nil)
				cantidad_de_elefantes_balanceandose = posible_numero_en_string.capitalize #: String
			elsif (posible_numero_en_string = equivalencia_de_multiplos_de_10_en_string[iteracion]).!=(nil)
				cantidad_de_elefantes_balanceandose = posible_numero_en_string.capitalize #: String
			else
				numero_de_la_derecha = iteracion.%(10) #: Fixnum
				multiplo_de_10 = iteracion.-(numero_de_la_derecha) #: Fixnum
				#notar que le quito la última letra a *equivalencia_de_multiplos_de_10_en_string[multiplo_de_10]*
				cantidad_de_elefantes_balanceandose = \
				  "#{equivalencia_de_multiplos_de_10_en_string[multiplo_de_10].[](0..-2)}i#{equivalencia_de_numeros_hasta_15_en_string[numero_de_la_derecha]}".capitalize
			end
			#anexo el número de elefantes balanceandoses a la nueva frase
			nueva_frase = cantidad_de_elefantes_balanceandose.<<(" elefantes se balanceaban sobre la tela de una araña,\ncomo veía que resistía fueron a buscar a otro elefante.\n") #: String
			#anexo la nueva frase a la letra de la canción
			@letra.<<(nueva_frase)
		end
	end

	#Muestra la letra.
	def mostrar_letra
		puts @letra
	end
end

##ejecución de código
cancion_de_elefantes = CancionDeElefantes.new
cancion_de_elefantes.armar_letra
cancion_de_elefantes.mostrar_letra



