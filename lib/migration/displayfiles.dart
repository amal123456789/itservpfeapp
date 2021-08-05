import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
/////displayfiles
class displayfiles extends StatefulWidget {
  @override
  _displayfilesState createState() => _displayfilesState();
}

class _displayfilesState extends State<displayfiles> {


  // This will be displayed on the screen
  String _content;

  // Find the Documents path
  Future<String> _getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();
    return _dir.path;
  }

  // This function is triggered when the "Read" button is pressed
  Future<void> _readData() async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath C:/src/Projects/itservpfeapp/lib/migration/data.txt');
    final _data = await _myFile.readAsString(encoding: utf8);
    setState(() {
      _content = _data;
    });
  }

  // TextField controller
  final _textController = TextEditingController();
  // This function is triggered when the "Write" buttion is pressed
  Future<void> _writeData() async {
    final _dirPath = await _getDirPath();
    
    final _myFile = File('$_dirPath C:/src/Projects/itservpfeapp/lib/migration/data.txt');
    // If data.txt doesn't exist, it will be created automatically
///C:\src\Projects\itservpfeapp\lib\migration\displayfiles.dart
    await _myFile.writeAsString(_textController.text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            ElevatedButton(
              child: Text('Save to file'),
              onPressed: _writeData,
            ),
            SizedBox(
              height: 150,
            ),
            Text(
                _content != null
                    ? _content
                    : 'Press the button to load your name',
                style: TextStyle(fontSize: 24, color: Colors.pink)),
            ElevatedButton(
              child: Text('Read my name from the file'),
              onPressed: _readData,
            )
          ],
        ),
      ),
    );
  
  }
}