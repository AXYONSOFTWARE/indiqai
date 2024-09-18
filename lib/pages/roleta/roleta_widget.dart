import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/insuficient_points_modal/insuficient_points_modal_widget.dart';
import '/modals/points_modal/points_modal_widget.dart';
import '/modals/prize/prize_widget.dart';
import '/modals/products_list/products_list_widget.dart';
import '/modals/reward_modal/reward_modal_widget.dart';
import '/modals/timer_modal/timer_modal_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'roleta_model.dart';
export 'roleta_model.dart';

class RoletaWidget extends StatefulWidget {
  const RoletaWidget({
    super.key,
    int? id,
  }) : id = id ?? 3;

  final int id;

  @override
  State<RoletaWidget> createState() => _RoletaWidgetState();
}

class _RoletaWidgetState extends State<RoletaWidget>
    with TickerProviderStateMixin {
  late RoletaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasCircleImageTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoletaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.id == 3) {
        context.pushNamed('home');

        return;
      } else {
        FFAppState().sessionId = functions.gerarCodigoUnico(6, 4, '-');
        safeSetState(() {});
        while (!FFAppState().IsProductContainsInRow &&
            (FFAppState().attempts < 4)) {
          FFAppState().rotationNumber =
              functions.generateFinalTurnsBasedOnProbability(
                  4.0, 24.0, 9.0, 7.0, 10.0, 4.0, 40.0, 2.0)!;
          safeSetState(() {});
          FFAppState().spinningId =
              functions.returnIdSpinning(FFAppState().rotationNumber);
          safeSetState(() {});
          if (FFAppState().spinningId <= 4) {
            // Busca premio no estoque
            _model.queryroleta = await ProductsTable().queryRows(
              queryFn: (q) => q
                  .eq(
                    'client_id',
                    widget.id,
                  )
                  .eq(
                    'id_number',
                    FFAppState().spinningId,
                  ),
            );
            if (_model.queryroleta!.first.quantity! > 0) {
              // Retira do estoque
              await ProductsTable().update(
                data: {
                  'quantity': (_model.queryroleta!.first.quantity!) - 1,
                },
                matchingRows: (rows) => rows
                    .eq(
                      'id_number',
                      FFAppState().spinningId,
                    )
                    .eq(
                      'client_id',
                      widget.id,
                    ),
              );
              _model.queryEmpresa = await EmpresasTable().queryRows(
                queryFn: (q) => q.eq(
                  'qrcode_id',
                  widget.id,
                ),
              );
              _model.queryUser = await UsuariosTable().queryRows(
                queryFn: (q) => q.eq(
                  'id',
                  currentUserUid,
                ),
              );
              // Cria o premio com base no spinningId que deve retornar um numero entre 1 e 4
              // Criar prêmio na tabela Rewards
              await RewardsTable().insert({
                'name': _model.queryroleta?.first.name,
                'description': _model.queryroleta?.first.name,
                'imageURL': _model.queryroleta?.first.imageURL,
                'price': _model.queryroleta?.first.price,
                'cupon_code': functions.gerarCodigoUnico(4, 3, '-'),
                'expire_date': supaSerialize<DateTime>(
                    functions.returnExpireDate(getCurrentTimestamp, 2)),
                'user_id': currentUserUid,
                'is_active': false,
                'session_id': FFAppState().sessionId,
                'blur_hash': _model.queryroleta?.first.blurHash,
                'product_uid': _model.queryroleta?.first.id,
                'regras_uso_cupom': _model.queryroleta?.first.regrasUsoCupom,
                'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
                'nome_empresa': _model.queryEmpresa?.first.name,
                'qrcode_id': widget.id,
                'cupomUsado': false,
              });
              await UsuariosTable().update(
                data: {
                  'rewards_received':
                      (_model.queryUser!.first.rewardsReceived!) + 1,
                },
                matchingRows: (rows) => rows.eq(
                  'id',
                  currentUserUid,
                ),
              );
              await EmpresasTable().update(
                data: {
                  'id': '',
                },
                matchingRows: (rows) => rows.eq(
                  'qrcode_id',
                  widget.id,
                ),
              );
              FFAppState().IsProductContainsInRow = true;
              safeSetState(() {});
              break;
            } else {
              // Adiciona um attempt ao app state, e resortear o número
              FFAppState().attempts = FFAppState().attempts + 1;
              safeSetState(() {});
            }
          } else {
            await RewardsTable().insert({
              'name': '${FFAppState().spinningId.toString()} pontos',
              'cupon_code': functions.gerarCodigoUnico(4, 3, '-'),
              'session_id': FFAppState().sessionId,
              'user_id': currentUserUid,
              'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
              'points': FFAppState().spinningId,
            });
            FFAppState().IsProductContainsInRow = true;
            safeSetState(() {});
            break;
          }
        }
        return;
      }
    });

    animationsMap.addAll({
      'circleImageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: null,
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 10.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).roxoEscuro,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/ROleta.png',
                  ).image,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: FutureBuilder<List<EmpresasRow>>(
                future: EmpresasTable().querySingleRow(
                  queryFn: (q) => q.eq(
                    'qrcode_id',
                    widget.id,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitSquareCircle(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<EmpresasRow> colunPricipalEmpresasRowList =
                      snapshot.data!;

                  final colunPricipalEmpresasRow =
                      colunPricipalEmpresasRowList.isNotEmpty
                          ? colunPricipalEmpresasRowList.first
                          : null;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.home_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 26.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('home');
                                  },
                                ),
                              ),
                            ].divide(const SizedBox(width: 24.0)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/LOGO_INDIQAI2-branco.png',
                                      width: 100.0,
                                      height: 50.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 24.0)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Você está concorrendo aos prêmios do:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: FutureBuilder<List<EmpresasRow>>(
                                future: EmpresasTable().querySingleRow(
                                  queryFn: (q) => q.eq(
                                    'qrcode_id',
                                    widget.id,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitSquareCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<EmpresasRow>
                                      containerRoxoEmpresasRowList =
                                      snapshot.data!;

                                  final containerRoxoEmpresasRow =
                                      containerRoxoEmpresasRowList.isNotEmpty
                                          ? containerRoxoEmpresasRowList.first
                                          : null;

                                  return Container(
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .roxoEscuro,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 10.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            4.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Icon(
                                              Icons.location_pin,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              containerRoxoEmpresasRow?.name,
                                              'Restaurante',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey(
                                                              'Nunito'),
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ].divide(const SizedBox(height: 6.0)),
                        ),
                      ),
                      Flexible(
                        child: FutureBuilder<List<InteracoesRow>>(
                          future: InteracoesTable().querySingleRow(
                            queryFn: (q) => q
                                .eq(
                                  'client_id',
                                  currentUserUid,
                                )
                                .eq(
                                  'empresa_id',
                                  widget.id,
                                ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitSquareCircle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<InteracoesRow> containerInteracoesRowList =
                                snapshot.data!;

                            final containerInteracoesRow =
                                containerInteracoesRowList.isNotEmpty
                                    ? containerInteracoesRowList.first
                                    : null;

                            return Container(
                              decoration: const BoxDecoration(),
                              child: FutureBuilder<List<UsuariosRow>>(
                                future: UsuariosTable().querySingleRow(
                                  queryFn: (q) => q.eq(
                                    'id',
                                    currentUserUid,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitSquareCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsuariosRow>
                                      stackRoletaTesteUsuariosRowList =
                                      snapshot.data!;

                                  final stackRoletaTesteUsuariosRow =
                                      stackRoletaTesteUsuariosRowList.isNotEmpty
                                          ? stackRoletaTesteUsuariosRowList
                                              .first
                                          : null;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (colunPricipalEmpresasRow!.isOpen!) {
                                        if (stackRoletaTesteUsuariosRow!
                                                .points! >=
                                            250) {
                                          // Retirar 250 pontos
                                          await UsuariosTable().update(
                                            data: {
                                              'points':
                                                  (stackRoletaTesteUsuariosRow
                                                          .points!) -
                                                      250,
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              currentUserUid,
                                            ),
                                          );
                                          if (animationsMap[
                                                  'circleImageOnActionTriggerAnimation'] !=
                                              null) {
                                            safeSetState(() =>
                                                hasCircleImageTriggered = true);
                                            SchedulerBinding.instance
                                                .addPostFrameCallback((_) async =>
                                                    await animationsMap[
                                                            'circleImageOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0));
                                          }
                                          await Future.delayed(const Duration(
                                              milliseconds: 4000));
                                          if (animationsMap[
                                                  'circleImageOnActionTriggerAnimation'] !=
                                              null) {
                                            animationsMap[
                                                    'circleImageOnActionTriggerAnimation']!
                                                .controller
                                                .stop();
                                          }
                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SizedBox(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    child: const PrizeWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          await Future.delayed(const Duration(
                                              milliseconds: 1500));
                                          await Future.wait([
                                            Future(() async {
                                              if (FFAppState().spinningId > 4) {
                                                FFAppState().hasCuppon = true;
                                                safeSetState(() {});
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            PointsModalWidget(
                                                          id: valueOrDefault<
                                                              int>(
                                                            widget.id,
                                                            1,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                return;
                                              } else {
                                                FFAppState().hasCuppon = true;
                                                safeSetState(() {});
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            RewardModalWidget(
                                                          id: valueOrDefault<
                                                              int>(
                                                            widget.id,
                                                            1,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                return;
                                              }
                                            }),
                                            Future(() async {
                                              if (containerInteracoesRow
                                                          ?.clientId !=
                                                      null &&
                                                  containerInteracoesRow
                                                          ?.clientId !=
                                                      '') {
                                                await InteracoesTable().update(
                                                  data: {
                                                    'interaction_count':
                                                        (containerInteracoesRow!
                                                                .interactionCount!) +
                                                            1,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    containerInteracoesRow.id,
                                                  ),
                                                );
                                              } else {
                                                await InteracoesTable().insert({
                                                  'client_id': currentUserUid,
                                                  'empresa_id': widget.id,
                                                  'interaction_count': 1,
                                                });
                                              }
                                            }),
                                          ]);
                                        } else {
                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      const InsuficientPointsModalWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          return;
                                        }
                                      } else {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: TimerModalWidget(
                                                  id: widget.id,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        return;
                                      }
                                    },
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.347,
                                                      constraints:
                                                          BoxConstraints(
                                                        minHeight:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.95,
                                                        maxWidth:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.95,
                                                      ),
                                                      decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: SizedBox(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.5,
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/ROELTA_FULL.png',
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    alignment:
                                                                        const Alignment(
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                ).animateOnActionTrigger(
                                                                  animationsMap[
                                                                      'circleImageOnActionTriggerAnimation']!,
                                                                  hasBeenTriggered:
                                                                      hasCircleImageTriggered,
                                                                  effects: [
                                                                    RotateEffect(
                                                                      curve: Curves
                                                                          .easeOut,
                                                                      delay: 0.0
                                                                          .ms,
                                                                      duration:
                                                                          4000.0
                                                                              .ms,
                                                                      begin:
                                                                          0.0,
                                                                      end: valueOrDefault<
                                                                          double>(
                                                                        FFAppState()
                                                                            .rotationNumber,
                                                                        5.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        -0.07),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/Paleta_(1).png',
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.12,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    alignment:
                                                                        const Alignment(
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.02),
                                                                child:
                                                                    Container(
                                                                  width: 48.0,
                                                                  height: 45.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: FutureBuilder<
                                                                        List<
                                                                            UsuariosRow>>(
                                                                      future: UsuariosTable()
                                                                          .querySingleRow(
                                                                        queryFn:
                                                                            (q) =>
                                                                                q.eq(
                                                                          'id',
                                                                          currentUserUid,
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitSquareCircle(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<UsuariosRow>
                                                                            richTextUsuariosRowList =
                                                                            snapshot.data!;

                                                                        final richTextUsuariosRow = richTextUsuariosRowList.isNotEmpty
                                                                            ? richTextUsuariosRowList.first
                                                                            : null;

                                                                        return RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: functions.chancesRestantes(richTextUsuariosRow!.points!).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w800,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                              const TextSpan(
                                                                                text: '\nchances',
                                                                                style: TextStyle(),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: ProductsListWidget(
                                    id: widget.id,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: 'Ver prêmios disponíveis',
                        icon: const Icon(
                          Icons.format_list_numbered,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).roxoEscuro,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondary,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
