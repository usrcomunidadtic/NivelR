require_relative "modulo_1.rb"
require_relative "modulo_2.rb"
class ClaseNueva
 include MiModulo
 include TuModulo
 attr :nombre, :descripcion

 def to_s
   "redefinicion de to_s"
 end 
end
