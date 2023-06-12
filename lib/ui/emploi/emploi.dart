import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Emploi extends StatefulWidget {
  const Emploi({super.key});

  @override
  State<Emploi> createState() => _EmploiState();
}

class _EmploiState extends State<Emploi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("emploi"),
    );
  }
}
