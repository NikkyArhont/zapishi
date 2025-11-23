import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cchat_window_widget.dart' show CchatWindowWidget;
import 'package:flutter/material.dart';

class CchatWindowModel extends FlutterFlowModel<CchatWindowWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> uploadedPhoto = [];
  void addToUploadedPhoto(FFUploadedFile item) => uploadedPhoto.add(item);
  void removeFromUploadedPhoto(FFUploadedFile item) =>
      uploadedPhoto.remove(item);
  void removeAtIndexFromUploadedPhoto(int index) =>
      uploadedPhoto.removeAt(index);
  void insertAtIndexInUploadedPhoto(int index, FFUploadedFile item) =>
      uploadedPhoto.insert(index, item);
  void updateUploadedPhotoAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      uploadedPhoto[index] = updateFn(uploadedPhoto[index]);

  bool showMenu = false;

  ///  State fields for stateful widgets in this page.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;
  bool isDataUploading_uploadDataDOC = false;
  FFUploadedFile uploadedLocalFile_uploadDataDOC =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataDOC = '';

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? newMessDoc;
  bool isDataUploading_uploadDataCamera = false;
  FFUploadedFile uploadedLocalFile_uploadDataCamera =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataGallery = false;
  FFUploadedFile uploadedLocalFile_uploadDataGallery =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadPhotoMessInFirebase = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadPhotoMessInFirebase = [];
  List<String> uploadedFileUrls_uploadPhotoMessInFirebase = [];

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? newMessTextOrPhoto;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
