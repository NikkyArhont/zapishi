import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'master_add_service_widget.dart' show MasterAddServiceWidget;
import 'package:flutter/material.dart';

class MasterAddServiceModel extends FlutterFlowModel<MasterAddServiceWidget> {
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
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for time widget.
  FocusNode? timeFocusNode;
  TextEditingController? timeTextController;
  String? Function(BuildContext, String?)? timeTextControllerValidator;
  // State field(s) for cost widget.
  FocusNode? costFocusNode;
  TextEditingController? costTextController;
  String? Function(BuildContext, String?)? costTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Bottom Sheet - uploadMediaCard] action in Icon widget.
  FFUploadedFile? newDownload;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  bool isDataUploading_uploadDataAddServ = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataAddServ = [];
  List<String> uploadedFileUrls_uploadDataAddServ = [];

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ServicesRecord? newService;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    timeFocusNode?.dispose();
    timeTextController?.dispose();

    costFocusNode?.dispose();
    costTextController?.dispose();

    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
