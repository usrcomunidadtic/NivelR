module MiModulo
  def QuienSoy?
	"#{self.class} - #{self.to_s}"
  end

  def numero_aleatorio
    if self.respond_to? :imprimir
      "#{self.imprimir}  aleatorio: #{rand(9)}"
    end
  end
  def imprime_pais
    if (self.respond_to? :pais) && (self.respond_to? :imprimir)
      "#{self.imprimir}  pais: #{self.pais}"
    end
  end
end
