import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'returndada_model.dart';
export 'returndada_model.dart';

class ReturndadaWidget extends StatefulWidget {
  const ReturndadaWidget({super.key});

  @override
  State<ReturndadaWidget> createState() => _ReturndadaWidgetState();
}

class _ReturndadaWidgetState extends State<ReturndadaWidget> {
  late ReturndadaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReturndadaModel());

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
