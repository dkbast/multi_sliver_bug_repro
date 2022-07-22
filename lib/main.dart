import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const DemoPage())),
              child: const Text(
                  'Crashing: CustomScrollView wrapped in SingleChildScrollView with MultiSliver'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const DemoPage())),
              child: const Text(
                  'Crashing: CustomScrollView wrapped in SingleChildScrollView without MultiSliver'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const WorkingDemoPage())),
              child: const Text('just CustomScrollView'),
            ),
          ],
        )));
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            MultiSliver(children: [
              SliverToBoxAdapter(
                child: Container(
                  height: 100,
                  color: Colors.red,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) => ListTile(
                    title: Text("Item $index"),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class DemoPage2 extends StatelessWidget {
  const DemoPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) => ListTile(
                  title: Text("Item $index"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkingDemoPage extends StatelessWidget {
  const WorkingDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          MultiSliver(children: [
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) => ListTile(
                  title: Text("Item $index"),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
