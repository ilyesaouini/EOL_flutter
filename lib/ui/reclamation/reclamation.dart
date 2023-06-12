import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../account/NavBar.dart';
import '../account/bloc/account_bloc.dart';
import '../authentication/loginPage.dart';

class reclamationPage extends StatefulWidget {
  const reclamationPage({super.key});

  @override
  State<reclamationPage> createState() => _reclamationPageState();
}

class _reclamationPageState extends State<reclamationPage> {
  late SharedPreferences prefs;
  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 26, 26),
        title: Text('Reclamation'),
        actions: [
          IconButton(
              onPressed: () {
                prefs.remove("token");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: ((context) => SignInPage())),
                    (route) => false);
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 236, 26, 26),
                  Color.fromARGB(255, 88, 87, 86)
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomCenter,
                stops: [0.0, 0.8],
                tileMode: TileMode.mirror),
          ),
          child: SafeArea(
            child: Center(
              child: Container(
                color: Colors.grey,
                height: 150,
                width: 400,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reclamation:"),
                        SizedBox(height: 10),
                        Text("Reponse:"),
                        SizedBox(height: 10),
                        Text("Re-reclamation:"),
                        SizedBox(height: 10),
                        TextButton(
                            onPressed: () => {}, child: Icon(Icons.hdr_off))
                      ],
                    ),
                    Column(
                      children: [],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
