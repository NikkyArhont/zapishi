import '/aaazapishi/admin/admin_profile/admin_logout/admin_logout_widget.dart';
import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_top_model.dart';
export 'admin_top_model.dart';

class AdminTopWidget extends StatefulWidget {
  const AdminTopWidget({
    super.key,
    required this.title,
    required this.main,
  });

  final String? title;
  final bool? main;

  @override
  State<AdminTopWidget> createState() => _AdminTopWidgetState();
}

class _AdminTopWidgetState extends State<AdminTopWidget> {
  late AdminTopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminTopModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!widget.main!)
            wrapWithModel(
              model: _model.backbuttonModel,
              updateCallback: () => safeSetState(() {}),
              child: BackbuttonWidget(),
            ),
          Text(
            valueOrDefault<String>(
              widget.title,
              'errorTitlte',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).displayLarge.override(
                  font: GoogleFonts.geologica(
                    fontWeight:
                        FlutterFlowTheme.of(context).displayLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).displayLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).displayLarge.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).displayLarge.fontStyle,
                ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (currentUserPhoto != '')
                  AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 40.0,
                      height: 40.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        currentUserPhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                    Text(
                      currentUserEmail,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: AdminLogoutWidget(),
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.logout,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
          ),
        ].divide(SizedBox(width: 12.0)),
      ),
    );
  }
}
