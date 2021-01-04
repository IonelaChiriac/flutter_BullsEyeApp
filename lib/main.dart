import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bulls_eye/prompt.dart';
import 'package:bulls_eye/control.dart';

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'BullsEye',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GamePage(title: 'BullsEye'),
    );
  }
}

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _alertIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Prompt(targetValue: 100),
            Control(),
            FlatButton(
              child: Text('Hit Me!', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                this._alertIsVisible = true;
                _showAlert(context);
                print("Button pressed! $_alertIsVisible");
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("Awesome!"),
      onPressed: () {
        Navigator.of(context).pop();
        this._alertIsVisible = false;
        print("Awesome pressed! $_alertIsVisible");
      },
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hello there!"),
          content: Text("This is my first pop-up."),
          actions: [
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }
}
//TODO: add another button that says knock knock
//TODO: if you tap the button you will get a message who's there in his title
//TODO: a knock knock joke will apear in a message in dismiss button

//TODO: add a flat button below the hit me button that has the text knock knock
//TODO: write a code to display a pop up alert that is saying who's there
//TODO: copy amd paste the alert visible property and rename it to who's there is Visible
//TODO: modify the knock knock action to say who's there is visible to true
//TODO: call the alert method on the knock knock button to present an alert who's there at the state variable is true
