import transporte.*
import cosas.*

object camion {
	const property cosas = #{} 
	const property tara = 1000 
		
	method contieneUn(unaCosa){
		return cosas.contains(unaCosa)
	}
	method estaCargadoCon(unaCosa){
		if(self.contieneUn(unaCosa)){
			self.error("No se puede cargar una cosa que ya esta cargada")
		}
	}

	method noEstaCargadoCon(unaCosa) {
		if(not self.contieneUn(unaCosa)){
			self.error("No se puede descargar una cosa que no esta cargada")
		}
	}

	method cargar(unaCosa) {
		self.estaCargadoCon(unaCosa)
		cosas.add(unaCosa)	
	}

	method descargar(unaCosa) { 
		self.noEstaCargadoCon(unaCosa)
		cosas.remove(unaCosa)
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

	method cantidadDePeligrosidadDe(cantPelogrisidad) {
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
		self.puedeIrAlDestino(camino)
		destino.descargarCamion(cosas)
		cosas.clear()
	}

	method puedeIrAlDestino(camino) {
	  if(not camino.soportaViaje(self)){
		self.error("El camino no soporta el viaje")
		}
	}
}
