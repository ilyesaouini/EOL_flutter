import 'package:copihass/ui/absence/absence_page.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';

import 'package:copihass/ui/note/note.dart';
import 'package:copihass/ui/reclamation/reclamation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    late SharedPreferences prefs;
    void initSharedPref() async {
      prefs = await SharedPreferences.getInstance();
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('user:'),
            accountEmail: Text(
              'email',
            ),
            currentAccountPicture: CircleAvatar(
              child: Image.asset(
                'assets/profile_image.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIIfMT_yML2or2Y_pd2v5aWk96w9_5JSVIxQ&usqp=CAU'),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: (() => print('object')),
          ),
          ListTile(
            leading: const Icon(Icons.note),
            title: const Text('Notes'),
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const notePage(),
                ))),
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Absences'),
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>  AbsencePage(),
                ))),
          ),
          ListTile(
            leading: const Icon(Icons.score),
            title: const Text('Résultat'),
            onTap: (() => print('object')),
          ),
          ListTile(
            leading: const Icon(Icons.access_alarms),
            title: const Text('Emploi'),
            onTap: (() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: ((context) =>  AbsencePage())))),
          ),
          ListTile(
            leading: const Icon(Icons.add_moderator_rounded),
            title: const Text('Reclamation'),
            onTap: (() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: ((context) => const reclamationPage())))),
          ),
        ],
      ),
    );
  }
}
