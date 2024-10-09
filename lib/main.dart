import 'package:flutter/material.dart';

void main() => runApp(NoteTakingApp());

class NoteTakingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Taking App',
      home: NoteTakingScreen(),
    );
  }
}

class NoteTakingScreen extends StatefulWidget {
  @override
  _NoteTakingScreenState createState() => _NoteTakingScreenState();
}

class _NoteTakingScreenState extends State<NoteTakingScreen> {
  TextEditingController noteController = TextEditingController();
  List<String> notes = [];

  void saveNote() {
    String note = noteController.text;
    if (note.isNotEmpty) {
      setState(() {
        notes.add(note);
        noteController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Note Taking Application'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 25),
          TextField(
            controller: noteController,
            decoration: InputDecoration(labelText: 'Enter the note'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                saveNote();
              });
            },
            child: const Text("Save Note"),
          ),
          const SizedBox(height: 25),
          Text('Saved Notes:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(notes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
