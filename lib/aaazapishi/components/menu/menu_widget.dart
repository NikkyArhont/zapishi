import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'menu_model.dart';
export 'menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    super.key,
    this.currentPage,
  });

  final CurrentPage? currentPage;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late MenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuModel());

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
      width: MediaQuery.sizeOf(context).width * 4.0,
      height: 90.0,
      constraints: BoxConstraints(
        maxWidth: 400.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                disabledIconColor: FlutterFlowTheme.of(context).primary,
                icon: FaIcon(
                  FontAwesomeIcons.home,
                  color: Color(0xFF9E9E9E),
                  size: 24.0,
                ),
                onPressed: (widget.currentPage == CurrentPage.main)
                    ? null
                    : () async {
                        context.pushNamed(MainWidget.routeName);
                      },
              ),
              Text(
                'Главная',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: widget.currentPage == CurrentPage.main
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0xFF9E9E9E),
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                disabledIconColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.calendar_month,
                  color: Color(0xFF9E9E9E),
                  size: 24.0,
                ),
                onPressed: (widget.currentPage == CurrentPage.records)
                    ? null
                    : () async {
                        context.pushNamed(MyRecordsWidget.routeName);
                      },
              ),
              Text(
                'Записи',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: widget.currentPage == CurrentPage.records
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0xFF9E9E9E),
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ],
          ),
          if (currentUserDocument?.essence != UserStatus.user)
            AuthUserStreamWidget(
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    disabledIconColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      FFIcons.kwork,
                      color: Color(0xFF9E9E9E),
                      size: 24.0,
                    ),
                    onPressed: (widget.currentPage == CurrentPage.work)
                        ? null
                        : () async {
                            context.pushNamed(CabinetWidget.routeName);
                          },
                  ),
                  Text(
                    'Работа',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: widget.currentPage == CurrentPage.work
                              ? FlutterFlowTheme.of(context).primary
                              : Color(0xFF9E9E9E),
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ],
              ),
            ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                disabledIconColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  FFIcons.kchat,
                  color: Color(0xFF9E9E9E),
                  size: 24.0,
                ),
                onPressed: (widget.currentPage == CurrentPage.chats)
                    ? null
                    : () async {
                        context.pushNamed(MyChatsWidget.routeName);
                      },
              ),
              Text(
                'Чаты',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: widget.currentPage == CurrentPage.chats
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0xFF9E9E9E),
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                disabledIconColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.person_outline,
                  color: Color(0xFF9E9E9E),
                  size: 24.0,
                ),
                onPressed: (widget.currentPage == CurrentPage.profile)
                    ? null
                    : () async {
                        context.pushNamed(MyProfileWidget.routeName);
                      },
              ),
              Text(
                'Профиль',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: widget.currentPage == CurrentPage.profile
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0xFF9E9E9E),
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
