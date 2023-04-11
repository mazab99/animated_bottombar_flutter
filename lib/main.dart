import 'package:flutter/material.dart';
import 'components/AnimatedBottomBar.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _views = [
    const Center(
      child: Text(
        "MENU SCREEN ",
        style: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    const Center(
      child: Text(
        "SEARCH SCREEN ",
        style: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    const Center(
      child: Text(
        "FAVORITE SCREEN ",
        style: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    const Center(
      child: Text(
        "PROFILE SCREEN ",
        style: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    )
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      bottomNavigationBar: Builder(
        builder: (context) => AnimatedBottomBar(
          defaultIconColor: Colors.black,
          activatedIconColor: Colors.redAccent,
          background: Colors.white,
          buttonsIcons: const [
            Icons.menu,
            Icons.search,
            Icons.favorite,
            Icons.person
          ],
          buttonsHiddenIcons: const [
            Icons.camera_alt,
            Icons.videocam,
            Icons.mic,
            Icons.music_note
          ],
          backgroundColorMiddleIcon: Colors.redAccent,
          onTapButton: (i) {
            setState(() {
              index = i;
            });
          },
          onTapButtonHidden: (i) {
            _alertExample("You touched at button of index $i");
          },
        ),
      ),
      body: _views[index],
    );
  }

  Future<void> _alertExample(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert example'),
          content: Text(message),
          actions: <Widget>[
            MaterialButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
