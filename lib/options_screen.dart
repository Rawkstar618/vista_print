import 'package:flutter/material.dart';
import 'package:vistaprint/type_selection.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});
  @override
  State<OptionsScreen> createState() {
    return _OptionsScreenState();
  }
}

class _OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const ListTile(
              title: Text(''),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('My Cart'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Help and Support'),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 22, 9, 137),
        title:
            Image.asset(height: 35, width: 860, 'lib/assets/company-logo.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                  style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
                  'Photo Gifts'),
            ),
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                'Customize with your special \nphotos, text & design.'),
            SizedBox(height: 10),
            Image.asset('lib/assets/image-2.png'),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const TypeSelection(),
                  ),
                );
              },
              child: Container(
                child: Column(
                  children: [
                    Image.asset('lib/assets/photo-albums.png'),
                    const Text(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        'Photo Albums')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
