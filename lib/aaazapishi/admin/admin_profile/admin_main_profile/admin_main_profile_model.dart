import '/aaazapishi/admin/admin_menu/admin_menu_widget.dart';
import '/aaazapishi/admin/admin_top/admin_top_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_main_profile_widget.dart' show AdminMainProfileWidget;
import 'package:flutter/material.dart';

class AdminMainProfileModel extends FlutterFlowModel<AdminMainProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for adminMenu component.
  late AdminMenuModel adminMenuModel;
  // Model for adminTop component.
  late AdminTopModel adminTopModel;
  bool isDataUploading_uploadDataUz9 = false;
  FFUploadedFile uploadedLocalFile_uploadDataUz9 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataUz9 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    adminMenuModel = createModel(context, () => AdminMenuModel());
    adminTopModel = createModel(context, () => AdminTopModel());
  }

  @override
  void dispose() {
    adminMenuModel.dispose();
    adminTopModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
