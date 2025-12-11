import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cabenet_master_delete_p_r_o_f_i_l_e_model.dart';
export 'cabenet_master_delete_p_r_o_f_i_l_e_model.dart';

class CabenetMasterDeletePROFILEWidget extends StatefulWidget {
  const CabenetMasterDeletePROFILEWidget({
    super.key,
    required this.organisation,
  });

  final MastersRecord? organisation;

  @override
  State<CabenetMasterDeletePROFILEWidget> createState() =>
      _CabenetMasterDeletePROFILEWidgetState();
}

class _CabenetMasterDeletePROFILEWidgetState
    extends State<CabenetMasterDeletePROFILEWidget> {
  late CabenetMasterDeletePROFILEModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CabenetMasterDeletePROFILEModel());

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
      height: 540.0,
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
                'assets/images/Group_(4).png',
                width: 180.0,
                height: 180.0,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Удалить профиль?',
              textAlign: TextAlign.center,
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
              'Этоо действие нельзя будет \nотменить',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
            FFButtonWidget(
              onPressed: () async {
                for (int loop1Index = 0;
                    loop1Index < widget.organisation!.services.length;
                    loop1Index++) {
                  final currentLoop1Item =
                      widget.organisation!.services[loop1Index];
                  await currentLoop1Item.delete();
                }
                for (int loop2Index = 0;
                    loop2Index < widget.organisation!.records.length;
                    loop2Index++) {
                  final currentLoop2Item =
                      widget.organisation!.records[loop2Index];
                  await currentLoop2Item.delete();
                }
                for (int loop3Index = 0;
                    loop3Index < widget.organisation!.records.length;
                    loop3Index++) {
                  final currentLoop3Item =
                      widget.organisation!.records[loop3Index];
                  await currentLoop3Item.delete();
                }
                await widget.organisation!.reference.delete();

                await currentUserReference!.update({
                  ...createUserRecordData(
                    essence: UserStatus.user,
                  ),
                  ...mapToFirestore(
                    {
                      'mainMaster': FieldValue.delete(),
                    },
                  ),
                });

                context.goNamed(MainWidget.routeName);
              },
              text: 'Удалить',
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
              text: 'Отмена',
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
