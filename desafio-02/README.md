#Desafío 2 - Kata TDD FizzBuzz

==================

Fizz Buzz. Kata TDD sin cosas raras.

Tipo Home. Objetivo: Aplicar TDD simple, sin mokcs ni stub.


El enunciado del ejercicio es el siguiente: Imagínate el siguiente escenario. Tienes 11 años y en los últimos 5 minutos del final de la lección, tu profesor de matemáticas decide hacer la clase más divertida, introduciendo un juego. El explica que irá señalando a cada compañero de clase en orden y preguntándole el siguiente número de la secuencia, comenzando por el número uno. La parte divertida es que, si el número es divisible por 3, tienes que decir “Fizz” en vez del número. Y si es divisible por 5, debes decir “Buzz”. Las matemáticas no es tu fuerte y tienes miedo de que te llegue el turno y no sepas qué decir. Así que, con el fin de evitar la vergüenza delante de toda la clase, tienes que obtener la lista completa impresa para saber qué decir. Tu clase tiene unos 33 alumnos y se pueden llegar a hacer unas tres rondas antes de que suene el timbre para el recreo. La siguiente clase de matemáticas es el jueves. ¡Codifícalo!


Enunciado:

Escribe un programa que imprima los números del 1 al 100, pero aplicando las siguientes normas:

Devuelve Fizz si el número es divisible por 3.

Devuelve Buzz si el número es divisible por 5.

Devuelve FizzBuzz si el número es divisible por 3 y por 5.

Salida de ejemplo: 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz … etc hasta el 100


Fase 2 – Nuevos requerimientos:
Un número es Fizz si es divisible por 3 o si incluye un 3 en el número
Un número es Buzz si es divisible por 5 o si incluye un 5 en el número


El proceso para aplicar TDD es el siguiente:

1 Definimos la prueba unitaria. (Preparar valores, hacer, Assert)
2 Ejecutar la prueba y falla.
3 Agregar código mínimo necesario para pasar la prueba. Y probar hasta que pase (o luz verde)
4 Refactorizar el código. Aplicar los principios SOLID.
