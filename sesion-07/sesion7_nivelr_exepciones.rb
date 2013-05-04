#a = 1
#if a.==(1) then raise Exception, 'Tremendo Error!' end

#class ErrorPropio < Exception
#	def initialize(mensaje = "mensaje por defecto")
#		super
#	end
#end

#a = 1
#raise ErrorPropio, "A es igual a 1, mal ahi che!" if a.==(1) 

begin
	a = 1
	raise SyntaxError if a.==(1)
	raise ScriptError if a.==(1)
	#si hay error salta todo lo que sigue, hasta encontrar un Rescue.
rescue SyntaxErrorn #Exception => e #Rescue recibie las clases de Excepción de los errores que va a atrapar.

ensure
	#codigo que quiero que si o si sea ejecutado,
	#incluso si se levanta una exceptión.	
end