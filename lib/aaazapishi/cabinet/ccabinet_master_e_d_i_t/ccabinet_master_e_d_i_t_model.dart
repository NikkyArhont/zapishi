import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ccabinet_master_e_d_i_t_widget.dart' show CcabinetMasterEDITWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CcabinetMasterEDITModel
    extends FlutterFlowModel<CcabinetMasterEDITWidget> {
  ///  Local state fields for this page.

  UserStatus? essence = UserStatus.manager;

  String? banner;

  bool organization = true;

  List<FFUploadedFile> docList = [];
  void addToDocList(FFUploadedFile item) => docList.add(item);
  void removeFromDocList(FFUploadedFile item) => docList.remove(item);
  void removeAtIndexFromDocList(int index) => docList.removeAt(index);
  void insertAtIndexInDocList(int index, FFUploadedFile item) =>
      docList.insert(index, item);
  void updateDocListAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      docList[index] = updateFn(docList[index]);

  bool remote = false;

  SearchPlaceStruct? address;
  void updateAddressStruct(Function(SearchPlaceStruct) updateFn) {
    updateFn(address ??= SearchPlaceStruct());
  }

  bool? radiusTog = false;

  SearchPlaceStruct? remoteAdres;
  void updateRemoteAdresStruct(Function(SearchPlaceStruct) updateFn) {
    updateFn(remoteAdres ??= SearchPlaceStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;
  // Stores action output result for [Bottom Sheet - uploadMediaCard] action in IconButton widget.
  FFUploadedFile? uploadBanner;
  bool isDataUploading_uploadDataBanner2EDIT = false;
  FFUploadedFile uploadedLocalFile_uploadDataBanner2EDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataBanner2EDIT = '';

  // State field(s) for Switch widget.
  bool? switchValue1;
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
  late MaskTextInputFormatter textFieldMask3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Bottom Sheet - enterLocationMaster] action in Container widget.
  SearchPlaceStruct? setAddres;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Stores action output result for [Bottom Sheet - enterLocationMaster] action in Container widget.
  SearchPlaceStruct? setRemoteAddres;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  bool isDataUploading_uploadData9btEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadData9btEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataDocumentsEdit = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataDocumentsEdit = [];
  List<String> uploadedFileUrls_uploadDataDocumentsEdit = [];

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

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();
  }
}
