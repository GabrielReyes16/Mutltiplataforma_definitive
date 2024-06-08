import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:' ListView Exmaple',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio 1 - menu'),
        ),
        body: ListView(
          children: <Widget> [
          ListTile(
            leading : Icon(Icons.add_a_photo),
            title: Text('Agregar nueva cámara'),
            subtitle: Text('Agrega una cámara diferente a la defaul! :D'),
            onTap: () {

            },
          ),
          ListTile(
            leading : Icon(Icons.add_home_work),
            title: Text('Registrar nueva casa'),
            subtitle: Text('Añade una nueva ubicación...'),
            onTap: () {
              
            },
          ),
          ListTile(
            leading : Icon(Icons.alarm_on),
            title: Text('Alarmas'),
            subtitle: Text('Registra tus alarmas! c:'),
            onTap: () {
              
            },
          ),
ListTile(
  leading: Icon(Icons.music_note),
  title: Text('Abrir menú de canciones'),
  subtitle: Text('Oye lo que mas te gusta!'),
  onTap: () {
    // Aquí puedes agregar la lógica para reproducir la canción A
  },
),
ListTile(
  leading: Icon(Icons.photo_album),
  title: Text('Ver colecciones'),
  subtitle: Text('Rememora tus mejores recuerdos!'),
  onTap: () {
    // Aquí puedes agregar la lógica para ver los detalles del Álbum 1
  },
),
ListTile(
  leading: Icon(Icons.camera_alt_outlined),
  title: Text('Abrir cámara'),
  subtitle: Text('Saca una linda foto! :3'),
  onTap: () {
    // Aquí puedes agregar la lógica para ver los detalles del Álbum 2
  },
),
ListTile(
  leading: Icon(Icons.album),
  title: Text('Ver almacenamiento'),
  subtitle: Text('cuida tu espacio!'),
  onTap: () {
    // Aquí puedes agregar la lógica para ver los detalles del Álbum 3
  },
),

        ],
        ),
        ),
        );
  }
}
