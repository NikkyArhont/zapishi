import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'enter_edit_profile_widget.dart' show EnterEditProfileWidget;
import 'package:flutter/material.dart';

class EnterEditProfileModel extends FlutterFlowModel<EnterEditProfileWidget> {
  ///  Local state fields for this page.

  String adress = 'Ваше местоположение';

  FFUploadedFile? photo;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - uploadMediaCard] action in IconButton widget.
  FFUploadedFile? media;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Bottom Sheet - enterLocationStart] action in Row widget.
  String? setCity;
  bool isDataUploading_uploadDataGvp = false;
  FFUploadedFile uploadedLocalFile_uploadDataGvp =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataGvp = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
