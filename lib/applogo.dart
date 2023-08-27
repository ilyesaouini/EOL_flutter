import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CommonLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        "ESPRIT".text.xl6.italic.make(),
        "Se former autrement".text.light.white.wider.lg.make(),
      ],
    );
  }
}
