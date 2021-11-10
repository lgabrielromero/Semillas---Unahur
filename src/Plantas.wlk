import Parcelas.*

class Planta{
	var property anioObtencion
	var property altura
	
	method toleranciaAlSol()
	
	method esFuerte(){
		return self.toleranciaAlSol() > 10
	}
	
	method daNuevasSemillas(){
		return self.esFuerte()
	}
	
	method espacioOcupaPlantada()
	
	method parcelaEsIdeal(parcela)
}

class Menta inherits Planta{
	
	override method toleranciaAlSol(){
		return 6
	}
	
	override method daNuevasSemillas(){
		return super() or self.altura() > 0.4
	}
	
	override method espacioOcupaPlantada(){
		return self.altura() * 3
	}
	
	override method parcelaEsIdeal(parcela){
		return parcela.superficie() > 6
	}
}

class Soja inherits Planta{
	override method toleranciaAlSol(){
		var tolerancia = 0
		if (self.altura() < 0.5){
			tolerancia = 6
		}
		else if (self.altura() > 1){
			tolerancia = 9
		}
		else{
			tolerancia = 7
		}
		return tolerancia
	}
	
	override method daNuevasSemillas(){
		return super() or (self.anioObtencion() > 2007 and self.altura() > 1)
	}
	
	override method espacioOcupaPlantada(){
		return self.altura() / 2
	}
	
	override method parcelaEsIdeal(parcela){
		return parcela.horasDeSol() == self.toleranciaAlSol()
	}
}

class Quinoa inherits Planta{
	var toleranciaAlSol = 0
	override method toleranciaAlSol(){
		return toleranciaAlSol
	}
	
	method toleranciaAlSol(tolerancia){
		toleranciaAlSol = tolerancia
	} 
	
	override method daNuevasSemillas(){
		return super() or self.anioObtencion() < 2005
	}
	
	override method espacioOcupaPlantada(){
		return 0.5
	}
	
	override method parcelaEsIdeal(parcela){
		return !parcela.plantas().any({p => p.altura() > 1.5})
	}
}

class SojaTransgenica inherits Soja{
	override method daNuevasSemillas(){
		return false
	}
	
	override method parcelaEsIdeal(parcela){
		return parcela.maximoPlantas() == 1
	}
}

class Hierbabuena inherits Menta{
	override method espacioOcupaPlantada(){
		return super() * 2
	}
}