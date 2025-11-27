import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modal_wind_debate_open_model.dart';
export 'modal_wind_debate_open_model.dart';

class ModalWindDebateOpenWidget extends StatefulWidget {
  const ModalWindDebateOpenWidget({
    super.key,
    required this.rec,
    required this.master,
    required this.serv,
  });

  final RecordsRecord? rec;
  final MastersRecord? master;
  final ServicesRecord? serv;

  @override
  State<ModalWindDebateOpenWidget> createState() =>
      _ModalWindDebateOpenWidgetState();
}

class _ModalWindDebateOpenWidgetState extends State<ModalWindDebateOpenWidget> {
  late ModalWindDebateOpenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalWindDebateOpenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.0,
      height: 577.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(44.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Group_(3).png',
                width: 180.0,
                height: 180.0,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Открыть спор?',
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    font: GoogleFonts.geologica(
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                  ),
            ),
            Text(
              'Если у вас возникли проблемы с клиентом, вы можете обратиться к нам за помощью',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);

                context.goNamed(
                  CreateDebateWidget.routeName,
                  queryParameters: {
                    'recordDOc': serializeParam(
                      widget.rec,
                      ParamType.Document,
                    ),
                    'servDoc': serializeParam(
                      widget.serv,
                      ParamType.Document,
                    ),
                    'masrterDoc': serializeParam(
                      widget.master,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'recordDOc': widget.rec,
                    'servDoc': widget.serv,
                    'masrterDoc': widget.master,
                  },
                );
              },
              text: 'Открыть спор',
              options: FFButtonOptions(
                width: 360.0,
                height: 48.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'involve',
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Отменить',
              options: FFButtonOptions(
                width: 360.0,
                height: 48.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'involve',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
