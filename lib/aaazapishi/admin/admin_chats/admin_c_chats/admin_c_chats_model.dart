import '/aaazapishi/admin/admin_menu/admin_menu_widget.dart';
import '/aaazapishi/admin/admin_top/admin_top_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_c_chats_widget.dart' show AdminCChatsWidget;
import 'package:flutter/material.dart';

class AdminCChatsModel extends FlutterFlowModel<AdminCChatsWidget> {
  ///  Local state fields for this page.

  ChatRecord? choosenChat;

  bool showMenu = false;

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

  RecordsRecord? loadRecord;

  ///  State fields for stateful widgets in this page.

  // Model for adminMenu component.
  late AdminMenuModel adminMenuModel;
  // Model for adminTop component.
  late AdminTopModel adminTopModel;
  // Stores action output result for [Backend Call - Read Document] action in Row widget.
  RecordsRecord? readRecord;
  bool isDataUploading_uploadDataDOCWebWeb = false;
  FFUploadedFile uploadedLocalFile_uploadDataDOCWebWeb =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataDOCWebWeb = '';

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? newMessDoc;
  bool isDataUploading_uploadDataGalleryWeb = false;
  FFUploadedFile uploadedLocalFile_uploadDataGalleryWeb =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadPhotoMessInFirebaseWeb = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadPhotoMessInFirebaseWeb = [];
  List<String> uploadedFileUrls_uploadPhotoMessInFirebaseWeb = [];

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  MessagesRecord? newMessTextOrPhoto;

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
