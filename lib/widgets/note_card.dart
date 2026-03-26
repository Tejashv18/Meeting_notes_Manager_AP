import 'package:flutter/material.dart';
import '../models/note.dart';
import 'package:intl/intl.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback? onDelete;

  const NoteCard({required this.note, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(note.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                if (onDelete != null)
                  IconButton(icon: const Icon(Icons.delete_outline), onPressed: onDelete),
              ],
            ),
            const SizedBox(height: 8),
            Text(note.content, maxLines: 3, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 12),
            Text(
              DateFormat.MMMd().format(note.date),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}