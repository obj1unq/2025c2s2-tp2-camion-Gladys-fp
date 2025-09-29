import camion.*
import cosas.*

object almacen {
    const property cosasAlmacenadas = #{} 

    method descargarCamion(cosas) {
      cosasAlmacenadas.addAll(cosas)
    }

    method almacenarCosa(unaCosa) {
      cosasAlmacenadas.add(unaCosa)
    }
}


//rutas
object ruta9 {
  method soportaViaje(camion) {
    return camion.puedeCircularRutaDeNivel(20)
  }
}

object caminoVecinal {
  var pesoMaximoPermitido = 0

  method pesoMaximoPermitido(pesoMaximo) {
    pesoMaximoPermitido = pesoMaximo
  }

  method soportaViaje(camion) {
    return camion.pesoTotal() <= pesoMaximoPermitido
  }
}
