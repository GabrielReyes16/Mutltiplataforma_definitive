//Heroe de Marvel
class MarvelHeroes{
  String nombrePila;
  String nombrePersonaje;
  
  MarvelHeroes({required this.nombrePila, required this.nombrePersonaje});
}

//Heroe de DC
class DCHeroes{
  String nombrePila;
  String nombrePersonaje;
  
  
DCHeroes.fromDCJson(Map <String, String>dcJson):
  this.nombrePila = dcJson['nombrePila'] ??  ' NO HAY NOMBREPILA',
  this.nombrePersonaje = dcJson['nombrePersonaje'] ??  ' NO HAY NOMBREPER';
  
  @override
  String toString(){
    return 'nombrePila : ${this.nombrePila}, nombrePersonaje : ${this.nombrePersonaje}';
  }
}


void main(){
  //Heroe de Marvel
  final heroe1 = new MarvelHeroes(nombrePila:'Peter Parker', nombrePersonaje: 'Spiderman');
  
  print('Hola mi nombre es '+ heroe1.nombrePila + ' pero me conocen como su amigable vecino ' + heroe1.nombrePersonaje);
  
  //Heroe de DC
    final dcJson = {
    'nombrePila': ' Bruce Wayne',
    'nombrePersonaje': 'BATMAN'
  };
  final heroe2 = new DCHeroes.fromDCJson(dcJson);
 print('Hola, mi nombre es ' + heroe2.nombrePila + ' pero me conoce como el caballero de la noche, ' + heroe2.nombrePersonaje);
 
}