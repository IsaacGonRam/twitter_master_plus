class Torta
	attr_accessor :cantidad, :type_torta
	
	def initialize(cantidad, type_torta)
		@cantidad = cantidad
		@type_torta = type_torta
	end

	def array_charola
		@charola = []
		incrementar = 1
		while incrementar <= @cantidad 
			@charola << @type_torta
			incrementar +=1
		end
	@charola
	end

end

class Horno
		
	def initialize(array_tortas, time)
		@array_tortas = array_tortas
		@time = time
	end

	def analisis_salchicha(tiempo)
		case 
		when tiempo < 9 #case cruda
			"cruda"
		when tiempo > 8 && tiempo < 12
			"casi lista"
		when tiempo == 12
			"perfecta"	
		when tiempo > 12 && tiempo < 16
			"un poco quemada"	
		when tiempo > 15
			"quemada"	
		end
	end

	def analisis_jamon(tiempo)
		case 
		when tiempo < 5 #case cruda
			"cruda"
		when tiempo > 4 && tiempo < 8
			"casi lista"
		when tiempo == 8
			"perfecta"	
		when tiempo > 8 && tiempo < 12
			"un poco quemada"	
		when tiempo > 11
			"quemada"	
		end
	end

	def analisis_milanesa(tiempo)
		case 
		when tiempo < 7 #case cruda
			"cruda"
		when tiempo > 6 && tiempo < 10
			"casi lista"
		when tiempo == 10
			"perfecta"	
		when tiempo > 10 && tiempo < 14
			"un poco quemada"	
		when tiempo > 13
			"quemada"	
		end
	end

	def resultados
		total= 0
		@array_tortas.each do |sumar|
			total += sumar.size
		end
		puts "Total de tortas ingresadas al horno: #{total}"
		@array_tortas.each do |valor|
			valor.each do |torta|
				if torta == "salchicha"
					#reporte << analisis_salchicha(@time)
					puts "la torta de salchicha quedo: #{analisis_salchicha(@time)} "
				elsif torta == "jamon"
					#reporte << analisis_jamon(@time)
					puts "la torta de jamon quedo: #{analisis_jamon(@time)} "
				else
					#reporte << analisis_milanesa(@time)
					puts "la torta de milanesa quedo: #{analisis_milanesa(@time)} "
				end	
			end
		end
	end

end

charola1 = Torta.new(2, "salchicha").array_charola
charola2 = Torta.new(3, "jamon").array_charola
charola3 = Torta.new(2, "milanesa").array_charola
charola4 = Torta.new(2, "jamon").array_charola
order = [charola1, charola2, charola3, charola4]
horno_tortas = Horno.new(order, 10)
horno_tortas.resultados

