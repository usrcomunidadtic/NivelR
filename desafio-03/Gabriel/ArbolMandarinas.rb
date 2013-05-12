class ArbolMandarinas
    # @altura = 100cm
    # @edad = 1
    @@numero_mandarinas = 0

    def initialize(altura, edad)
        @altura = altura
        @edad = edad
        tiempo()
    end

    def altura()
        @altura
    end

    def edad()
        @edad
    end

    def tiempo()
        if @altura < 1400
            @altura = 100 * @edad
        end

        case @edad
        when 0 .. 8
            @@numero_mandarinas = 0
        when 9 .. 12
            @@numero_mandarinas = 200 * (@edad-8)
        when 13 .. 15
            @@numero_mandarinas = 800
        when 16 .. 19
            @@numero_mandarinas = 800 - (@edad - 15) * 150
        else
            @@numero_mandarinas = 0
            p "el arbol murio"
        end
    end

    def paso365Dias()
        @edad += 1
        tiempo()
    end

    def mandarinas()
        @@numero_mandarinas
    end

    def tomarMandarina()
        @@numero_mandarinas -= 1
    end
end

ar = ArbolMandarinas.new(100, 1)

p ar.mandarinas
p ar.altura
ar.paso365Dias
p ar.mandarinas