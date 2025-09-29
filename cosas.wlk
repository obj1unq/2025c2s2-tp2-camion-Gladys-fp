
import transporte.*


//--------------------------KNIGHT RIDER ------------------------------
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

//------------------------ ARENA A GRANEL -----------------------
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



//------------------------ PAQUETES DE LADRILLOS -----------------------
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

//------------------------ BATERIA ANTIAEREA -----------------------
object bateriaAntiaerea {
	var property misiles = descargado

	method misiles(_tieneMisiles){
		misiles = _tieneMisiles
	}

	method peso() { 
		misiles.peso()
	}

	method nivelPeligrosidad() {
		return misiles.nivelPeligrosidad()
	}

	method bultos() { 
		return misiles.bultos()
	}

	method efectosPorAccidentes() {
		misiles = misiles.efectosPorAccidentes()  
	}
}

object cargado {
	method peso() {return 300}
	method nivelPeligrosidad() {return 100}
	method bultos() {return 2}
	method efectosPorAccidentes() {return descargado}
  
}
object descargado {
	method peso() {return 200}
	method nivelPeligrosidad() {return 0}
	method bultos() {return 1}
	method efectosPorAccidentes() {return self}
}

//------------------------- RESIDUOS RADIACTIVOS -----------------------
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

//------------------------ BUMBLEBEE -----------------------
object bumblebee {
	var tranformacion = auto

	method peso() { 
		return 800 
	}
	method tranformacion() {
	  return tranformacion
	}

	method tranformarEn(nuevaTranformacion){
		tranformacion = nuevaTranformacion
	}

	method nivelPeligrosidad() {
		return tranformacion.nivelPeligrosidad()
	}

	method bultos() {
	  return 2
	}

	method efectosPorAccidentes() {
		tranformacion = tranformacion.efectosPorAccidentes()
	}
}

object auto {
	method nivelPeligrosidad() {return 15}
	method efectosPorAccidentes() { return robot}
}
object robot {
	method nivelPeligrosidad() {return 30}
	method efectosPorAccidentes() {return auto}
}

//---------------CONTENEDOR Y EMBALAJE------------------

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
