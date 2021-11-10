import Plantas.*
import Parcelas.*

object inta {
	var parcelas = []
	
	method agregarParcela(parcela){
		parcelas.add(parcela)
	}
	
	method parcelas(){
		return parcelas
	}
	
	method promedioPlantasXParcela(){
		return parcelas.sum({p => p.plantas().size()}) / parcelas.size()
	}
	
	method parcelaMasAutosustentable(){
		return parcelas.filter({p=> p.plantas().size() > 4}).max({p=> p.cantPlantasBienAsociadas()})
	}
	
}
