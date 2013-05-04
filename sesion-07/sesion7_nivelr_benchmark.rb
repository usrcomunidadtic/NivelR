#Averiguar la longitud de la cadena y ver cual se ejecuta más rapido. 
require 'benchmark'
string = "Tormenta climatica"
m = string.method(:length)

Benchmark.bmbm do |test|
	test.report('direct:') {1_000_000.times {string.length}} #
	test.report('call:') {1_000_000.times {m.call}} #m es un objeto de la clase method, por eso se lo llama con Call.
	test.report('send:') {1_000_000.times {string.send(:length)}} # 
	test.report('eval:') {1_000_000.times {eval 'string.length'}} #
end
