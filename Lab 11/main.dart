import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Map<String, String>> cardData = [
    {
      'title': 'Futbol',
      'subtitle': 'El fútbol es un deporte de equipo jugado entre dos conjuntos de once jugadores cada uno y un árbitro que se ocupa de que las normas se cumplan correctamente.',
      'imageUrl': 'https://statics.launion.digital/2022/01/61debd90692a8.jpg',
    },
    {
      'title': 'Basket',
      'subtitle': 'El baloncesto es un deporte de equipo, jugado entre dos equipos de cinco jugadores cada uno durante cuatro períodos o cuartos de diez (o doce) minutos cada uno.',
      'imageUrl': 'https://st.depositphotos.com/1269924/4038/i/450/depositphotos_40388609-stock-photo-basketball-basket-with-ball.jpg',
    },
    {
      'title': 'Voley',
      'subtitle': 'El voleibol es un deporte en el que dos equipos se enfrentan sobre un terreno de juego liso separados por una red central, tratando de pasar el balón por encima de la red hacia el suelo del campo contrario.',
      'imageUrl': 'https://e.rpp-noticias.io/xlarge/2023/09/19/474047_1476897.webp',
    },
    {
      'title': 'Tennis',
      'subtitle': 'El tenis es un deporte de raqueta practicado en un campo rectangular dividido por una red, en el que se enfrentan dos jugadores (individuales) o dos parejas (dobles).',
      'imageUrl': 'https://files.antena2.com/antena2/public/styles/imagen_despliegue/public/2022-06/Roger%20Federer%20-%20Wimbledon.jpeg.webp?VersionId=k8TFxQ75M6.bUhMr_61..pzX8SH9gsEw&itok=UF5PHuLK',
    },
    {
      'title': 'Frontón',
      'subtitle': 'El frontón es un deporte de pelota que se juega en una cancha cuadrangular con tres paredes (izquierda, fondo y derecha) y una superficie de juego de cemento, madera o césped sintético.',
      'imageUrl': 'https://www.sherlockcomms.com/wp-content/uploads/2023/09/sSEEqJVZE5edwu_U7hyFTetmG9B6BnDHRjW29x2cOc2IJGAXvRoUFHYtrPCyPgff3UDG1OddxcK9Hnyi1x6yaOltLSNPeGtR_PpjZvQ3XODanmEMN58onXVAPkwG8vMgEXOhX5YWPl8IJT5DED_fb6I-1.jpeg',
    },
    {
      'title': 'PingPong',
      'subtitle': 'El tenis de mesa, también conocido como ping-pong, es un deporte de raqueta que se disputa entre dos jugadores o dos parejas.',
      'imageUrl': 'https://media.istockphoto.com/id/1425158165/es/foto/ping-pong-de-ping-pong-de-mesa-y-pelota-blanca-sobre-tabla-azul.jpg?s=612x612&w=0&k=20&c=1U_oCZM85tf2GDwAxcrqcoSMenDsuvHvWVo88zkAMFs=',
    },
    {
      'title': 'Karate',
      'subtitle': 'El karate es un arte marcial tradicional de Japón que emplea golpes de puño, patadas, bloqueos y técnicas de defensa personal.',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSno6dL1l18MKN_z8K_EqjsUh6qjwldX6YxRT9W9jEYcQ&s',
    },
    // Agrega más datos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card Widget Example'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: cardData.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                width: double.infinity,
                height: 300, // Aumentamos la altura para mostrar mejor la imagen
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      cardData[index]['title']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(cardData[index]['subtitle']!),
                    SizedBox(height: 10),
                    Expanded(
                      child: Image.network(
                        cardData[index]['imageUrl']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Text('Image not found'),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
