import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'botao_retorno_universal_model.dart';
export 'botao_retorno_universal_model.dart';

class BotaoRetornoUniversalWidget extends StatefulWidget {
  const BotaoRetornoUniversalWidget({super.key});

  @override
  State<BotaoRetornoUniversalWidget> createState() =>
      _BotaoRetornoUniversalWidgetState();
}

class _BotaoRetornoUniversalWidgetState
    extends State<BotaoRetornoUniversalWidget> {
  late BotaoRetornoUniversalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BotaoRetornoUniversalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 30.0,
      borderWidth: 1.0,
      buttonSize: 60.0,
      icon: Icon(
        Icons.arrow_back_rounded,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 30.0,
      ),
      onPressed: () async {
        context.safePop();
      },
    );
  }
}
