
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

