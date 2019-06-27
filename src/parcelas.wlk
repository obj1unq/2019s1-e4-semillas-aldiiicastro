class Parcela {
	var property ancho = 0
	var property largo = 0
	var property horasDeSol = 0
	var property plantas = []
	
	//SE PIDE:
	method superficie() = ancho* largo
	method cantidadMaximaDePlantas() { 
		return if  (self.siElAnchoEsGrande()) 
				   {self.elAnchoEsMasGrande()}
			   else self.elLargoEsMasGrande()		   
	}
	method tieneComplicaciones() = plantas.any{planta => planta.toleranciaAlSol() < horasDeSol}
	method plantar(planta) {
		return if (not self.puedeAniadir(planta)) 
					{throw new Exception("No se puede plantar")}
			   else  plantas.add(planta)
		
	}
	method seAsociaBien(planta) = null
	
	//DIVISION DE CANTIDAD MAXIMA DE PLANTAS 
	method siElAnchoEsGrande() = ancho > largo
	method elAnchoEsMasGrande() = self.superficie() /5
	method elLargoEsMasGrande() = self.superficie()/3 + largo
	
	//DIVISION DE PLANTAR
	method puedeAniadir(planta) {
		return plantas.size() < self.cantidadMaximaDePlantas() 
		or horasDeSol  + 2 < planta.toleranciaAlSol()
	}
	
	//DIVISION DE PARCELA MAS AUTOSUSTENTABLE
	method plantasAsociadas() = plantas.filter{planta => self.seAsociaBien(planta)}
	method cantidadDePlantasAsociadas() = self.plantasAsociadas().size()
	method porcentajeDePlantasAsociadas() = self.cantidadDePlantasAsociadas() *100 / plantas.size()
}

class ParcelaEcologica inherits Parcela {
	  override method seAsociaBien(planta) = not self.tieneComplicaciones() and planta.esIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
	override method seAsociaBien(planta) =  planta.esFuerte() and self.cantidadMaximaDePlantas() == 2	
}
