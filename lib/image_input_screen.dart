import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

import 'package:vistaprint/template/select_image.dart';
import 'final_selection.dart';

class ImageInputScreen extends StatefulWidget {
  final int noOfPhotos;
  const ImageInputScreen(this.noOfPhotos, {super.key});

  @override
  State<ImageInputScreen> createState() {
    return _ImageInputScreenState();
  }
}

class _ImageInputScreenState extends State<ImageInputScreen> {
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
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectImage(noOfPhotos: widget.noOfPhotos, index: 1),
                  const SizedBox(width: 10),
                  SelectImage(noOfPhotos: widget.noOfPhotos, index: 2),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectImage(noOfPhotos: widget.noOfPhotos, index: 3),
                  const SizedBox(width: 10),
                  SelectImage(noOfPhotos: widget.noOfPhotos, index: 4),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            if (widget.noOfPhotos >= 6)
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectImage(noOfPhotos: widget.noOfPhotos, index: 5),
                    const SizedBox(width: 10),
                    SelectImage(noOfPhotos: widget.noOfPhotos, index: 6),
                  ],
                ),
              ),
            const SizedBox(
              height: 15,
            ),
            if (widget.noOfPhotos == 8)
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectImage(noOfPhotos: widget.noOfPhotos, index: 7),
                    const SizedBox(width: 10),
                    SelectImage(noOfPhotos: widget.noOfPhotos, index: 8),
                  ],
                ),
              ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 22, 9, 137),
                    ),
                  ),
                  onPressed: () async {
                    final imgDir =
                        await syspaths.getApplicationDocumentsDirectory();
                    //final fileName = path.basename(imageList[])
                    if (imageList[widget.noOfPhotos] == null) {
                      return;
                    }
                    final Map<int, String> saveDataCopy = {};
                    String fileName;
                    File imgCopy;
                    for (var key in imageList[widget.noOfPhotos]!.keys) {
                      fileName = path
                          .basename(imageList[widget.noOfPhotos]![key]!.path);
                      imgCopy = await imageList[widget.noOfPhotos]![key]!
                          .copy('${imgDir.path}/$fileName');
                      saveDataCopy.addAll({key: imgCopy.path});
                    }
                  },
                  child: const Text(
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      'Save'),
                ),
                const SizedBox(
                  width: 10,
                ),
                FilledButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 22, 9, 137),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) => AlertDialog(
                        title: const Text('Confirm Selections'),
                        content: const Text(
                            'Are you sure you want to select these photos for the album?'),
                        actions: [
                          FilledButton(
                            onPressed: () => Navigator.pop(ctx, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          FilledButton(
                              onPressed: () => Navigator.of(ctx).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => const FinalSelection(),
                                    ),
                                  ),
                              child: const Text('Confirm'))
                        ],
                      ),
                    );
                  },
                  child: const Text(
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      'Done'),
                ),
                const SizedBox(
                  width: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
