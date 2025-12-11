import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/backend/backend.dart';
import '/components/avatar_mini_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_review_widget.dart' show CreateReviewWidget;
import 'package:flutter/material.dart';

class CreateReviewModel extends FlutterFlowModel<CreateReviewWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> loadPhoto = [];
  void addToLoadPhoto(FFUploadedFile item) => loadPhoto.add(item);
  void removeFromLoadPhoto(FFUploadedFile item) => loadPhoto.remove(item);
  void removeAtIndexFromLoadPhoto(int index) => loadPhoto.removeAt(index);
  void insertAtIndexInLoadPhoto(int index, FFUploadedFile item) =>
      loadPhoto.insert(index, item);
  void updateLoadPhotoAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      loadPhoto[index] = updateFn(loadPhoto[index]);

  ///  State fields for stateful widgets in this page.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;
  // Model for avatarMini component.
  late AvatarMiniModel avatarMiniModel;
  // State field(s) for cval widget.
  double? cvalValue;
  // State field(s) for kind widget.
  double? kindValue;
  // State field(s) for client widget.
  double? clientValue;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  // Stores action output result for [Bottom Sheet - uploadMediaCard] action in Icon widget.
  FFUploadedFile? newDownloadRev;
  bool isDataUploading_uploadPhotoreview = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadPhotoreview = [];
  List<String> uploadedFileUrls_uploadPhotoreview = [];

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReviewsRecord? newReview;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  MastersRecord? readord;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  MastersRecord? readMaster;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
    avatarMiniModel = createModel(context, () => AvatarMiniModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
    avatarMiniModel.dispose();
    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
