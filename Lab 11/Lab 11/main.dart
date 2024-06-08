import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert Buttons Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Buttons Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _showSimpleAlert(context);
              },
              child: Text('Alerta Simple (Material)'),
            ),
            SizedBox(height: 16), // Espacio de 16 píxeles entre los botones
            ElevatedButton(
              onPressed: () {
                _showSimpleCupertinoAlert(context);
              },
              child: Text('Alerta Simple (Cupertino)'),
            ),
            SizedBox(height: 16), // Espacio de 16 píxeles entre los botones
            ElevatedButton(
              onPressed: () {
                _showTwoOptionsAlert(context);
              },
              child: Text('Alerta con 2 Opciones (Material)'),
            ),
            SizedBox(height: 16), // Espacio de 16 píxeles entre los botones
            ElevatedButton(
              onPressed: () {
                _showTwoOptionsCupertinoAlert(context);
              },
              child: Text('Alerta con 2 Opciones (Cupertino)'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSimpleAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta Simple'),
          content: Text('Esta es una alerta simple.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSimpleCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Alerta Simple (Cupertino)'),
          content: Text('Esta es una alerta simple con diseño de Cupertino.'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showTwoOptionsAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta con 2 Opciones'),
          content: Text('¿Desea continuar?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Agregar la lógica para la opción "Aceptar"
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _showTwoOptionsCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Alerta con 2 Opciones (Cupertino)'),
          content: Text('¿Desea continuar?'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
                // Agregar la lógica para la opción "Aceptar"
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
