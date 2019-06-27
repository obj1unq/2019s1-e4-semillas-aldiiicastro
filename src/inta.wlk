object inta {
	var property parcelas = []
	
	method promedioDePlantasPorParcela() = self.plantasEnParcelas() / self.cantidadDeParcelas()
	method parcelaMasAutosustentable() = self.parcelasConMasDe4Plantas().max{parcela => parcela.porcentajeDePlantasAsociadas()}
	
	//DIVISION DE PROMEDIO DE PLANTAS POR PARCELA
	method plantasEnParcelas()  = parcelas.sum{parcela => parcela.plantas().size()}
	method cantidadDeParcelas() = parcelas.size() 
	
	//DIVISION DE PARCELA MAS AUTOSUSTENTABLE
	method parcelasConMasDe4Plantas() = parcelas.filter{parcela => parcela.cantidadMaximaDePlantas() > 4}
	
	//USO PARA EL TEST 
	method agregar(parcela) {
		parcelas.add(parcela)
	}
	
}
