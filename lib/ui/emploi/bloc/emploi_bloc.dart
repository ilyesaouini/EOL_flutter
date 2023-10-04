import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:copihass/config.dart';
import 'package:copihass/models/emploi.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

part 'emploi_event.dart';
part 'emploi_state.dart';

class EmploiBloc extends Bloc<EmploiEvent, EmploiState> {
  EmploiBloc() : super(EmploiInitial()) {
    on<AddEmploi>((event, emit) async {
      // var url = addpdf;
      // var map = new Map<String, dynamic>();
      // map['file'] = event.file;

      uploadFile(path: event.file.path);

      // var response = await http.post(Uri.parse(url), body: map);
    });
    on<GetEmploi>(
      (event, emit) async {
        var url = lastemploi;
        var response = await http.get(Uri.parse(url));
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        List<Emploi> listlastemploi = [];
        if (response.statusCode == 200) {
          if (jsonResponse != null) {
            jsonResponse.forEach((jsonElement) {
              var emploi = Emploi.fromJson(jsonElement);
              emploi.fileBuffer = Base64Codec().decode(emploi.emploi!.split(",").last);
             
              //pathProvider
              // var file = File('getApplocationDirectory()/fileName');
              // file.writeAsBytesSync(emploi.fileBuffer!);
              //showToast(done)

              listlastemploi.add(emploi);
              print("success load");
            });
            emit(EmploiLoaded(listlastemploi));
          } else {
            print("Something error");
            emit(EmploiError("error"));
          }
        }
      },
    );
  }

  Future<dynamic> uploadFile(
      {File? file, String? path, bool? isFundDocument}) async {
    dynamic uploadedDocument;
    late FormData formData;

    formData = new FormData.fromMap({
      'file': MultipartFile.fromFileSync(
        path!,
        filename: path.split("/").last,
      )
    });

    Dio dio = Dio();

    dio.options.baseUrl = url;
    dio.options.headers['Accept'] = 'application/json, text/plain, */*';
    dio.options.contentType = "multipart/form-data";
    dio.options.followRedirects = false;
    dio.options.method = "POST";

    Response? response;
    response = await dio.post(addpdf, data: formData);

    if (response != null &&
        response.statusCode == 200 &&
        response.data != null) {}
    return uploadedDocument;
  }
}
