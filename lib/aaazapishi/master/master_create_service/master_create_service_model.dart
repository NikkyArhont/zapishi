import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'master_create_service_widget.dart' show MasterCreateServiceWidget;
import 'package:flutter/material.dart';

class MasterCreateServiceModel
    extends FlutterFlowModel<MasterCreateServiceWidget> {
  ///  Local state fields for this page.

  bool fixPcrice = false;

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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Bottom Sheet - uploadMediaCard] action in Icon widget.
  FFUploadedFile? newDownload;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  bool isDataUploading_uploadDataUr9 = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataUr9 = [];
  List<String> uploadedFileUrls_uploadDataUr9 = [];

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
