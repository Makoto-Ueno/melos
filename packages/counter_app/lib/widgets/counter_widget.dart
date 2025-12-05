import 'package:flutter/material.dart';

/// 再利用可能なカウンターウィジェット
class CounterWidget extends StatefulWidget {
  final String? title;
  final Color? primaryColor;
  final int initialValue;
  final ValueChanged<int>? onCountChanged;

  const CounterWidget({
    super.key,
    this.title,
    this.primaryColor,
    this.initialValue = 0,
    this.onCountChanged,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.onCountChanged?.call(_counter);
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
      widget.onCountChanged?.call(_counter);
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      widget.onCountChanged?.call(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (widget.title != null)
          Text(widget.title!, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 16),
        Text(
          '$_counter',
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(color: widget.primaryColor),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _decrementCounter,
              icon: const Icon(Icons.remove),
              label: const Text('減らす'),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: _resetCounter,
              icon: const Icon(Icons.refresh),
              label: const Text('リセット'),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: _incrementCounter,
              icon: const Icon(Icons.add),
              label: const Text('増やす'),
            ),
          ],
        ),
      ],
    );
  }
}
