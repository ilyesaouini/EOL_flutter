import 'dart:convert';
import 'package:copihass/config.dart';
import 'package:copihass/ui/authentication/bloc/authentication_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? file;

  void pickercamera() async {
    final myfile = (await ImagePicker().pickImage(source: ImageSource.gallery));

    setState(() {
      file = File(myfile!.path);
      upload();
    });
  }

  Future upload() async {
    if (file == null) return;

    String base64 = base64Encode(file!.readAsBytesSync());
    var data = base64;
    print(usermodel.id);
    var respone = await http
        .patch(Uri.parse(imageurl), body: {'id': usermodel.id, 'image': data});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
