import Mensajeros.*

object brooklyn{
  method dejaPasar(unMensajero) {
    return unMensajero.pesoTotal() <= 10000
  }
}

object matrix {
  method dejaPasar(unMensajero) {
    return unMensajero.puedeLlamar()
  }
}