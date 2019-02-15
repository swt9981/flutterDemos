import 'package:flutter/material.dart';

void main() {
  runApp(home5);
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

RaisedButton raisedButton = new RaisedButton(
  highlightColor: Colors.red,
  padding: const EdgeInsets.all(30.0),
  colorBrightness: Brightness.dark,
  highlightElevation: 8.0,
  elevation: 0.0,
  textColor: Colors.purple,
  splashColor: Color(0x00ffff00),
  onPressed: () {
    print('test2222');
  },
  onHighlightChanged: (isT) {
    print('isT = $isT');
  },
  child: new Text(
    'test',
    textDirection: TextDirection.ltr,
  ),
);

Widget home = new Center(
  child: new Container(
      width: 120.0,
      height: 120.0,
      color: Colors.blue,
      child: new Center(
        child: new SizedBox(
          width: 100.0,
          height: 100.0,
          child: raisedButton,
        ),
      )
  ),
);

Widget home5 = new Center(
  child: Container(
    child: home,
    width: 200.0,
    height: 200.0,
    color: Colors.yellow,
  ),
);
