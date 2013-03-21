# encoding: UTF-8
# La linea anterior es para Retrocompatibilidad con Ruby 1.9

#Cancion de los Elefantes. Version orientada a objetos.
#El objetivo es escribir la letra de la cación infantil hasta 100 elefantes.

class Numeric
	def to_palabras
		#v1.3 hasta 1000 y faltan tildes en los nombres de los numeros y excepciones. Faltan menores que 0. Falta el genero del articulo para docientos euros o docientas pecetas.
		if self < 0 || self >= 1000
			return 'Error de Parametro' 
		end

		unidades = %w(cero uno dos tres cuatro cinco seis siete ocho nueve)
		decenas = %w(nil diez veinte treinta cuarenta cincuenta sesenta setenta ochenta noventa)
		centenas = %w(nil ciento docientos trecientos cuatrocientos quinientos seicientos tetecientos ochocientos novecientos)
		#seguir con Unidad de Mil, decena de mil, centena de mil, unidad de millon,...
		
		diecis = %w(diez once doce trece catorce quince)

		#Inicializo variables
		palabra = ""
		iCuantasCentenas = 0
		iCuantasDecenas = 0
		iCuantasUnidades = 0
		iNumero = self.to_i
		
		#Cuantas Centenas
		iCuantasCentenas = iNumero / 100
	    iNumero -= (iCuantasCentenas * 100)
	    #Cuantas Decenas
	    iCuantasDecenas = iNumero / 10
	    iNumero -= (iCuantasDecenas * 10)
	    
	    #Cuantas Unidades
		iCuantasUnidades = iNumero 

		if iCuantasCentenas >= 1 
			if iCuantasDecenas > 0 || iCuantasUnidades > 0
			  palabra += "#{centenas[iCuantasCentenas].to_s} "
		 	else
			  palabra += "cien"
			end 
		end
		
		if iCuantasDecenas > 0
			if iCuantasDecenas == 1
				if iCuantasUnidades >= 6
					palabra += "dieci#{unidades[iCuantasUnidades].to_s}"
				else
					palabra += (diecis[iCuantasUnidades].to_s) #"10 a 15"
				end
			

			elsif iCuantasDecenas == 2 
				if iCuantasUnidades > 0
					palabra += "veinti" #veinti[iCuantasUnidades].to_s
				else
					palabra += "veinte"
				end
			

			elsif iCuantasDecenas >= 3
				if iCuantasUnidades > 0 
					palabra += "#{decenas[iCuantasDecenas].to_s} y " 
				else
					palabra += decenas[iCuantasDecenas].to_s
				end
			end

		end


		if iCuantasUnidades > 0 && (iCuantasDecenas !=1 && iCuantasCentenas >= 0)
				palabra += unidades[iCuantasUnidades]
		elsif iCuantasUnidades == 0 && (iCuantasDecenas == 0 && iCuantasCentenas == 0)
				palabra = "cero"
		end

	
		return palabra
	end
end



class Elefantes
	attr_reader :elefantes

	def initialize
		@elefantes = 1
	end

	def llamar_otro_elefante
		@elefantes += 1
	end

end

class Cancion_Elefantes
	def escribir_letra(elefantes)
		if elefantes == 1 
			puts "Un (1) elefante se columpiaba sobre la tela de una araña, como veía que resistía"
			puts "fue a llamar a otro elefante...\n"
		else
			puts "#{elefantes.to_palabras} (#{elefantes}) elefantes se columpiaban sobre la tela de una araña, como veían que resistían..."
			puts "fueron a llamar a otro elefante...\n"
		end
	end

	def cantar_hasta(hasta)
		manada = Elefantes.new() 
		(hasta.to_i).times do 
			self.escribir_letra(manada.elefantes)
			manada.llamar_otro_elefante
		end
	end
end


#Escribir Cancion...
letra = Cancion_Elefantes.new()
letra.cantar_hasta(100)


