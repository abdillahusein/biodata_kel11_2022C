import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroupPage(),
    );
  }
}

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelompok 11'),
      ),
      body: Column(
        children: [
          MemberCard(
            name: 'M. Husein Abdillah',
            occupation: 'Mahasiswa',
            placeholderImage: 'assets/Husein.jpg',
          ),
          MemberCard(
            name: 'Adinda Nasywa Salsabila',
            occupation: 'Mahasiswa',
            placeholderImage: 'assets/Adinda.jpg',
          ),
          MemberCard(
            name: 'Hkang Yochanan Tdamu',
            occupation: 'Mahasiswa',
            placeholderImage: 'assets/Hkang.jpg',
          ),
        ],
      ),
    );
  }
}

class MemberCard extends StatefulWidget {
  final String name;
  final String occupation;
  final String placeholderImage;

  const MemberCard({
    Key? key,
    required this.name,
    required this.occupation,
    required this.placeholderImage,
  }) : super(key: key);

  @override
  _MemberCardState createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: getImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null
                    ? Image.file(_image!).image
                    : AssetImage(widget.placeholderImage),
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.occupation,
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)), // Changed the color here
            ),
          ],
        ),
      ),
    );
  }
}
