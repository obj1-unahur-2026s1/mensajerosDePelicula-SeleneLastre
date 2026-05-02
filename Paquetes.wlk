import Destinos.*
import Mensajeros.*


object paquete {
    /*El paquete nos sabe decir si esta pago, el detino y si se puede entregar*/
    var estapago = false
    var destino = brooklyn

    method estapago() = estapago
    method registrarPago() {
        estapago = true
    } 
    method cancelarPago(){
        estapago = false
    } 
    method cambiardestino(nuevoDestino) {
        destino=nuevoDestino
    } 
    method puedeEntregarse(unMensajero) {
        return estapago && destino.dejaPasar(unMensajero)
    }
    method precio() = 50 
}

object paquetito {
    method estaPago() = true
    method puedeEntregarse(unMensajero) = true
    method precio() = 0  
}
object paqueton {
    const destinos = #{}
    var importePagado = 0
    method destinos() = destinos
    method precioTotal() = destinos.size() * 100
    method pagoParcial(unValor){
        importePagado = (importePagado + unValor).min(self.precioTotal())
    }
    method estaPago() = importePagado == self.precioTotal()

    method puedeEntregarse(unMensajero) {
        return self.estaPago() && destinos.all({d => d.dejaPasar(unMensajero)}) //d=destinos 
    }
    method precio() = self.precioTotal() 
}

object cajaMisteriosa {
    var estaPago = false
    
    method estaPago() = estaPago
    method registrarPago() {
        estaPago = true
    } 
    
    method precio() = 500
    
    method puedeEntregarse(unMensajero) {
        // Para entregarse, debe estar paga y el mensajero debe poder entrar a la Matrix
        return estaPago && matrix.dejaPasar(unMensajero)
    }
}