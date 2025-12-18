import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'log_out_model.dart';
export 'log_out_model.dart';

class LogOutWidget extends StatefulWidget {
  const LogOutWidget({super.key});

  @override
  State<LogOutWidget> createState() => _LogOutWidgetState();
}

class _LogOutWidgetState extends State<LogOutWidget> {
  late LogOutModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogOutModel());

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
      constraints: BoxConstraints(
        maxWidth: 500.0,
        maxHeight: 400.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(44.0),
          topRight: Radius.circular(44.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Выйти из аккаунта',
              style: FlutterFlowTheme.of(context).displayMedium.override(
                    font: GoogleFonts.geologica(
                      fontWeight:
                          FlutterFlowTheme.of(context).displayMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).displayMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).error,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).displayMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).displayMedium.fontStyle,
                  ),
            ),
            Text(
              'Вы уверены, что хотите выйти?',
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
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Отмена',
                      options: FFButtonOptions(
                        width: 360.0,
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .labelLarge
                            .override(
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
                  ),
                  Flexible(
                    child: FFButtonWidget(
                      onPressed: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.goNamedAuth(
                            StartpageWidget.routeName, context.mounted);
                      },
                      text: 'Да, выйти',
                      options: FFButtonOptions(
                        width: 360.0,
                        height: 48.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).labelLarge.override(
                                  fontFamily: 'involve',
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 24.0)),
              ),
            ),
          ].divide(SizedBox(height: 32.0)),
        ),
      ),
    );
  }
}
