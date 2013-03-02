module TuModulo
   attr :paises
	
   def pais
       paises = %w(Argentina Brasil Portugal Chile Venezuela Peru Mexico)
       paises[rand(paises.count)]
   end 

end
