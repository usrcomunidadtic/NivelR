=begin
Arbol de Mandarinas (No injertadas)
- Aplicar los conceptos de Clases y Métodos. Método aleatorio.

Descripción:
Hacer una clase arbolMandarinas . Deberá tener un método altura que devuelve su altura y un método paso365Dias que cuando se le llama aumenta la edad del árbol en un año. Cada año crece el árbol y se hace más alto [mucho más de lo que piensas que un Mandarino debe crecer en un año], y después de un cierto número de años [de nuevo, tu llamada] el árbol debe morir. En los primeros años el árbol no debe producir fruta, pero después de un tiempo debería hacerlo, se supone que los árboles más viejos producen más fruta cada año que los árboles más jóvenes. Y, por supuesto, tú deberás ser capaz de contarMandarinas (que devuelve el número de Mandarinas en el árbol), y tomarUnaMandarina (que reduce la @numeroMandarinas en uno y devuelve un texto que te dice cómo era la Mandarina de deliciosa, o de lo contrario sólo te dice que no hay más Mandarinas para tomar este año) Asegúrate que las Mandarinas que no se recogen en un año se caen antes del próximo año.

Nivel 2: Plagas y mal tiempo...
- Aleatoriamente podrias crear plagas como “La Mosca de la Fruta” o gusanos que ataque tu plantación y destruya un porcentaje de la producción.
- Aleatoriamente podríamos definir como estuvo el Clima ese año y entonces variar la producción.
- En base a la cantidad de naranjas calcular cuantas cajas vas a necesitar para guardarlas, cuanto jugo puedes hacer.

Nivel 3: Todo hecho con TDD.

* Inspirado en el Libro: Aprende a programar con Ruby de Chris Pine

Tip 1: Altura Entre 7 y 8 metros. Máximo 13 en condiciones optimas.﻿
Tip 2: tarda unos 8 años en producir frutos﻿
Tip 3: entre los 10 y los 15 años es el periodo de mayor producción.﻿
Tip 4: serian unas 350 mandarinas promedio, como super exitoso 800﻿

#Peso fruta
200 gr. / ud. (buen clima) 
100 gr. / ud. (mal clima)
Empaque: Capacidad 20 kilogramos (50 x 35 x 30 cms)
con buen clima, pesan 200 gr. y entran unas 100 unidades por cajon.
con mal clima pesan 100 grm y entras unas 200 unidad por cajon.

#Zumo
40-50 ml una jugosa (buen clima)
15-20 ml una seca (mal clima)
con buen clima aleatoriamente entre 40-50 ml. => 600 unidades = 30 litros max.
con mal clima aleatoriamente entre 15-20 ml. => 300 unidades = 6 litros max.

=end

#Ejemplos:
# Nivel-1
# OK clase arbolMandarinas 
# Falta "cm" .altura() => 90 cm  
# OK .paso365Dias() => @edad + 1 y @altura + XX cm.
# OK edad < 8 => frutas = 0
# OK edad > 8 => frutas > 0
# OK edad = 10 => frutas 100  unid., edad = 11 => frutas 200 unid.
# OK edad > 20 => árbol muere.
# OK .contarMandarinas() = 100 unidades
# OK .tomarUnaMandarina() => @numeroMandarinas - 1 y 
# OK .tomarUnaMandarina() => "La mandarina estaba deliciosa"||"no hay más mandarinas para tomar este año"
# OK las Mandarinas que no se recogen en un año se caen antes del próximo año.

# Nivel-2
# Plagas: 
## plaga “La Mosca de la Fruta” destruye el 90% de la producción.
### OK Si cantidad_fruta = 100 => plagaMoscas() => cantidad_fruta = 10
## plaga "Gusanos"  destruye el 40% la producción.
### OK Si cantidad_fruta = 100 => plagaGusanos() => cantidad_fruta = 60
## OK Plaga Aleatoria.
# OK Clima: Malo (-80%), Regular(-40), Bueno(+25), Muy Bueno(+50). Aleatorio. 
## OK Clima Aleatorio.
# En base a la cantidad de naranjas calcular:
## cuantas cajas vas a necesitar para guardarlas
### OK buen clima, salen 600 unidades, se necesitan 6 cajones.
### OK mal clima, salen 300 unidades, se necesitan 2 cajones.
## cuanto jugo puedes hacer.


require 'test/unit'
require './arbolMandarinas'

