import cosas.*
object camion {
    const carga = []
    method carga() = carga
    const tara = 1000
    method pesoTotal(){
        if (carga.isEmpty()) {return tara}
        else {return carga.sum({cosa=>cosa.peso()}) + tara}
    }
    method cargar(cosa){
        carga.add(cosa)
    }
    method descargar(cosa){
        carga.remove(cosa)
    }
    method losPesosSonImpares(){
        return carga.all({cosa=>cosa.peso() % 2 != 0})
    }
    method algunoPesa(peso){
        return carga.any({cosa=>cosa.peso() == peso})
    }
    method primerCosaDePeligrosidad(peligrosidad){
        return carga.find({cosa=>cosa.peligrosidad() == peligrosidad})
    }
    method todasLasCosasQueSuperanPeligrosidad(peligrosidad){
        return carga.filter({cosa=>cosa.peligrosidad() > peligrosidad})
    }
    method cosasQueSuperanPeligrosidadDeCosa(cosa2){
        return carga.filter({cosa=>cosa.peligrosidad() > cosa2.peligrosidad()})
    }
    method estaExcedidoEnPeso() = self.pesoTotal() > 2500
    method puedeCircularEnRuta(peligrosidadMaxima) = not self.estaExcedidoEnPeso() and not carga.any({cosa=>cosa.peligrosidad() > peligrosidadMaxima})
    method tieneCosaQuePeseEntreValores(primerValor, segundoValor) = carga.any({cosa=>cosa.peso() > primerValor and cosa.peso() < segundoValor})
    method cosaMasPesada() = carga.max({cosa=>cosa.peso()})
}