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
end
