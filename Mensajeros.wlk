import vehiculos.*

object roberto { 
    var vehiculo = bicicleta
    var property peso = 90 // asumo que su peso puede cambiar. uso property porque ademas de ser un atributo que apunta al obj 90, 
    //tiene el metodo peso de consulta y el metodo de indicación. basicamente se utiliza para no escribir los
    //métodos setter y getter
  method pesoTotal() {
    return peso + vehiculo.peso()
  }
  method cambiarDeVehiculo(unVehiculo) {
    vehiculo = unVehiculo
  } 
  method puedeLlamar() = false 
}
object chuckNorris {
  method pesoTotal() = 80
  method puedeLlamar() = true 
}

object neo {
    var credito = 0 
    method pesoTotal() = 0 
    method puedeLlamar() = credito > 0
    method cargarCredito(valor) { 
        credito += valor
    } 
    method consumirCredito(valor){
      credito = (credito - valor).max(0)
      //tambien : credito = 0.max(credito - valor)
    }  
}
object johnWick {
    method pesoTotal() = 85
    method puedeLlamar() = true 
}