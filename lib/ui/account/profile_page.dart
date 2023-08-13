import 'dart:convert';
import 'dart:io';
import 'package:copihass/ui/account/NavBar.dart';
import 'package:copihass/ui/emploi/emploi.dart';
import 'package:copihass/ui/reclamation/pages/reclamation.dart';
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

class ProfilePage extends StatefulWidget {
  final SharedPreferences prefs;
  ProfilePage({required this.prefs, super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? file;

  User user = User();

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
    print(user.id);
    context.read<AccountBloc>().add(UploadImageEvent(user.id, data));
  }

  @override
  void initState() {
    user = User(
      id: widget.prefs.getString('id'),
      nom_prenom: widget.prefs.getString('nom_prenom'),
      nom: widget.prefs.getString('nom'),
      prenom: widget.prefs.getString('prenom'),
      email: widget.prefs.getString('email'),
      image: widget.prefs.getString('image'),
      tel: widget.prefs.getString('tel'),
      role: widget.prefs.getString('role'),
    );
    print("id =" + user.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 180,
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(75)),
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
              text: user.nom_prenom ?? "N/A",
              icon: "assets/icons/user.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: user.nom ?? "N/A",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: user.prenom ?? "N/A",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: user.email ?? "N/A",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: user.tel ?? "N/A",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
