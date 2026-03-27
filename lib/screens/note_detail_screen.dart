import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/note.dart';

class NoteDetailScreen extends StatefulWidget {
  final Note note;

  const NoteDetailScreen({Key? key, required this.note}) : super(key: key);

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  void _saveChanges() {
    if (_titleController.text.trim().isEmpty || _contentController.text.trim().isEmpty) {
      return;
    }
    final updatedNote = Note(
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      date: DateTime.now(),
      isFavorite: widget.note.isFavorite,
    );
    Navigator.pop(context, updatedNote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text("Edit Note", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle, size: 28, color: Colors.blueAccent),
            tooltip: 'Save Note',
            onPressed: _saveChanges,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                letterSpacing: -0.5,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
                hintStyle: TextStyle(color: Colors.grey.shade400),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(
                  fontSize: 18, 
                  height: 1.6,
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Start typing your notes here...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black87,
        elevation: 8,
        icon: const Icon(Icons.save, color: Colors.white),
        label: const Text("Save & Exit", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        onPressed: _saveChanges,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
