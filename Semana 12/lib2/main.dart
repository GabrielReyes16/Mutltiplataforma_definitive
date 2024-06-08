import 'package:flutter/material.dart';
import 'cupertino_examples.dart';
import 'material_examples.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Controls Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SliverNavBarApp(),
                  ),
                );
              },
              child: const Text('Cupertino Sliver Navigation Bar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SliverAppBarExample(),
                  ),
                );
              },
              child: const Text('Material Sliver App Bar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ActionSheetApp(),
                  ),
                );
              },
              child: const Text('Cupertino Action Sheet'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ActionSheetMaterialExample(),
                  ),
                );
              },
              child: const Text('Material Action Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
