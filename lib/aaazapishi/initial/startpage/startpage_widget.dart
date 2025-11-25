import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'startpage_model.dart';
export 'startpage_model.dart';

class StartpageWidget extends StatefulWidget {
  const StartpageWidget({super.key});

  static String routeName = 'startpage';
  static String routePath = '/startpage';

  @override
  State<StartpageWidget> createState() => _StartpageWidgetState();
}

class _StartpageWidgetState extends State<StartpageWidget> {
  late StartpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      if (FFAppState().firstTime) {
        context.goNamed(OnboardingWidget.routeName);
      } else {
        if (loggedIn) {
          if (currentUserDocument?.essence == UserStatus.admin) {
            context.goNamed(AdminMainProfileWidget.routeName);
          } else {
            context.goNamed(MainWidget.routeName);
          }
        } else {
          context.goNamed(EnterPhoneWidget.routeName);
        }
      }
    });

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Frame_1851040970.png',
                      width: 190.0,
                      height: 190.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  'ZAPISHI',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        font: GoogleFonts.geologica(
                          fontWeight: FlutterFlowTheme.of(context)
                              .displayLarge
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .displayLarge
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .displayLarge
                            .fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).displayLarge.fontStyle,
                      ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
