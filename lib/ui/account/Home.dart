import 'dart:convert';
import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:copihass/config.dart';
import 'package:copihass/ui/account/components/profile_pic.dart';

import 'package:copihass/ui/authentication/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';
import '../authentication/bloc/authentication_bloc.dart';
import 'bloc/account_bloc.dart';
import 'components/profile_menu.dart';

final items = const [
  Icon(
    Icons.home,
    size: 30,
  ),
  Icon(
    Icons.timelapse,
    size: 30,
  ),
  Icon(
    Icons.view_quilt_rounded,
    size: 30,
  ),
  Icon(
    Icons.person,
    size: 30,
  ),
];
int index = 1;

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
    context.read<AccountBloc>().add(UpladImageEvent(widget.user.id, data));
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
                              backgroundColor: const Color(0xFFF5F6F9),
                            ),
                            onPressed: pickercamera,
                            child: SvgPicture.asset(
                                "assets/icons/Camera Icon.svg"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ProfileMenu(
                  text: widget.user.nom_prenom ?? "N/A",
                  icon: "assets/icons/User Icon.svg",
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
        bottomNavigationBar: CurvedNavigationBar(
          items: items,
          index: index,
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
          height: 70,
          color: Colors.grey.shade600,
          backgroundColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
