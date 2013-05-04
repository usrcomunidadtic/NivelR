class ArbolMandarinas
	attr_accessor :altura,:edad,:cantidad_fruta

	def initialize
		@altura = 0
		@edad = 0
		@cantidad_fruta = 0
	end

	def crecer
		limpiarArbol()
		@edad += 1
		@altura += rand(30..60)
		if @edad > 20 then
			#El árbol ha muerto...
		  else
			#Llego la primavera...
			generarFruta()
		end
	end

	def generarFruta
		#Genera aleatoriamente según la edad de la planta.
		case @edad 
		when 0..8
			@cantidad_fruta = 0
		when 9..10
			@cantidad_fruta = rand(0..600)
		when 11..15
			@cantidad_fruta = rand(600..800)
		when 15..20
			@cantidad_fruta = rand(300..800)
		end		
	end

	def contarMandarinas
		@cantidad_fruta
	end

	def tomarUnaMandarina
		if cantidad_fruta > 0 
			@cantidad_fruta -= 1
			"La mandarina estaba deliciosa"
		else
			"No hay más mandarinas"
		end
	end

	def limpiarArbol
		@cantidad_fruta = 0
	end

end

class Entorno
	def paso365Dias(objeto)
		objeto.crecer
	end
end