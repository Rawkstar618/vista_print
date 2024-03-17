import 'package:flutter/material.dart';

class OrderPlacement extends StatefulWidget {
  const OrderPlacement(
      {required this.price,
      required this.selectedColor,
      required this.selectedMat,
      required this.selectedPaper,
      super.key});
  final String selectedColor, selectedMat, selectedPaper;
  final double price;
  @override
  State<OrderPlacement> createState() {
    return _OrderPlacementState();
  }
}

class _OrderPlacementState extends State<OrderPlacement> {
  bool hasCode = false;
  final _codeController = TextEditingController();
  String _enteredCode = '';
  late int _enteredQuant = 1;
  double discount = 1;
  List<int> quantities = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    15,
    20,
    25,
    30,
    35,
    40,
    45,
    50
  ];
  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  bool toDisplay = false;
  @override
  Widget build(BuildContext context) {
    /*Widget details = Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const Text(
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  'Cover Material'),
              Text(
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w700),
                  widget.selectedMat),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const Text(
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  'Cover Color'),
              Text(
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w700),
                  widget.selectedColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const Text(
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  'Paper Type'),
              Text(
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w700),
                  widget.selectedPaper),
            ],
          ),
        ],
      ),
    );*/
    Widget details = Padding(
      padding: const EdgeInsets.only(left: 80.0, right: 45.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  'Cover Material'),
              Text(
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  'Cover Color'),
              Text(
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  'Paper Type'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  widget.selectedMat),
              Text(
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  widget.selectedColor),
              Text(
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  widget.selectedPaper)
            ],
          )
        ],
      ),
    );
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
                  'My cart'),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 218, 218, 218),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                          'Order Summary'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 22),
                              'Subtotal'),
                          Text(
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 22),
                              'Rs. ${widget.price}'),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 17),
                              'Have a code?'),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                hasCode = !hasCode;
                              });
                            },
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                          ),
                        ],
                      ),
                      if (hasCode)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextField(
                                controller: _codeController,
                                maxLength: 100,
                                decoration: const InputDecoration(
                                  label: Text('Enter Code'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            FilledButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black)),
                              onPressed: () {
                                if (_codeController.text != null)
                                  _enteredCode = _codeController.text;
                                else
                                  return;
                              },
                              child: const Text('Apply'),
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      FilledButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize: MaterialStatePropertyAll(
                            Size.fromHeight(40),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Photo Albums',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Row(
                    children: [
                      const Text('Quantity'),
                      const SizedBox(
                        width: 15,
                      ),
                      DropdownButton(
                          value: _enteredQuant,
                          items: quantities
                              .map(
                                (quant) => DropdownMenuItem<int>(
                                  alignment: Alignment.center,
                                  value: quant,
                                  child: Text('$quant'),
                                ),
                              )
                              .toList(),
                          onChanged: (quant) {
                            setState(
                              () => _enteredQuant = quant as int,
                            );
                          })
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _enteredQuant = 1;
                      });
                    },
                    child: const Text(
                      'Remove',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _enteredQuant = 1;
                      });
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 0.2),
                      ),
                    ),
                    width: 290,
                    child: const Text(
                      ' ',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const Text(
                    'Selected options',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        toDisplay = !toDisplay;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              if (toDisplay) details,
              Row(
                children: [
                  const SizedBox(
                    width: 73,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 0.2),
                      ),
                    ),
                    width: 290,
                    child: const Text(
                      ' ',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    const Text(
                      'Item Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Rs. ${widget.price * _enteredQuant}'),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.2),
                  ),
                ),
                width: 340,
                child: const Text(
                  ' ',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
