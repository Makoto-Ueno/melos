import 'package:flutter/material.dart';
import 'package:counter_app/widgets/counter_widget.dart';

void main() {
  runApp(const MultiCounterApp());
}

class MultiCounterApp extends StatelessWidget {
  const MultiCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MultiCounterPage(),
    );
  }
}

class MultiCounterPage extends StatefulWidget {
  const MultiCounterPage({super.key});

  @override
  State<MultiCounterPage> createState() => _MultiCounterPageState();
}

class _MultiCounterPageState extends State<MultiCounterPage> {
  int _redCount = 0;
  int _blueCount = 0;
  int _greenCount = 0;

  int get _totalCount => _redCount + _blueCount + _greenCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('マルチカウンター'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 4,
                color: Colors.purple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        '合計カウント',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$_totalCount',
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CounterWidget(
                    title: '🔴 赤カウンター',
                    primaryColor: Colors.red,
                    onCountChanged: (count) {
                      setState(() => _redCount = count);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CounterWidget(
                    title: '🔵 青カウンター',
                    primaryColor: Colors.blue,
                    onCountChanged: (count) {
                      setState(() => _blueCount = count);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CounterWidget(
                    title: '🟢 緑カウンター',
                    primaryColor: Colors.green,
                    onCountChanged: (count) {
                      setState(() => _greenCount = count);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
