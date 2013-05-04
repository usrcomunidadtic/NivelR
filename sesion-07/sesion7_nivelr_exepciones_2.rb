class A
end
a = A.new

valor = ["1", "a", a]
resultado = valor.map{ |v| Integer(v) rescue Float(v) rescue String(v)}
puts resultado