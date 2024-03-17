import 'package:flutter/material.dart';
import 'package:vistaprint/order_placement.dart';

class FinalSelection extends StatefulWidget {
  const FinalSelection({super.key});
  @override
  State<FinalSelection> createState() {
    return _FinalSelectionState();
  }
}

class _FinalSelectionState extends State<FinalSelection> {
  List<List<String>> coverMatList = [
    ['Paper', 'Base Price']
  ];
  List<List<String>> coverColorList = [
    ['None', 'Base Price']
  ];
  List<List<String>> paperStockList = [
    ['Standard Glossy', 'Base Price'],
    ['Standard Matte', 'Base Price'],
  ];
  String selectedMat = 'Paper',
      selectedColor = 'None',
      selectedPaper = 'Standard Glossy';
  int qty = 1;
  double price = 650;
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
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 27),
                              'Final Steps'),
                          const Text(
                              'Almost done! Make selections below to finalize your design. Have questions? Call us at 02522-669393.'),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                    'STEP 1'),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                    'Cover Material'),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: coverMatList.length,
                                itemBuilder: (context, index) => Container(
                                  decoration: BoxDecoration(
                                    border:
                                        selectedMat == coverMatList[index][0]
                                            ? Border.all(
                                                color: Colors.black, width: 2)
                                            : null,
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        if (selectedMat ==
                                            coverMatList[index][0]) {
                                          selectedMat = '';
                                        } else {
                                          selectedMat = coverMatList[index][0];
                                        }
                                      });
                                    },
                                    title: Text(coverMatList[index][0]),
                                    trailing: Text(coverMatList[index][1]),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                    'STEP 2'),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                    'Cover Color'),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: coverColorList.length,
                                itemBuilder: (context, index) => Container(
                                  decoration: BoxDecoration(
                                    border: selectedColor ==
                                            coverColorList[index][0]
                                        ? Border.all(
                                            color: Colors.black, width: 2)
                                        : null,
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        if (selectedColor ==
                                            coverColorList[index][0]) {
                                          selectedColor = '';
                                        } else {
                                          selectedColor =
                                              coverColorList[index][0];
                                        }
                                      });
                                    },
                                    title: Text(coverColorList[index][0]),
                                    trailing: Text(coverColorList[index][1]),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                    'STEP 3'),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                    'Select a paper stock'),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: paperStockList.length,
                                itemBuilder: (context, index) => Container(
                                  decoration: BoxDecoration(
                                    border: selectedPaper ==
                                            paperStockList[index][0]
                                        ? Border.all(
                                            color: Colors.black, width: 2)
                                        : null,
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      setState(
                                        () {
                                          if (selectedPaper ==
                                              paperStockList[index][0]) {
                                            selectedPaper = '';
                                          } else {
                                            selectedPaper =
                                                paperStockList[index][0];
                                          }
                                        },
                                      );
                                    },
                                    title: Text(paperStockList[index][0]),
                                    trailing: Text(paperStockList[index][1]),
                                  ),
                                ),
                              ),
                            ]),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      height: 500,
                      width: double.infinity,
                      child: const Center(
                        child: Text('Preview Placeholder'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rs. $price'),
                    const SizedBox(
                      height: 15,
                    ),
                    FilledButton(
                      style: const ButtonStyle(
                        minimumSize:
                            MaterialStatePropertyAll(Size.fromHeight(40)),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 22, 9, 137),
                        ),
                      ),
                      onPressed: () {
                        if (selectedColor == '' ||
                            selectedMat == '' ||
                            selectedPaper == '') {
                          return;
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OrderPlacement(
                                price: price,
                                selectedColor: selectedColor,
                                selectedMat: selectedMat,
                                selectedPaper: selectedPaper,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Add to Cart',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
