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
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UseMemoizedHook()));
              },
              child: const Text('useMemoized()'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UseRefWidget()));
              },
              child: const Text('useRef()'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UseContextWidget()));
              },
              child: const Text('useContext()'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UseReducerWidget()));
              },
              child: const Text('useReducer()'),
            ),
          ],
        ),
      ),
    );
  }
}

/* --------------------------  useState() hook example --------------------------*/
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

/* --------------------------  useState() && useEffect() hook example --------------------------*/
class HookUseEffectWidget extends HookWidget {
  const HookUseEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _count = useState(0);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
              style: const TextStyle(fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }
}

/* --------------------------  useMemoized() hook example --------------------------*/
class UseMemoizedHook extends HookWidget {
  const UseMemoizedHook({super.key});

  @override
  Widget build(BuildContext context) {
    final count = useState(0);
    count.value++;

    Future<String> fetchData() async {
      await Future.delayed(const Duration(seconds: 1));
      return "UseMemoized Hook - ${count.value}";
    }

    final future = useMemoized(() => fetchData(), []);
    final snapShot = useFuture(future);
    return Scaffold(
        appBar: AppBar(
          title: const Text('useMemoized Hook'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
            child: snapShot.hasData
                ? Text("${snapShot.data}")
                : const CircularProgressIndicator()));
  }
}

/* --------------------------  useRef() hook example --------------------------*/
class UseRefWidget extends HookWidget {
  const UseRefWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final textController = useTextEditingController();
    final name = useRef('');
    useEffect(() {
      textController.addListener(() {
        name.value = textController.text;
      });
    }, []);

    return Scaffold(
        appBar: AppBar(
          title: const Text('useRed() Hook'),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            TextFormField(
              focusNode: focusNode,
              controller: textController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            const SizedBox(),
            Text(name.value)
          ],
        ));
  }
}

/* --------------------------  useCOntext() hook example --------------------------*/
class UseContextWidget extends HookWidget {
  const UseContextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final textController = useTextEditingController();
    final name = useRef('');
    useEffect(() {
      textController.addListener(() {
        name.value = textController.text;
      });
    }, []);
    return Scaffold(
        appBar: AppBar(
          title: const Text('useContext() Hook'),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'your-name'),
            ),
            SizedBox(),
            Text(name.value)
          ],
        ));
  }

  SizedBox sizedBox() =>
      SizedBox(height: MediaQuery.of(useContext()).size.height * 0.3);
}

/* --------------------------  useReducer() hook example --------------------------*/
class StateForUseReducer {
  final int counterForState;
  StateForUseReducer({this.counterForState = 0});
}

class IncrementAction {
  final int countValue;
  IncrementAction({this.countValue = 1});
}

class UseReducerWidget extends HookWidget {
  UseReducerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final StateForUseReducer initialState = StateForUseReducer();
    StateForUseReducer reducer(StateForUseReducer state, action) {
      if (action is IncrementAction) {
        return StateForUseReducer(
            counterForState: state.counterForState + action.countValue);
      }
      return state;
    }

    final store = useReducer(reducer,
        initialState: initialState,
        initialAction: IncrementAction(countValue: 0));
    return Scaffold(
      appBar: AppBar(
        title: const Text('useReducer() Hook'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('${store.state.counterForState}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.dispatch(IncrementAction(countValue: 1)),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
