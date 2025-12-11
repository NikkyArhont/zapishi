import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'upload_media_card_model.dart';
export 'upload_media_card_model.dart';

class UploadMediaCardWidget extends StatefulWidget {
  const UploadMediaCardWidget({super.key});

  @override
  State<UploadMediaCardWidget> createState() => _UploadMediaCardWidgetState();
}

class _UploadMediaCardWidgetState extends State<UploadMediaCardWidget> {
  late UploadMediaCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadMediaCardModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 300.0,
      constraints: BoxConstraints(
        maxWidth: 500.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
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
          children: [
            Text(
              'Загрузить фотографию',
              style: FlutterFlowTheme.of(context).displayMedium.override(
                    font: GoogleFonts.geologica(
                      fontWeight:
                          FlutterFlowTheme.of(context).displayMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).displayMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).displayMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).displayMedium.fontStyle,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 100.0,
                      buttonSize: 130.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: FaIcon(
                        FontAwesomeIcons.camera,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 50.0,
                      ),
                      showLoadingIndicator:
                          _model.isDataUploading_uploadPhotoServCard,
                      onPressed: () async {
                        final selectedMedia = await selectMedia(
                          maxWidth: 1920.00,
                          maxHeight: 1920.00,
                          multiImage: false,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          safeSetState(() => _model
                              .isDataUploading_uploadPhotoServCard = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                      originalFilename: m.originalFilename,
                                    ))
                                .toList();
                          } finally {
                            _model.isDataUploading_uploadPhotoServCard = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile_uploadPhotoServCard =
                                  selectedUploadedFiles.first;
                            });
                          } else {
                            safeSetState(() {});
                            return;
                          }
                        }

                        Navigator.pop(context,
                            _model.uploadedLocalFile_uploadPhotoServCard);
                      },
                    ),
                    Text(
                      'Камера',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelLargeFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelLargeIsCustom,
                          ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 100.0,
                      buttonSize: 130.0,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: FaIcon(
                        FontAwesomeIcons.image,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 50.0,
                      ),
                      showLoadingIndicator:
                          _model.isDataUploading_uploadMediaServCard,
                      onPressed: () async {
                        final selectedMedia = await selectMedia(
                          maxWidth: 1920.00,
                          maxHeight: 1920.00,
                          mediaSource: MediaSource.photoGallery,
                          multiImage: false,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          safeSetState(() => _model
                              .isDataUploading_uploadMediaServCard = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                      originalFilename: m.originalFilename,
                                    ))
                                .toList();
                          } finally {
                            _model.isDataUploading_uploadMediaServCard = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile_uploadMediaServCard =
                                  selectedUploadedFiles.first;
                            });
                          } else {
                            safeSetState(() {});
                            return;
                          }
                        }

                        Navigator.pop(context,
                            _model.uploadedLocalFile_uploadMediaServCard);
                      },
                    ),
                    Text(
                      'Галерея',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelLargeFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelLargeIsCustom,
                          ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ].divide(SizedBox(width: 24.0)),
            ),
          ],
        ),
      ),
    );
  }
}
