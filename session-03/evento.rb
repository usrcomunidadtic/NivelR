require_relative "modulo_1.rb"
require_relative "modulo_2.rb"

class Evento
  include MiModulo
  include TuModulo
  attr_accessor :nombre,:fecha,:lugar

  def initialize(lugar,fecha,nombre)
    @lugar=lugar
    @fecha=fecha
    @nombre = nombre.length > 2 ? nombre : "S/N"
  end


  def imprimir
    "Nombre: #{@nombre} en #{@lugar} el #{@fecha}"
  end

  def to_s
    "#{@nombre} - #{@lugar} - #{@fecha}"
  end
end

e = Evento.new("Corrientes","22/02/2013","Ruby Hangout")
puts e.pais
