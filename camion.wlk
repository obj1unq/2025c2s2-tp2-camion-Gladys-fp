import transporte.*
import cosas.*

object camion {
	const property cosas = #{}
	const property tara = 1000 
		
	method contieneUn(unaCosa){
		return cosas.contains(unaCosa)
	}

	method cargar(unaCosa) {
		if(not self.contieneUn(unaCosa)){
			cosas.add(unaCosa)
		}	
	}

	method descargar(unaCosa) {
		if(self.contieneUn(unaCosa)){
			cosas.remove(unaCosa)
		}
	}

	method todoPesoEsPar() {
  		return cosas.all({ cosa => cosa.peso() % 2 == 0 })
	}

	method tieneCosaConPeso(pesoBuscado){
		return cosas.any({ cosa => cosa.peso() == pesoBuscado })
	}

	method pesoTotal() {
		return tara + cosas.sum({cosa => cosa.peso()})
	}

	method pesoExcedido() {
		return self.pesoTotal() > 2500   
	}

	method tieneNivelDePeligrosidadDe(cantPelogrisidad) {
	  	return cosas.find({ cosa => cosa.nivelPeligrosidad() == cantPelogrisidad })
	}

	method cosasMasPeligrosasQueNivel(nivel) {
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel })
	}

	method cosasMasPeligrosasQue(otraCosa) {
  		return self.cosasMasPeligrosasQueNivel(otraCosa.nivelPeligrosidad())
	}

	method puedeCircularRutaDeNivel(nivelMaximoPermitido){
		return  not (self.pesoExcedido()) && cosas.all({ cosa => cosa.nivelPeligrosidad() <= nivelMaximoPermitido })
	}

	method cosaQuePesaEntreLosValores(valorMinimo, valorMaximo){
		return cosas.find({ cosa => cosa.peso() < valorMaximo && cosa.peso() > valorMinimo })
	}

	method pesoDeLasCosasCargadas() {
	  return cosas.map({cosa => cosa.peso()})
	}

	method cantidadDeBultosQueLleva() {
		return cosas.sum({cosa => cosa.bultos()})
	  
	}

	method sufrirAccidente() {
	  cosas.forEach({cosa => cosa.efectosPorAccidentes()})
	}

	method transportar(destino, camino) {
  		if (camino.soportaViaje(self)) {
			destino.descargarCamion(cosas)
			cosas.clear()
  		}
	}
}
