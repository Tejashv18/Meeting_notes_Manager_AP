import 'package:flutter/material.dart';
import '../models/note.dart';
import 'package:intl/intl.dart';
import '../screens/note_detail_screen.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback? onDelete;
  final VoidCallback? onToggleFavorite;
  final ValueChanged<Note>? onEdit;

  const NoteCard({required this.note, this.onDelete, this.onToggleFavorite, this.onEdit});

  List<Color> _getGradientForNote(String title) {
    final gradients = [
      [Color(0xFFFF9A9E), Color(0xFFFECFEF)],
      [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
      [Color(0xFF84fab0), Color(0xFF8fd3f4)],
      [Color(0xFFfccb90), Color(0xFFd57eeb)],
      [Color(0xFFe0c3fc), Color(0xFF8ec5fc)],
      [Color(0xFFfdcbf1), Color(0xFFe6dee9)],
      [Color(0xFFa1c4fd), Color(0xFFc2e9fb)],
    ];
    int hash = 0;
    for (int i = 0; i < title.length; i++) {
      hash += title.codeUnitAt(i);
    }
    return gradients[hash % gradients.length];
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors = _getGradientForNote(note.title);

    return GestureDetector(
      onTap: () async {
        final updatedNote = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteDetailScreen(note: note),
          ),
        );
        if (updatedNote != null && onEdit != null) {
          onEdit!(updatedNote as Note);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: gradientColors[0].withOpacity(0.35),
              blurRadius: 10,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    note.title,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22, color: Colors.black.withOpacity(0.85), height: 1.2),
                  ),
                ),
                Row(
                  children: [
                    if (onToggleFavorite != null)
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: note.isFavorite ? Colors.amber.withOpacity(0.9) : Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            note.isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
                            color: note.isFavorite ? Colors.white : Colors.black.withOpacity(0.8)
                          ),
                          onPressed: onToggleFavorite,
                          tooltip: note.isFavorite ? 'Unfavorite' : 'Favorite',
                        ),
                      ),
                    if (onDelete != null)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.delete_outline, color: Colors.black.withOpacity(0.7)),
                          onPressed: onDelete,
                          tooltip: 'Delete Note',
                        ),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              note.content,
              style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7), height: 1.4),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.calendar_today, size: 14, color: Colors.black.withOpacity(0.6)),
                      const SizedBox(width: 6),
                      Text(
                        DateFormat.MMMd().format(note.date),
                        style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black.withOpacity(0.4)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}