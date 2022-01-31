import 'package:flutter/material.dart';
var bgGradient = new LinearGradient(
  colors: [const Color(0xFF9BFBC1), const Color(0xFFF3F9A7)],
  tileMode: TileMode.clamp,
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  stops: [0.0, 1.0],
);

var btnGradient = new LinearGradient(
  colors: [const Color(0xFF37ecba), const Color(0xFF72afd3)],
  tileMode: TileMode.clamp,
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  stops: [0.0, 1.0],
);
class Gredients extends StatefulWidget {
  const Gredients({Key? key}) : super(key: key);

  @override
  _GredientsState createState() => _GredientsState();
}

class _GredientsState extends State<Gredients> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
