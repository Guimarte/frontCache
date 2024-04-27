import 'package:frontend_cidade/models/cidades_model.dart';
import 'package:frontend_cidade/models/estados_model.dart';
import 'package:frontend_cidade/requester/requester.dart';
import 'package:get/get.dart';

class ControllerRequisicao extends GetxController {
  RxList<EstadosModel> estadosList = <EstadosModel>[].obs;
  RxList<CidadesModel> cidadesList = <CidadesModel>[].obs;
  Rx<EstadosModel> estadoSelected = EstadosModel().obs;
  Rx<CidadesModel>cidadeSelected = CidadesModel().obs;
  RxString dropEstado = "".obs;
  RxString dropCidade = "".obs;


  @override
  Future<void> onInit() async {
    await buscaEstados();
    await buscaCidades(estadosList.value[0].sigla!);
    super.onInit();
  }

  Future buscaEstados() async {
    estadosList.value = await Requesters().getEstados();
    estadoSelected.value = estadosList.first;
    dropEstado.value = estadoSelected.value.sigla!;
  }

  Future buscaCidades(String estado) async {
    cidadesList.value = await Requesters().getCidades(estado);
    cidadeSelected.value = cidadesList.first;
    dropCidade.value = cidadeSelected.value.nome!;
  }
}
