import 'dart:convert';
import 'dart:typed_data';

import 'package:copihass/models/emploi.dart';
import 'package:copihass/ui/emploi/bloc/emploi_bloc.dart';
import 'package:copihass/ui/emploi/pages/affichage_emploi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmploiPage extends StatefulWidget {
  final SharedPreferences prefs;
  const EmploiPage({required this.prefs, super.key});

  @override
  State<EmploiPage> createState() => _EmploiPageState();
}

class _EmploiPageState extends State<EmploiPage> {
  String? _localFile;
  List<Emploi> listeemploi = [];
  @override
  void initState() {
    super.initState();
    context.read<EmploiBloc>().add(GetEmploi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmploiBloc, EmploiState>(
      listener: (context, state) {
        if (state is EmploiLoaded) {
          listeemploi = state.emploi;
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
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
            child: state is EmploiInitial || state is EmploiLoading
                ? EmploiListLoader()
                : ListView.builder(
                    itemCount: listeemploi.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(" ${listeemploi[index].name}"),
                              SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Uint8List base64 = base64Decode(
                                        listeemploi[index].emploi!);
                                    print(base64);
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return Affichage(
                                        emploi: listeemploi[index],base64: base64,
                                      );
                                    }));
                                    convert(listeemploi[index].emploi!,);
                                  },
                                  child: Text("aperçu")),
                              ElevatedButton(
                                  onPressed: () {}, child: Icon(Icons.download))
                            ]),
                      );
                    },
                  ),
          ),
        ));
      },
    );
  }
}

class EmploiListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}

void convert(String emploi) {
  Uint8List base64 = base64Decode(emploi);
  print(base64);
}
