import 'dart:convert';
import 'dart:typed_data';

import 'package:copihass/models/emploi.dart';
import 'package:copihass/ui/emploi/bloc/emploi_bloc.dart';
import 'package:copihass/ui/emploi/pages/pdf_viewer_page.dart';
import 'package:copihass/utils/utils.dart';
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
  List<Emploi> listeemploi = [];
  @override
  void initState() {
    context.read<EmploiBloc>().add(GetEmploi());
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
                : RefreshIndicator(
                    onRefresh: () async {
                      context.read<EmploiBloc>().add(GetEmploi());
                    },
                    child: ListView.builder(
                      itemCount: listeemploi.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 17, 17, 17),
                                  width: 0.5)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 20,
                                ),
                                Text(" ${listeemploi[index].name}"),
                                SizedBox(
                                  width: 50,
                                ),
                                TextButton(
                                    onPressed: () {
                                      if (listeemploi[index].fileBuffer !=
                                          null) {
                                        Utils.openPageWithRightSlide(
                                            PdfViewerWidget(
                                                fileBuffer: listeemploi[index]
                                                    .fileBuffer!),
                                            context);
                                      }
                                    },
                                    child: Icon(Icons.remove_red_eye_outlined)),
                              ]),
                        );
                      },
                    ),
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
