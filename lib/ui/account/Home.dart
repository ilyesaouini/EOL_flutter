import 'dart:convert';
import 'dart:io';
import 'package:copihass/ui/account/NavBar.dart';
import 'package:copihass/ui/emploi/emploi.dart';
import 'package:copihass/ui/reclamation/reclamation.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:copihass/ui/authentication/loginPage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

import 'bloc/account_bloc.dart';
import 'components/profile_menu.dart';

class Home extends StatefulWidget {
  final User user;
  const Home(this.user, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? file;
  late SharedPreferences prefs;

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void pickercamera() async {
    final myfile = (await ImagePicker().pickImage(source: ImageSource.gallery));

    setState(() {
      file = File(myfile!.path);
    });
    upload();
  }

  upload() {
    if (file == null) return;

    String base64 = base64Encode(file!.readAsBytesSync());
    var data = base64;
    print(widget.user.id);
    context.read<AccountBloc>().add(UploadImageEvent(widget.user.id, data));
  }

  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 236, 26, 26),
            title: Text(
              "ESPRIT",
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    prefs.remove("token");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: ((context) => SignInPage())),
                        (route) => false);
                  },
                  icon: Icon(Icons.logout_outlined))
            ]),
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
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        child: file == null
                            ? Image.asset("assets/profile_image.png")
                            : Image.file(file!),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75)),
                      ),
                      Positioned(
                        right: -16,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: const BorderSide(color: Colors.white),
                              ),
                              backgroundColor: Color.fromARGB(255, 46, 46, 47),
                            ),
                            onPressed: pickercamera,
                            child: Icon(Icons.add_a_photo),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ProfileMenu(
                  text: widget.user.nom_prenom ?? "N/A",
                  icon: "assets/icons/UserIcon.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: widget.user.nom ?? "N/A",
                  icon: "assets/icons/Bell.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: widget.user.prenom ?? "N/A",
                  icon: "assets/icons/Settings.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: widget.user.email ?? "N/A",
                  icon: "assets/icons/Question mark.svg",
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
