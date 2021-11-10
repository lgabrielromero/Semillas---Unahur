import Plantas.*
import INTA.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	var plantas = []
	
	method plantas(){
		return plantas
	}
	
	method plantar(planta){
		if(self.maximoPlantas() == plantas.size() or planta.toleranciaAlSol() + 2 < self.horasDeSol())  {
			self.error("No se puede plantar")
		}
		else{plantas.add(planta)}
	}
	
	method superficie(){
		return self.ancho() * self.largo()
	}
	
	method maximoPlantas(){
		var cantidad = 1
		if (self.ancho() > self.largo()){
			cantidad = self.superficie() / 5
		}
		else{
			cantidad = self.superficie() / 3 + self.largo()
		}
		return cantidad
	}
	
	method tieneComplicaciones(){
		return plantas.any({p => p.toleranciaAlSol() < self.horasDeSol()})
	}
	

}


class ParcelaEcologista inherits Parcela{
	method plantaSeAsocia(planta){
		return !self.tieneComplicaciones() and planta.parcelaEsIdeal(self)
	}
	
	method cantPlantasBienAsociadas(){
		return plantas.count({p => self.plantaSeAsocia(p)})
	}
}


class ParcelaIndustrial inherits ParcelaEcologista{
	override method plantaSeAsocia(planta){
		return self.plantas().size() <= 2 and planta.esFuerte()
	}
}