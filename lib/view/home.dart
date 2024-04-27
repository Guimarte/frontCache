import 'package:flutter/material.dart';
import 'package:frontend_cidade/controller/controller.dart';
import 'package:frontend_cidade/models/cidades_model.dart';
import 'package:frontend_cidade/models/estados_model.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ControllerRequisicao controllerRequisicao = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controllerRequisicao.estadosList.isEmpty &&
          controllerRequisicao.cidadesList.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: Text(
              "Estados e Cidades ",
            ),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.grey,
            width: MediaQuery.sizeOf(context).width * 1,
            height: MediaQuery.sizeOf(context).height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: DropdownButton<String>(
                    value: controllerRequisicao.dropEstado.value,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      controllerRequisicao.dropEstado.value = newValue!;
                      controllerRequisicao.buscaCidades(newValue);
                    },
                    items: controllerRequisicao.estadosList.value
                        .map<DropdownMenuItem<String>>((EstadosModel value) {
                      return DropdownMenuItem<String>(
                        value: value.sigla,
                        child: Text(value.sigla!),
                      );
                    }).toList(),
                  ),
                ),
                Center(
                  child: DropdownButton<String>(
                    value: controllerRequisicao.dropCidade.value,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      controllerRequisicao.dropCidade.value = newValue!;
                    },
                    items: controllerRequisicao.cidadesList.value
                        .map<DropdownMenuItem<String>>((CidadesModel value) {
                      return DropdownMenuItem<String>(
                        value: value.nome,
                        child: Text(value.nome!),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
