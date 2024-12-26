
import 'package:flutter/material.dart';

class DockItemWidget extends StatefulWidget {
  final IconData icon;

  const DockItemWidget({super.key, required this.icon});

  @override
  _DockItemWidgetState createState() => _DockItemWidgetState();
}

class _DockItemWidgetState extends State<DockItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<IconData>(
      data: widget.icon,
      feedback: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.primaries[
              widget.icon.hashCode % Colors.primaries.length],
            ),
            child: Center(
              child: Icon(widget.icon, color: Colors.white, size: 32),
            ),
          ),
        ),
      ),
      childWhenDragging: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade300,
        ),
      ),
      onDragStarted: () => _controller.forward(),
      onDragEnd: (details) => _controller.reverse(),
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.primaries[
          widget.icon.hashCode % Colors.primaries.length],
        ),
        child: Center(
          child: Icon(widget.icon, color: Colors.white, size: 32),
        ),
      ),
    );
  }
}
