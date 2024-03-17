import 'package:flutter/material.dart';
import 'package:vistaprint/number_picker_screen.dart';

class TypeSelection extends StatefulWidget {
  const TypeSelection({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TypeSelectionState();
  }
}

class _TypeSelectionState extends State<TypeSelection> {
  List<String> options = [
    'Small Landscape (13 cm x 10 cm)',
    'Medium Landscape (20 cm x 15 cm)',
    'Large Landscape (28 cm x 21 cm)',
    'XL Landscape (39 cm x 29 cm)',
    'Large Portrait (21 cm x 28 cm)',
    'Medium Square (14 cm x 14 cm)',
    'Large Square (21 cm x 21 cm)',
    'XL Square (30 cm x 30 cm)',
  ];
  String? selectedSize = 'Small Landscape (13 cm x 10 cm)';
  late PageController _pageController;
  List<String> images = [
    'lib/assets/carousel-image-1.png',
    'lib/assets/carousel-image-2.png',
    'lib/assets/carousel-image-3.png',
    'lib/assets/carousel-image-4.png',
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
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
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        itemCount: images.length,
                        pageSnapping: true,
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(
                            () {
                              activePage = page;
                            },
                          );
                        },
                        itemBuilder: (context, position) => Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.asset(
                            fit: BoxFit.cover,
                            images[position],
                          ),
                        ),
                      ),
                    ),
                    const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                        'Photo Albums'),
                    const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                        'Create a custom photo album to celebrate your wedding or other milestone moments.\n'),
                    const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                        '      \u2022  8 photo album sizes and layouts'),
                    const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                        '      \u2022  Full-color printing on 24 to 120 pages'),
                    const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                        '      \u2022  3 album cover options: Linen, Leather \n  or Photo Printed'),
                    const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                        '      \u2022  Printed on photo quality 200 gsm paper.'),
                    const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                        '      \u2022  Online & offline design editor options'),
                    const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                        '      \u2022  Explore Layflat Photo Albums for \n  a premium, perfectly flat experience.'),
                    const Text(
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        '\nCash on Delivery available\n'),
                    const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        '      \u2022  Price below is MRP (inclusive of all taxes)'),
                    const Text(
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                        '\nNote:'),
                    const Text(
                        '      \u2022  Upload of less than 24 pages will have\n  blank pages due to\n  binding process requirement.\n      \u2022  Prices shown here is inclusive of GST.\n  You may see a different price in editor\n  which doesn\'t include GST.'),
                    const SizedBox(height: 40),
                    Center(
                      child: DropdownButton(
                        alignment: Alignment.center,
                        value: selectedSize,
                        items: options
                            .map(
                              (item) => DropdownMenuItem<String>(
                                alignment: Alignment.center,
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: (item) {
                          setState(
                            () => selectedSize = item,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => const NumberPickerScreen(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 40)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  style: TextStyle(color: Colors.white),
                                  'Start Designing'),
                              SizedBox(
                                width: 100,
                              ),
                              Icon(
                                  color: Colors.white,
                                  Icons.arrow_right_alt_outlined),
                            ]))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
