import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/aaazapishi/components/upload_media_card/upload_media_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/avatar_mini_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_review_model.dart';
export 'create_review_model.dart';

class CreateReviewWidget extends StatefulWidget {
  const CreateReviewWidget({
    super.key,
    required this.record,
  });

  final RecordsRecord? record;

  static String routeName = 'createReview';
  static String routePath = '/createReview';

  @override
  State<CreateReviewWidget> createState() => _CreateReviewWidgetState();
}

class _CreateReviewWidgetState extends State<CreateReviewWidget> {
  late CreateReviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateReviewModel());

    _model.commentTextController ??= TextEditingController();
    _model.commentFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      wrapWithModel(
                        model: _model.backbuttonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BackbuttonWidget(),
                      ),
                      Text(
                        'Отзывы',
                        style:
                            FlutterFlowTheme.of(context).displayMedium.override(
                                  font: GoogleFonts.geologica(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displayMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .fontStyle,
                                ),
                      ),
                      Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: StreamBuilder<MastersRecord>(
                      stream:
                          MastersRecord.getDocument(widget.record!.master!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }

                        final rowMastersRecord = snapshot.data!;

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.avatarMiniModel,
                              updateCallback: () => safeSetState(() {}),
                              child: AvatarMiniWidget(
                                sizeAva: 64,
                                avaURL: rowMastersRecord.banner,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rowMastersRecord.title,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleMediumFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleMediumIsCustom,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.star_half,
                                      color:
                                          FlutterFlowTheme.of(context).customer,
                                      size: 24.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        rowMastersRecord.raiting,
                                        formatType: FormatType.custom,
                                        format: '#.#',
                                        locale: '',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      'Квалификация',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                  RatingBar.builder(
                    onRatingUpdate: (newValue) =>
                        safeSetState(() => _model.cvalValue = newValue),
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                      color: FlutterFlowTheme.of(context).customer,
                    ),
                    direction: Axis.horizontal,
                    initialRating: _model.cvalValue ??= 3.0,
                    unratedColor: FlutterFlowTheme.of(context).alternate,
                    itemCount: 5,
                    itemSize: 48.0,
                    glowColor: FlutterFlowTheme.of(context).customer,
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      'Вежливость*',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                  RatingBar.builder(
                    onRatingUpdate: (newValue) =>
                        safeSetState(() => _model.kindValue = newValue),
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                      color: FlutterFlowTheme.of(context).customer,
                    ),
                    direction: Axis.horizontal,
                    initialRating: _model.kindValue ??= 3.0,
                    unratedColor: FlutterFlowTheme.of(context).alternate,
                    itemCount: 5,
                    itemSize: 48.0,
                    glowColor: FlutterFlowTheme.of(context).customer,
                  ),
                  if (widget.record?.client == currentUserReference)
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Клиентоориентированность*',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                  if (widget.record?.client == currentUserReference)
                    RatingBar.builder(
                      onRatingUpdate: (newValue) =>
                          safeSetState(() => _model.clientValue = newValue),
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: FlutterFlowTheme.of(context).customer,
                      ),
                      direction: Axis.horizontal,
                      initialRating: _model.clientValue ??= 3.0,
                      unratedColor: FlutterFlowTheme.of(context).alternate,
                      itemCount: 5,
                      itemSize: 48.0,
                      glowColor: FlutterFlowTheme.of(context).customer,
                    ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      'Ваш отзыв',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                  TextFormField(
                    controller: _model.commentTextController,
                    focusNode: _model.commentFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Введите отзыв',
                      hintStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelMediumFamily,
                            color: Color(0xFF9E9E9E),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelMediumIsCustom,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding: EdgeInsets.all(18.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                    maxLines: 6,
                    maxLength: 300,
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator: _model.commentTextControllerValidator
                        .asValidator(context),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      'Фото',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Builder(
                            builder: (context) {
                              final loadPhotoList = _model.loadPhoto.toList();

                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(loadPhotoList.length,
                                    (loadPhotoListIndex) {
                                  final loadPhotoListItem =
                                      loadPhotoList[loadPhotoListIndex];
                                  return Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.memory(
                                              loadPhotoListItem.bytes ??
                                                  Uint8List.fromList([]),
                                              width: 90.0,
                                              height: 90.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: FlutterFlowIconButton(
                                            borderRadius: 100.0,
                                            buttonSize: 32.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            icon: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 18.0,
                                            ),
                                            onPressed: () async {
                                              _model.removeFromLoadPhoto(
                                                  loadPhotoListItem);
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).divide(SizedBox(width: 12.0)),
                              );
                            },
                          ),
                          Container(
                            width: 90.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Visibility(
                              visible: _model.loadPhoto.length <= 5,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: UploadMediaCardWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.newDownloadRev = value));

                                  _model.addToLoadPhoto(_model.newDownloadRev!);
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.add,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 8.0))
                            .addToStart(SizedBox(width: 12.0))
                            .addToEnd(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      {
                        safeSetState(() =>
                            _model.isDataUploading_uploadPhotoreview = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];
                        var selectedMedia = <SelectedFile>[];
                        var downloadUrls = <String>[];
                        try {
                          selectedUploadedFiles = _model.loadPhoto;
                          selectedMedia = selectedFilesFromUploadedFiles(
                            selectedUploadedFiles,
                            isMultiData: true,
                          );
                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          _model.isDataUploading_uploadPhotoreview = false;
                        }
                        if (selectedUploadedFiles.length ==
                                selectedMedia.length &&
                            downloadUrls.length == selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFiles_uploadPhotoreview =
                                selectedUploadedFiles;
                            _model.uploadedFileUrls_uploadPhotoreview =
                                downloadUrls;
                          });
                        } else {
                          safeSetState(() {});
                          return;
                        }
                      }

                      var reviewsRecordReference =
                          ReviewsRecord.collection.doc();
                      await reviewsRecordReference.set({
                        ...createReviewsRecordData(
                          author: currentUserReference,
                          star: ((_model.cvalValue!) +
                                  (_model.kindValue!) +
                                  (_model.clientValue!)) /
                              3,
                          comment: _model.commentTextController.text,
                          date: getCurrentTimestamp,
                          punctuality: _model.cvalValue?.round(),
                          clientCind: _model.clientValue?.round(),
                          politeness: _model.kindValue?.round(),
                          client: currentUserReference,
                          master: widget.record?.master,
                          service: widget.record?.services.firstOrNull,
                          record: widget.record?.reference,
                          organisation: widget.record?.organisation,
                        ),
                        ...mapToFirestore(
                          {
                            'photos': _model.uploadedFileUrls_uploadPhotoreview,
                          },
                        ),
                      });
                      _model.newReview = ReviewsRecord.getDocumentFromData({
                        ...createReviewsRecordData(
                          author: currentUserReference,
                          star: ((_model.cvalValue!) +
                                  (_model.kindValue!) +
                                  (_model.clientValue!)) /
                              3,
                          comment: _model.commentTextController.text,
                          date: getCurrentTimestamp,
                          punctuality: _model.cvalValue?.round(),
                          clientCind: _model.clientValue?.round(),
                          politeness: _model.kindValue?.round(),
                          client: currentUserReference,
                          master: widget.record?.master,
                          service: widget.record?.services.firstOrNull,
                          record: widget.record?.reference,
                          organisation: widget.record?.organisation,
                        ),
                        ...mapToFirestore(
                          {
                            'photos': _model.uploadedFileUrls_uploadPhotoreview,
                          },
                        ),
                      }, reviewsRecordReference);
                      _model.readord = await MastersRecord.getDocumentOnce(
                          widget.record!.organisation!);
                      _model.readMaster = await MastersRecord.getDocumentOnce(
                          widget.record!.master!);

                      await widget.record!.organisation!.update({
                        ...createMastersRecordData(
                          raiting: (_model.readord!.reviews.length.toDouble() *
                                      _model.readord!.raiting +
                                  _model.newReview!.star) /
                              (_model.readord!.reviews.length.toDouble() + 1),
                        ),
                        ...mapToFirestore(
                          {
                            'reviews': FieldValue.arrayUnion(
                                [_model.newReview?.reference]),
                          },
                        ),
                      });

                      await widget.record!.reference
                          .update(createRecordsRecordData(
                        revievs: _model.newReview?.reference,
                      ));

                      await widget.record!.master!.update({
                        ...createMastersRecordData(
                          raiting: (_model.readMaster!.reviews.length
                                          .toDouble() *
                                      _model.readMaster!.raiting +
                                  _model.newReview!.star) /
                              (_model.readMaster!.reviews.length.toDouble() +
                                  1),
                        ),
                        ...mapToFirestore(
                          {
                            'reviews': FieldValue.arrayUnion(
                                [_model.newReview?.reference]),
                          },
                        ),
                      });

                      context.goNamed(MainWidget.routeName);

                      safeSetState(() {});
                    },
                    text: 'Отправить',
                    options: FFButtonOptions(
                      width: 360.0,
                      height: 48.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                ]
                    .divide(SizedBox(height: 12.0))
                    .addToStart(SizedBox(height: 24.0))
                    .addToEnd(SizedBox(height: 40.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
