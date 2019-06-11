class Plantas {
	var property anioDeObtencion = 0
	var property altura = 0
	var property toleranciaAlSol = 0
	var property espacioQueOcupa = 0
	method daNuevasSemillas() = self.esFuerte() or self.condicionParticular()
	method condicionParticular() = null
	method esFuerte() = toleranciaAlSol > 10
	method esIdeal(parcela) = null
}

class Menta inherits Plantas {
	override method toleranciaAlSol() = 6
	override method condicionParticular() = altura > 0.4
	override method espacioQueOcupa() =  self.seEsparce()
	override method esIdeal(parcela) = parcela.superficie() > 6 
	//DIVISION DE ESPACIO QUE OCUPA
	method seEsparce() =  altura * 3
}

class Soja inherits Plantas {
	override method toleranciaAlSol() {
		return 
			if(altura < 0.5) { 6 }
			else if (altura.between(0.5,1)) { 7 }
			else 9
	}
	override method condicionParticular() = anioDeObtencion > 2007 and altura > 1
	override method espacioQueOcupa() =  altura/2
	override method esIdeal(parcela) = parcela.horasDeSol() == self.toleranciaAlSol()
}

class Quinoa inherits Plantas {
	override method condicionParticular() = anioDeObtencion < 2005
	override method espacioQueOcupa() =  0.5
	override method esIdeal(parcela) = parcela.plantas().all{planta => planta.altura() < 1.5}
}

class SojaTrangenica inherits Soja {
	override method daNuevasSemillas() = false
	override method esIdeal(parcela) = parcela.cantidadMaximaDePlantas() == 1
}

class Hierbabuena inherits Menta {
	override method espacioQueOcupa() = self.seEsparce() * 2
} 