import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_menu_model.dart';
export 'admin_menu_model.dart';

class AdminMenuWidget extends StatefulWidget {
  const AdminMenuWidget({
    super.key,
    this.currentAdminPage,
  });

  final AdminMenu? currentAdminPage;

  @override
  State<AdminMenuWidget> createState() => _AdminMenuWidgetState();
}

class _AdminMenuWidgetState extends State<AdminMenuWidget> {
  late AdminMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminMenuModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Logo_(3).png',
                  width: 96.0,
                  height: 96.0,
                  fit: BoxFit.cover,
                  alignment: Alignment(-1.0, 0.0),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                'ZAPISHI',
                style: FlutterFlowTheme.of(context).displayMedium.override(
                      font: GoogleFonts.geologica(
                        fontWeight: FlutterFlowTheme.of(context)
                            .displayMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .displayMedium
                            .fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).displayMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).displayMedium.fontStyle,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: Text(
                'УПРАВЛЕНИЕ',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: (widget.currentAdminPage == AdminMenu.profile)
                    ? null
                    : () async {
                        context.pushNamed(AdminMainProfileWidget.routeName);
                      },
                text: 'Профиль',
                icon: Icon(
                  FFIcons.kprofile2,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  height: 46.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                      ),
                  elevation: 0.0,
                  disabledTextColor: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: (widget.currentAdminPage == AdminMenu.orders)
                    ? null
                    : () async {
                        context.pushNamed(AdminOrdersWidget.routeName);
                      },
                text: 'Объявления',
                icon: Icon(
                  FFIcons.kpaperUpload,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  height: 46.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                      ),
                  elevation: 0.0,
                  disabledTextColor: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: (widget.currentAdminPage == AdminMenu.money)
                    ? null
                    : () async {
                        context.pushNamed(AdminMoneyWidget.routeName);
                      },
                text: 'Монитизация',
                icon: FaIcon(
                  FontAwesomeIcons.wallet,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  height: 46.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                      ),
                  elevation: 0.0,
                  disabledTextColor: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: Text(
                'КОНТЕНТ',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: (widget.currentAdminPage == AdminMenu.category)
                    ? null
                    : () async {
                        context.pushNamed(AdminCategoryWidget.routeName);
                      },
                text: 'Категории',
                icon: FaIcon(
                  FontAwesomeIcons.borderAll,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  height: 46.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                      ),
                  elevation: 0.0,
                  disabledTextColor: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: Text(
                'ПОДДЕРЖКА',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: (widget.currentAdminPage == AdminMenu.chats)
                    ? null
                    : () async {
                        context.pushNamed(AdminCChatsWidget.routeName);
                      },
                text: 'Чаты',
                icon: Icon(
                  FFIcons.kchat,
                  size: 24.0,
                ),
                options: FFButtonOptions(
                  height: 46.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                      ),
                  elevation: 0.0,
                  disabledTextColor: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
