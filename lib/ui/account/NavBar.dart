import 'package:copihass/ui/absence/absence_page.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:copihass/ui/account/bloc/account_bloc.dart';
import 'package:copihass/ui/note/bloc/note_bloc.dart';

import 'package:copihass/ui/note/note.dart';
import 'package:copihass/ui/reclamation/bloc/reclamation_bloc.dart';
import 'package:copihass/ui/reclamation/reclamation.dart';
import 'package:copihass/ui/resultat/bloc/resultat_bloc.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  final int selectedItemPosition;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerWidget(
      {super.key,
      required this.scaffoldKey,
      required this.selectedItemPosition});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              _onItemSelected(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.note),
            title: const Text('Notes'),
            onTap: () {
              _onItemSelected(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Absences'),
            onTap: () {
              _onItemSelected(2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.score),
            title: const Text('Résultat'),
            onTap: () {
              _onItemSelected(3);
            },
          ),
          ListTile(
            leading: const Icon(Icons.access_alarms),
            title: const Text('Emploi'),
            onTap: () {
              _onItemSelected(4);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_moderator_rounded),
            title: const Text('Reclamation'),
            onTap: () {
              _onItemSelected(5);
            },
          ),
        ],
      ),
    );
  }

  _onItemSelected(int index) {
    if (widget.selectedItemPosition != index) {
      widget.selectedItemPosition == index;
      context
          .read<AccountBloc>()
          .add(OnDrawerIemSelectedEvent(selectedPosition: index));

      _onDrawerItemSelected(index);
    }
    widget.scaffoldKey.currentState!.closeDrawer();
  }

  _onDrawerItemSelected(int index) {
    switch (index) {
      case 1:
        context.read<NoteBloc>().add(GetNoteList());
        break;
      case 2:
        context.read<AbsenceBloc>().add(GetAbsenceList());
        break;
      case 3:
        context.read<ResultatBloc>().add(GetResultatList());
        break;
      case 5:
        context.read<ReclamationBloc>().add(GetReclamationList());
        break;
    }
  }
}
