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
			@cantidad_fruta = rand(1..600)
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

	def disminuirMandarinas(porcentaje)
		if @cantidad_fruta > 0
			@cantidad_fruta -= ((@cantidad_fruta * porcentaje)/100)
		end
	end

end

class Entorno
	attr_reader :plaga, :estado_clima
	def paso365Dias(objeto)
		objeto.crecer
		clima(objeto, rand(0..3)) 
		if rand(99) < 75 then
			huboPlaga(objeto, rand(1..2))
		else
			@plaga = false
		end
	end

	def huboPlaga(objeto, plaga)
		case plaga
		when 1 
			plagaMoscas(objeto)
			@plaga = true
		when 2 
			plagaGusanos(objeto)
			@plaga = true
		end
	end

	def plagaMoscas(objeto)
		objeto.disminuirMandarinas(90)
	end

	def plagaGusanos(objeto)
		objeto.disminuirMandarinas(40)
	end

	def clima(objeto,tipo)
		#Malo (-80%), Regular(-40), Bueno(+25), Muy Bueno(+50).
		case tipo
		when 0
			@estado_clima ='Malo'
			objeto.disminuirMandarinas(80)
		when 1
			@estado_clima ='Regular'
			objeto.disminuirMandarinas(30)
		when 2
			@estado_clima ='Bueno'
			objeto.disminuirMandarinas(-25)
		when 3
			@estado_clima ='Muy bueno'
			objeto.disminuirMandarinas(-50)
		end
	end
end

class Produccion
	def embalar(cantidad_fruta, peso_promedio)
		#Cajones de 20kg
		cantidad_cajones = 0.0
		cantidad_cajones = ((cantidad_fruta * peso_promedio)  / 20000.0).round
	end	

	def procesar(cantidad_fruta, peso_promedio)
		litros = 0.0
		if peso_promedio >= 200 then
			litros = ((cantidad_fruta * rand(40..50) )  / 1000)
		else
			litros = ((cantidad_fruta * rand(20..30))  / 1000)
		end
	end	
end