import 'package:flutter/material.dart';

class DockViewModel extends ChangeNotifier {
  final List<IconData> _items = [
    Icons.person,
    Icons.message,
    Icons.call,
    Icons.camera,
    Icons.photo,
  ];

  List<IconData> get items => List.unmodifiable(_items);

  void reorder(IconData draggedIcon, int newIndex) {
    final oldIndex = _items.indexOf(draggedIcon);
    if (oldIndex != -1) {
      _items.removeAt(oldIndex);
      _items.insert(newIndex, draggedIcon);
      notifyListeners();
    }
  }
}
