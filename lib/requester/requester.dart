import 'dart:convert';

import 'package:frontend_cidade/models/cidades_model.dart';
import 'package:frontend_cidade/models/estados_model.dart';
import 'package:http/http.dart' as http;

class Requesters {
  String baseUrl = "http://localhost:8080";

  Future<List<EstadosModel>> getEstados() async {
    http.Response response =
        await http.get(Uri.parse("${baseUrl}/buscar-estados"));

    List<EstadosModel> estadosModel =
        EstadosModel.listFromJson(jsonDecode(response.body));
    return estadosModel;
  }

  Future<List<CidadesModel>> getCidades(String estado) async {
    http.Response response =
        await http.get(Uri.parse("${baseUrl}/buscar-cidades/$estado"));

    List<CidadesModel> cidadesModel =
        CidadesModel.listFromJson(jsonDecode(response.body));
    return cidadesModel;
  }
}
