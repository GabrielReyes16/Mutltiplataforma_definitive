import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categorized List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorized List'),
      ),
      body: ListView(
        children: [
          CategoryItem(
            category: 'Alimentos',
            imageUrl: 'assets/images/food.png', // Imagen local
            name: 'Pizza',
            font: GoogleFonts.openSans(),
          ),
          CategoryItem(
            category: 'Animales',
            imageUrl: 'https://cdn.pixabay.com/photo/2018/08/19/10/52/lima-3616294_960_720.jpg', // Imagen de la web
            name: 'Tigre',
            font: GoogleFonts.lato(),
          ),
          CategoryItem(
            category: 'Lugares',
            imageUrl: 'assets/images/place.png', // Imagen local
            name: 'París',
            font: GoogleFonts.ubuntu(),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String category;
  final String imageUrl;
  final String name;
  final TextStyle font;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.imageUrl,
    required this.name,
    required this.font,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imageUrl,
        width: 50,
        height: 50,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset('assets/images/placeholder.png', width: 50, height: 50);
        },
      ),
      title: Text(
        name,
        style: font,
      ),
    );
  }
}
