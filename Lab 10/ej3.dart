import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageGalleryScreen(),
    );
  }
}

class ImageGalleryScreen extends StatelessWidget {
  const ImageGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> images = [
      {'name': 'PNG Image', 'path': 'assets/images/image1.png', 'type': 'png'},
      {'name': 'JPEG Image', 'path': 'assets/images/image2.jpg', 'type': 'jpeg'},
      {'name': 'SVG Image', 'path': 'assets/images/image3.svg', 'type': 'svg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (image['type'] == 'svg')
                  SvgPicture.asset(
                    image['path']!,
                    width: 100,
                    height: 100,
                  )
                else
                  Image.asset(
                    image['path']!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                const SizedBox(height: 8),
                Text(
                  image['name']!,
                  style: getTextStyle(image['type']!),
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }

  TextStyle getTextStyle(String type) {
    switch (type) {
      case 'png':
        return GoogleFonts.aladin(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        );
      case 'jpeg':
        return GoogleFonts.notoSansLimbu(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        );
      case 'svg':
        return GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        );
      default:
        return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        );
    }
  }
}
