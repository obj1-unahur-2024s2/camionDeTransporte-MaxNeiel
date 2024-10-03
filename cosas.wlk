object knightRider{
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee{
    method peso() = 800
    var modoAuto = false
    method peligrosidad() = if (modoAuto) return 15 else return 30

    method alternarModo(){
        modoAuto = not modoAuto
    }
    method convertirARobot() {if (modoAuto) self.alternarModo()}
    method convertirAAuto() {if (not modoAuto) self.alternarModo()}
}

object paqueteDeLadrillos{
    var property cantidadLadrillos = 0
    method peso() = 2 * cantidadLadrillos
    method peligrosidad() = 2
}

object arenaAGranel{
    var property peso = 0
    method peligrosidad() = 2
}

object bateriaAntiaerea{
    var property estaConMisiles = false
    method peso() = if (estaConMisiles) return 300 else return 200
    method peligrosidad() = if (estaConMisiles) return 100 else return 0
}

object contenedorPortuario{
    const contenido = []
    method contenido() = contenido
    method peso() = 100 + contenido.sum({cosa=>cosa.peso()})
    method peligrosidad(){
        if (contenido.isEmpty()) 
            return 0
        else 
            return contenido.max({cosa=>cosa.peso()})
    }
    method cargar(cosa){
        contenido.add(cosa)
    }
}

object residuosRadioactivos{
    var property peso = 0
    method peligrosidad() = 200
}

object embalajeSeguridad{
    const contenido = []
    method peso() =  contenido.first().peso()
    method peligrosidad() = contenido.first().peligrosidad()/2
    method emabalarCosa(cosa){
        if (contenido.isEmpty()) contenido.add(cosa)
    }
}