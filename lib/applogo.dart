import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CommonLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          "https://img2.freepng.fr/20180708/prk/kisspng-esprit-higher-school-of-communication-of-tunis-con-emam-5b42b64c541ab4.5414050515310987003445.jpg",
          width: 300,
        ),
        "ESPRIT".text.xl2.italic.make(),
        "Se former autrement".text.light.white.wider.lg.make(),
      ],
    );
  }
}
