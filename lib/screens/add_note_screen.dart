import 'package:flutter/material.dart';
import '../models/note.dart';
import '../data/templates.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _applyTemplate(Map<String, String> template) {
    setState(() {
      _titleController.text = template["title"] ?? "";
      _contentController.text = template["content"] ?? "";
    });
    Navigator.pop(context); // close bottom sheet
  }

  void _showTemplates() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (_, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(width: 40, height: 5, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10))),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Manager Templates",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: TemplateData.managerTemplates.length,
                      itemBuilder: (context, index) {
                        final template = TemplateData.managerTemplates[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          title: Text(template["title"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          subtitle: Text(template["description"] ?? "", style: TextStyle(color: Colors.grey.shade600)),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueAccent),
                          onTap: () => _applyTemplate(template),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _saveNote() {
    if (_titleController.text.trim().isEmpty ||
        _contentController.text.trim().isEmpty) {
      return;
    }

    final newNote = Note(
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      date: DateTime.now(),
    );

    Navigator.pop(context, newNote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text("Create Note", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: const Icon(Icons.library_books, color: Colors.blueAccent),
            tooltip: "Use Template",
            onPressed: _showTemplates,
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
                hintStyle: TextStyle(color: Colors.grey.shade300),
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
                  hintText: "Start typing your profound thoughts...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        elevation: 8,
        icon: const Icon(Icons.check, color: Colors.white),
        label: const Text("Save Note", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        onPressed: _saveNote,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}