
import transporte.*

object knightRider {
	method peso() { 
		return 500 
	}
	method nivelPeligrosidad() { 
		return 10 
	}

	method bultos() {
	  return 1
	}

	method efectosPorAccidentes() {}

}


object arenaAGranel {
	var property peso = 0

	method peso(_peso) { 
		peso = _peso 
	}

	method nivelPeligrosidad() { 
		return 1 
	}

	method bultos() {
	  return 1
	}

	method efectosPorAccidentes() {
		peso += 20  
	}
}


object bumblebee {
	var property tranformacion = "auto"
	method peso() { 
		return 800 
	}

	method cambiarTranformacion(nuevaTranformacion){
		tranformacion = nuevaTranformacion
	}

	method nivelPeligrosidad() {
		if(tranformacion == "auto"){
			return 15	
		}else{
			return 30
		}  
	}

	method bultos() {
	  return 2
	}

	method efectosPorAccidentes() {
		if(tranformacion == "auto"){
			tranformacion = "robot"
		}else{
			tranformacion = "auto"
		}
	}
}


object paqueteDeLadrillos {
	const pesoDeLadrillo = 2
	var property cantidadDeLadrillos = 0

	method cantidadDeLadrillos() {
	  return cantidadDeLadrillos
	}

	method cantidadDeLadrillos(_cantidadDeLadrillos){
		cantidadDeLadrillos = _cantidadDeLadrillos
	} 

	method peso() { 
		return cantidadDeLadrillos * pesoDeLadrillo 
	}
	method nivelPeligrosidad() { 
		return 2 
	}
	
	method bultos() {
		if(cantidadDeLadrillos <= 100){
			return 1
		}
		if(cantidadDeLadrillos <= 300 ){
			return 2
		}
		return 3
	}

	method efectosPorAccidentes() {
		if(cantidadDeLadrillos <= 12){
			cantidadDeLadrillos = 0
		}else {
			cantidadDeLadrillos -= 12
		}
	}

}


object bateriaAntiaerea {
	var property tieneMisiles = false

	method tieneMisiles(_tieneMisiles){
		tieneMisiles = _tieneMisiles
	}

	method peso() { 
		if(tieneMisiles){
			return 300
		}else{
			return 200
		}
	}

	method nivelPeligrosidad() {
		if(tieneMisiles){
			return 100
		}else{
			return 0
		}
	}

	method bultos() { 
		if(tieneMisiles){
			return 2
		}
		return 1
	}

	method efectosPorAccidentes() {
		tieneMisiles = false  
	}
}


object residuosRadiactivos {
	var property peso = 0

	method peso(_peso) {
	  peso = _peso
	}

	method nivelPeligrosidad() { 
		return 200 
	}

	method bultos() {
	  return 1
	}

	method efectosPorAccidentes() {
	  peso += 15
	}
}


object contenedorPortuario {
  	const property cosasContenidas = #{}

	method cargarCosaAContenedor(unaCosa){
		return cosasContenidas.add(unaCosa)
	}

	method peso() { 
		return 100 + cosasContenidas.sum({cosa => cosa.peso()}) 
	}

	method nivelPeligrosidad() { 
		if(cosasContenidas.isEmpty()){
			return 0 
		}else{
			return self.cosaMasPeligrosa().nivelPeligrosidad()
		}
	}

	method cosaMasPeligrosa() {
		return cosasContenidas.max({ cosa => cosa.nivelPeligrosidad() })
	}

	method bultos() {

	  	return cosasContenidas.sum({cosa => cosa.bultos()}) +1
	}

	method efectosPorAccidentes() {
		cosasContenidas.forEach({cosa => cosa.efectosPorAccidentes()})
	}
}

object embalajeDeSeguridad {
  	var cosaAEmbalar = null
	

	method embalar(unaCosa) {
		cosaAEmbalar = unaCosa  
	}

	method peso() { 
		return cosaAEmbalar.peso()
	}

	method nivelPeligrosidad() { 
		return cosaAEmbalar.nivelPeligrosidad() / 2
	}

	method bultos() {
	  return 2
	}

	method efectosPorAccidentes() {}
}
