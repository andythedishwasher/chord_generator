import 'package:chord_generator/Scripts/list_functions.dart';
import 'package:flutter/material.dart';
import 'package:chord_generator/Scripts/chord_generator.dart';



void main() {
  runApp(const MaterialApp(
    home: Home()
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

String? intention = '';
String? input = '';
String? chords = '';
String error = 'Not enough data. Consider elaborating.';
String dropdownvalue = 'C Major';
List items = ['C Major', 'A Minor', 'D Dorian', 'G Mixolydian', 'Raw Scale Degrees'];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chord Generator'),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: 'State your intention in as many words as possible.',
            onChanged: (val) {setState(() {
              input = val;
              });
            },
          ),

          DropdownButton(
              value: dropdownvalue,
              items: items.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items)
                      );
                    }).toList(),
              icon: Icon(Icons.album_sharp),
              onChanged: (dynamic newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
          ),

          TextButton(
          child: Text('Get Chords'),
          onPressed: () => setState(() {
                      var data = chordGen(input);
                      if(data != error) {
                        chords = specifyMode(data, dropdownvalue).join(', ');
                      } else {chords = error;}
                    })
          ),

          Container(
            color: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Text(chords!)
          ),

        ],
      ),
    );
  }
}

