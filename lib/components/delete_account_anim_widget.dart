import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delete_account_anim_model.dart';
export 'delete_account_anim_model.dart';

class DeleteAccountAnimWidget extends StatefulWidget {
  const DeleteAccountAnimWidget({super.key});

  @override
  State<DeleteAccountAnimWidget> createState() =>
      _DeleteAccountAnimWidgetState();
}

class _DeleteAccountAnimWidgetState extends State<DeleteAccountAnimWidget> {
  late DeleteAccountAnimModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAccountAnimModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      await authManager.deleteUser(context);
      GoRouter.of(context).prepareAuthEvent();
      await authManager.signOut();
      GoRouter.of(context).clearRedirectLocation();

      context.goNamedAuth(StartpageWidget.routeName, context.mounted);
    });

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(44.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              'Удаление аккаунта',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).displayMedium.override(
                    font: GoogleFonts.geologica(
                      fontWeight:
                          FlutterFlowTheme.of(context).displayMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).displayMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).displayMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).displayMedium.fontStyle,
                  ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
