import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pesquisa_modal_widget.dart' show PesquisaModalWidget;
import 'package:flutter/material.dart';

class PesquisaModalModel extends FlutterFlowModel<PesquisaModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for idade widget.
  String? idadeValue;
  FormFieldController<String>? idadeValueController;
  // State field(s) for profissao widget.
  String? profissaoValue;
  FormFieldController<String>? profissaoValueController;
  // State field(s) for abordagem widget.
  String? abordagemValue;
  FormFieldController<String>? abordagemValueController;
  // State field(s) for precadastro widget.
  String? precadastroValue;
  FormFieldController<String>? precadastroValueController;
  // State field(s) for qrcode widget.
  String? qrcodeValue;
  FormFieldController<String>? qrcodeValueController;
  // State field(s) for navegar widget.
  String? navegarValue;
  FormFieldController<String>? navegarValueController;
  // State field(s) for resgatar widget.
  String? resgatarValue;
  FormFieldController<String>? resgatarValueController;
  // State field(s) for pontos-positivos widget.
  FocusNode? pontosPositivosFocusNode;
  TextEditingController? pontosPositivosTextController;
  String? Function(BuildContext, String?)?
      pontosPositivosTextControllerValidator;
  // State field(s) for pontos-a-melhorar widget.
  FocusNode? pontosAMelhorarFocusNode;
  TextEditingController? pontosAMelhorarTextController;
  String? Function(BuildContext, String?)?
      pontosAMelhorarTextControllerValidator;
  // State field(s) for melhorar-resgate widget.
  FocusNode? melhorarResgateFocusNode;
  TextEditingController? melhorarResgateTextController;
  String? Function(BuildContext, String?)?
      melhorarResgateTextControllerValidator;
  // State field(s) for premios_ofertados widget.
  String? premiosOfertadosValue;
  FormFieldController<String>? premiosOfertadosValueController;
  // State field(s) for premio-expectativa widget.
  String? premioExpectativaValue;
  FormFieldController<String>? premioExpectativaValueController;
  // State field(s) for recomenda-indiqai widget.
  String? recomendaIndiqaiValue;
  FormFieldController<String>? recomendaIndiqaiValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cityFocusNode?.dispose();
    cityTextController?.dispose();

    pontosPositivosFocusNode?.dispose();
    pontosPositivosTextController?.dispose();

    pontosAMelhorarFocusNode?.dispose();
    pontosAMelhorarTextController?.dispose();

    melhorarResgateFocusNode?.dispose();
    melhorarResgateTextController?.dispose();
  }
}
