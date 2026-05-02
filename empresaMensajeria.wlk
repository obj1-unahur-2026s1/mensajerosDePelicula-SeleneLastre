import Mensajeros.*
import Paquetes.*

object empresa {
    const mensajeros = [] // #{} asi se define un conjunto y asi una lista []
    const paquetesPendientes = [] 
    var facturacion = 0 // Lo preparamos para el próximo punto

    method mensajeros() = mensajeros  
    method contratarUnMensajero(unMensajero) {
      mensajeros.add(unMensajero)
    }
    method despedirUnMensajero(unMensajero) {
        mensajeros.remove(unMensajero)
    }
    method despedirTodosLosMensajeros() {
        mensajeros.clear()
    }
    method esGrande() {
        return mensajeros.size() > 2
    }
    method puedeSerEntregadoPorElPrimerMensajero(unPaquete) {
      return unPaquete.puedeSerEntregado(self.primerEmpleado())
    }
    method primerEmpleado() = mensajeros.first()
    method pesoDelUltimoMensajero() {
        return self.ultimoEmpleado().pesoTotal()
    }
    method ultimoEmpleado() = mensajeros.last()
    method puedeEntregarsePorLaEmpresa(unPaquete) {
        return mensajeros.any({ mensajero => unPaquete.puedeEntregarse(mensajero) })
    }
    method mensajerosQuePuedenLlevar(unPaquete) {
        return mensajeros.filter({ mensajero => unPaquete.puedeEntregarse(mensajero) })
    } 
    method tieneSobrepeso() {
        if (mensajeros.isEmpty()) {
            return false 
        }
        const pesoTotal = mensajeros.sum({ mensajero => mensajero.pesoTotal() })
        return (pesoTotal / mensajeros.size()) > 500
    }
    method paquetesPendientes() = paquetesPendientes
    method facturacion() = facturacion   
    method enviar(unPaquete) {
        const mensajerosAptos = self.mensajerosQuePuedenLlevar(unPaquete)
        if (mensajerosAptos.isEmpty()) {
            paquetesPendientes.add(unPaquete)
        } else {
            const mensajeroElegido = mensajerosAptos.anyOne()
            facturacion += unPaquete.precio()
        }
    }
    method enviarTodos(unosPaquetes) {
        unosPaquetes.forEach({ paquete => self.enviar(paquete) })
    }
    method enviarPendienteMasCaro() {
        if (!paquetesPendientes.isEmpty()) {
            const paqueteMasCaro = paquetesPendientes.max({ paquete => paquete.precio() })
            paquetesPendientes.remove(paqueteMasCaro)
            self.enviar(paqueteMasCaro)
        }
    }
    method resetearFacturacion() {
        facturacion = 0
    }
}

//tercera Parte
