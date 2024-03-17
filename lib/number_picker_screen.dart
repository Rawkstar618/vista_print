import 'package:flutter/material.dart';
import 'package:vistaprint/image_input_screen.dart';
import 'package:vistaprint/template/NPS_button_template.dart';

class NumberPickerScreen extends StatefulWidget {
  const NumberPickerScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NumberPickerScreenState();
  }
}

class _NumberPickerScreenState extends State<NumberPickerScreen> {
  int noOfPhotos = 0;
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
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NPSButtonTemplate(
                onPressed: () {
                  noOfPhotos = 4;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => ImageInputScreen(noOfPhotos)),
                  );
                },
                text: const ['4', 'Photos'],
              ),
              const SizedBox(
                height: 20,
              ),
              NPSButtonTemplate(
                onPressed: () {
                  noOfPhotos = 6;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => ImageInputScreen(noOfPhotos)),
                  );
                },
                text: const ['6', 'Photos'],
              ),
              const SizedBox(
                height: 20,
              ),
              NPSButtonTemplate(
                onPressed: () {
                  noOfPhotos = 8;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => ImageInputScreen(noOfPhotos)),
                  );
                },
                text: const ['8', 'Photos'],
              )
            ],
          ),
        ),
      ),
    );
  }
}
