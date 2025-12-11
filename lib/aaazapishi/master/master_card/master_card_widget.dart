import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'master_card_model.dart';
export 'master_card_model.dart';

class MasterCardWidget extends StatefulWidget {
  const MasterCardWidget({
    super.key,
    required this.masterCard,
    bool? choosen,
  }) : this.choosen = choosen ?? false;

  final MastersRecord? masterCard;
  final bool choosen;

  @override
  State<MasterCardWidget> createState() => _MasterCardWidgetState();
}

class _MasterCardWidgetState extends State<MasterCardWidget> {
  late MasterCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MasterCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        width: 210.0,
        height: 270.0,
        decoration: BoxDecoration(
          color: widget.choosen
              ? FlutterFlowTheme.of(context).secondary
              : FlutterFlowTheme.of(context).accent4,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.masterCard!.banner,
              width: 210.0,
              height: 190.0,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Text(
                    valueOrDefault<String>(
                      widget.masterCard?.title,
                      'noNameiylvoukyvkuik',
                    ),
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleMediumFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).titleMediumIsCustom,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.star_half,
                      color: FlutterFlowTheme.of(context).customer,
                      size: 18.0,
                    ),
                    Text(
                      formatNumber(
                        widget.masterCard!.raiting,
                        formatType: FormatType.custom,
                        format: '#.#',
                        locale: '',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ].divide(SizedBox(width: 6.0)),
                ),
              ]
                  .divide(SizedBox(width: 12.0))
                  .addToStart(SizedBox(width: 12.0))
                  .addToEnd(SizedBox(width: 12.0)),
            ),
            if (FFAppState().firstTime)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Смотреть отзывы',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFE0E0E0),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
          ].divide(SizedBox(height: 18.0)),
        ),
      ),
    );
  }
}