class Test_arbolMandarinas < Test::Unit::TestCase
	def setup
		@env = Entorno.new()
		@a = ArbolMandarinas.new()
	end

	def test_crear_objeto
      assert_equal(ArbolMandarinas , @a.class )
	end

	def test_devuelve_altura_arbol
		altura = @a.altura
		assert_equal(Fixnum , altura.class)
	end

	def test_pasa_1_año_arbol_crece
		altura1 = @a.altura
		@env.paso365Dias(@a)
		altura2 = @a.altura
		assert_not_same(altura2, altura1)
	end

	def test_arbol_joven_sin_fruta
		@a.edad.upto(7) do
			@env.paso365Dias(@a)
		end
		assert_equal(8 , @a.edad)
		assert_equal(0 , @a.cantidad_fruta)
	end
	
	def test_arbol_mayor_a_8_con_fruta
		@a.edad.upto(8) do
			@env.paso365Dias(@a)
		end
		assert_equal(9 , @a.edad)
		assert_not_equal(0 , @a.cantidad_fruta)
	end

	def test_mas_viejo_mas_fruta
		arbol1 = ArbolMandarinas.new()
		arbol1.edad = 10
		arbol1.generarFruta
		arbol2 = ArbolMandarinas.new()
		arbol2.edad = 11
		arbol2.generarFruta
		if arbol2.cantidad_fruta > arbol1.cantidad_fruta then evaluacion = true end
		assert_equal(true , evaluacion)
	end

	def test_más_de_20_muere
		@a.edad = 20
		@a.generarFruta
		assert_not_equal(0 , @a.cantidad_fruta)
		@a.edad = 20
		@a.crecer
		assert_equal(0 , @a.cantidad_fruta)

	end

	def test_devolver_numero_mandarinas_en_arbol
		@a.cantidad_fruta = 100
		unidades = @a.contarMandarinas
		assert_equal(100 , @a.cantidad_fruta)
	end

	def test_tomar_una_mandarina
		@a.cantidad_fruta = 100
		unidades = @a.contarMandarinas
		como_estaba = @a.tomarUnaMandarina
		assert_equal((unidades -= 1) , @a.cantidad_fruta)
		assert_equal('La mandarina estaba deliciosa' , como_estaba)
	end	

	def test_no_hay_más_mandarinas
		@a.cantidad_fruta = 0
		unidades = @a.contarMandarinas
		como_estaba = @a.tomarUnaMandarina
		assert_equal(0, @a.cantidad_fruta)
		assert_equal('No hay más mandarinas' , como_estaba)
	end

	#Nivel 2.
	def test_ataque_plaga_mosca
		@a.edad = 13
		@a.crecer
		@a.cantidad_fruta = 100
		@env.plagaMoscas(@a)
		cantidad = @a.cantidad_fruta
		assert_equal(10, @a.cantidad_fruta)
	end

	def test_ataque_plaga_gusanos
		@a.edad = 13
		@a.crecer
		@a.cantidad_fruta = 100
		@env.plagaGusanos(@a)
		cantidad = @a.cantidad_fruta
		assert_equal(60, @a.cantidad_fruta)
	end

	def test_plaga_aleatoria
		@a.edad = 13
		@env.paso365Dias(@a)
		cantidad = @a.cantidad_fruta
		@env.huboPlaga(@a,(rand(2)+1))
		assert_equal(true, @env.plaga)
		assert_not_equal(cantidad , @a.cantidad_fruta)
	end

	#Malo (-80%), Regular(-30), Bueno(+25), Muy Bueno(+50). Aleatorio.
	def test_clima_malo
		@a.edad = 13
		@env.paso365Dias(@a)
		cantidad = (@a.cantidad_fruta - ((@a.cantidad_fruta * 80)/100))
		@env.clima(@a,0)
		assert_equal('Malo', @env.estado_clima)
		assert_equal(cantidad , @a.cantidad_fruta)
	end

	def test_clima_regular
		@a.edad = 13
		@env.paso365Dias(@a)
		cantidad = (@a.cantidad_fruta - ((@a.cantidad_fruta * 30)/100))
		@env.clima(@a,1)
		assert_equal('Regular', @env.estado_clima)
		assert_equal(cantidad , @a.cantidad_fruta)
	end

	def test_clima_bueno
		@a.edad = 13
		@env.paso365Dias(@a)
		cantidad = (@a.cantidad_fruta - ((@a.cantidad_fruta * -25)/100))
		@env.clima(@a,2)
		assert_equal('Bueno', @env.estado_clima)
		assert_equal(cantidad , @a.cantidad_fruta)
	end

	def test_clima_muy_bueno
		@a.edad = 13
		@env.paso365Dias(@a)
		cantidad = (@a.cantidad_fruta - ((@a.cantidad_fruta * -50)/100))
		@env.clima(@a,3)
		assert_equal('Muy bueno', @env.estado_clima)
		assert_equal(cantidad , @a.cantidad_fruta)
	end

	def test_clima_aleatorio
		#Aveces falla, porque es Aleatorio y puede coincidir. Investigar como testear un rand.
		@a.edad = 13
		@env.paso365Dias(@a)
		clima1 = @env.estado_clima
		@env.paso365Dias(@a)
		clima2 = @env.estado_clima
		assert_not_equal(clima1, @env.estado_clima)
	end

	def test_calcular_cantidad_de_cajones_con_buen_clima
		# buen clima, salen 600 unidades, 200 gr, se necesitan 6 cajones.
		@a.edad= 13
		@a.cantidad_fruta = 600
		p = Produccion.new()
		assert_equal(6 , p.embalar(@a.cantidad_fruta, 200))
	end

	def test_calcular_cantidad_de_cajones_con_mal_clima
		# mal clima, salen 300 unidades, 100 gr, se necesitan 2 cajones.
		@a.edad= 13
		@a.cantidad_fruta = 300
		p = Produccion.new()
		assert_equal(2 , p.embalar(@a.cantidad_fruta, 100))
	end

	def test_calcular_cantidad_de_zumo_con_buen_clima
		#con buen clima aleatoriamente entre 40-50 ml. => 600 unidades = 30 litros max.
		@a.edad= 13
		@a.cantidad_fruta = 600
		p = Produccion.new()
		litros = p.procesar(@a.cantidad_fruta, 200)
		if  litros < 30 && litros <= (600*50/1000) 
			salio_bien = true			
		end
		assert_equal(true ,salio_bien)
	end
end
