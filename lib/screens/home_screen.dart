import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/note.dart';
import '../widgets/note_card.dart';
import 'add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Note> _notes = [];
  String _searchQuery = '';
  int _selectedIndex = 0;

  // Mock User Data
  final String _userName = "Tejas";
  String _greeting = "Hello,";
  Timer? _greetingTimer;

  @override
  void initState() {
    super.initState();
    _updateGreeting();
    // Update greeting every minute to keep it perfectly in sync with real-time
    _greetingTimer = Timer.periodic(const Duration(minutes: 1), (_) => _updateGreeting());
  }

  @override
  void dispose() {
    _greetingTimer?.cancel();
    super.dispose();
  }

  void _updateGreeting() {
    final hour = DateTime.now().hour;
    String newGreeting;
    if (hour < 12) {
      newGreeting = "Good Morning,";
    } else if (hour < 17) {
      newGreeting = "Good Afternoon,";
    } else {
      newGreeting = "Good Evening,";
    }

    if (_greeting != newGreeting) {
      if (mounted) {
        setState(() => _greeting = newGreeting);
      }
    }
  }

  List<Note> get _filteredNotes {
    if (_searchQuery.isEmpty) return _notes.reversed.toList();
    return _notes.where((note) {
      return note.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             note.content.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList().reversed.toList();
  }

  void _addNote(Note note) {
    setState(() {
      _notes.add(note);
      _searchQuery = '';
    });
    _showSnackBar('Note added successfully! 🎉');
  }

  void _deleteNote(Note note) {
    setState(() => _notes.remove(note));
    _showSnackBar('Note moved to trash. 🗑️');
  }

  void _updateNote(Note oldNote, Note updatedNote) {
    final index = _notes.indexOf(oldNote);
    if (index != -1) {
      setState(() => _notes[index] = updatedNote);
      _showSnackBar('Note updated! ✏️');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildSharedTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_shared_rounded, size: 80, color: Colors.blue.shade200),
          const SizedBox(height: 16),
          const Text("Shared Workspace", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("Notes shared with your team will appear here.", style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget _buildFavoritesTab() {
    final favoriteNotes = _notes.where((n) => n.isFavorite).toList();
    
    if (favoriteNotes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star_rounded, size: 80, color: Colors.amber.shade200),
            const SizedBox(height: 16),
            const Text("Favorites", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Starred and pinned notes will be saved here.", style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      );
    }
    
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 100),
      itemCount: favoriteNotes.length,
      itemBuilder: (ctx, i) {
        final note = favoriteNotes[i];
        return NoteCard(
          note: note,
          onDelete: () => _deleteNote(note),
          onEdit: (updated) => _updateNote(note, updated),
          onToggleFavorite: () {
            setState(() {
              note.isFavorite = !note.isFavorite;
            });
            _showSnackBar(note.isFavorite ? 'Note added to Favorites! ⭐️' : 'Removed from Favorites.');
          },
        );
      },
    );
  }

  Widget _buildSettingsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings_rounded, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          const Text("Settings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("App preferences and account management.", style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            // Tab 0: Home
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
                  child: Text(
                    _greeting,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                
                // Premium Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                         BoxShadow(color: Colors.blueGrey.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, 10))
                      ]
                    ),
                    child: TextField(
                      onChanged: (val) => setState(() => _searchQuery = val),
                      decoration: InputDecoration(
                        hintText: 'Search across all notes...',
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w500),
                        prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
                        suffixIcon: _searchQuery.isNotEmpty 
                          ? IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                setState(() => _searchQuery = '');
                              },
                            ) 
                          : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(18),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Main Content Area
                Expanded(
                  child: _notes.isEmpty
                      ? Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'assets/images/empty_notes.png',
                              fit: BoxFit.cover,
                            ),
                            Container(
                              color: Colors.white.withOpacity(0.9),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.library_books, size: 64, color: Colors.blueAccent),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  "Your workspace is empty",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black87,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  "Create your first beautiful note today.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : _filteredNotes.isEmpty 
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.search_off, size: 64, color: Colors.grey.shade300),
                                  const SizedBox(height: 16),
                                  Text("No matches found", style: TextStyle(color: Colors.grey.shade600, fontSize: 18, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 100), // extra padding for FAB
                              itemCount: _filteredNotes.length,
                              itemBuilder: (ctx, i) {
                                final note = _filteredNotes[i];
                                return Dismissible(
                                  key: ValueKey(note.title + note.date.toString()),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (_) => _deleteNote(note),
                                  background: Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 32),
                                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFF5252),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: const Icon(Icons.delete_sweep, color: Colors.white, size: 32),
                                  ),
                                  child: NoteCard(
                                    note: note,
                                    onDelete: () => _deleteNote(note),
                                    onEdit: (updated) => _updateNote(note, updated),
                                    onToggleFavorite: () {
                                      setState(() {
                                        note.isFavorite = !note.isFavorite;
                                      });
                                      _showSnackBar(note.isFavorite ? 'Note added to Favorites! ⭐️' : 'Removed from Favorites.');
                                    },
                                  ),
                                );
                              },
                            ),
                ),
              ],
            ),
            // Tab 1: Shared
            _buildSharedTab(),
            // Tab 2: Favorites
            _buildFavoritesTab(),
            // Tab 3: Settings
            _buildSettingsTab(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        elevation: 8,
        icon: const Icon(Icons.edit_document, color: Colors.white),
        label: const Text("New Note", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => AddNoteScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeOutQuart)
                  ),
                  child: child,
                );
              },
            ),
          );
          if (newNote != null) _addNote(newNote);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey.shade400,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 20,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.folder_shared_rounded), label: "Shared"),
          BottomNavigationBarItem(icon: Icon(Icons.star_rounded), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_rounded), label: "Settings"),
        ],
      ),
    );
  }
}