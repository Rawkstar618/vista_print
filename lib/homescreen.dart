import 'package:flutter/material.dart';
import 'package:vistaprint/options_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(context) {
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
        alignment: Alignment.topLeft,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/image-1.png"), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Color.fromRGBO(255, 255, 255, 0)])),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    style: TextStyle(fontSize: 24), 'Stay organized with\n'),
                const Text(
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    'Calendar,\nNotebooks \n&\nDiaries'),
                const Text(
                    style: TextStyle(fontSize: 18), '\nStarts at Rs 150'),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 22, 9, 137),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const OptionsScreen(),
                      ),
                    );
                  },
                  child: const Text('Albums'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
