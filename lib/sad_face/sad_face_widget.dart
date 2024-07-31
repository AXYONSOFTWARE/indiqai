import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'sad_face_model.dart';
export 'sad_face_model.dart';

class SadFaceWidget extends StatefulWidget {
  const SadFaceWidget({super.key});

  @override
  State<SadFaceWidget> createState() => _SadFaceWidgetState();
}

class _SadFaceWidgetState extends State<SadFaceWidget> {
  late SadFaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SadFaceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Lottie.asset(
            'assets/lottie_animations/Animation_-_1721168513513.json',
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            fit: BoxFit.contain,
            animate: true,
          ),
        ),
      ),
    );
  }
}
