import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreenWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PreCooked Flutter Hooks Samples'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HooksExampleWidget()));
              },
              child: const Text('useState()'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HookUseEffectWidget()));
              },
              child: const Text('useState() & useEffect()'),
            )
          ],
        ),
      ),
    );
  }
}

class HooksExampleWidget extends HookWidget {
  const HooksExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useState()'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have tapped ${counter.value} times'),
            TextButton(
              onPressed: () {
                counter.value--;
              },
              child: const Icon(Icons.minimize),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class UseState_UseEffectExampleWidget extends StatefulWidget {
  const UseState_UseEffectExampleWidget({super.key});

  @override
  State<UseState_UseEffectExampleWidget> createState() =>
      _UseState_UseEffectExampleWidgetState();
}

class _UseState_UseEffectExampleWidgetState
    extends State<UseState_UseEffectExampleWidget> {
  late Timer _timer;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (abc) {
      setState(() {
        _count = abc.tick;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('useState() && useEffect()'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_count',
              style: TextStyle(fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }
}

class HookUseEffectWidget extends HookWidget {
  const HookUseEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _count = useState(0);

    useEffect(() {
      final timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _count.value = timer.tick;
      });
      return timer.cancel;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useState() && useEffect()'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_count.value}',
              style: TextStyle(fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }
}
