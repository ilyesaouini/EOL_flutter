import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class notePage extends StatefulWidget {
  const notePage({super.key});

  @override
  State<notePage> createState() => _notePageState();
}

class _notePageState extends State<notePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note")),
      body: Text("ssss"),
    );
  }
}
