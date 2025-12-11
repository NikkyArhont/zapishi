import '/flutter_flow/flutter_flow_util.dart';
import 'upload_media_card_widget.dart' show UploadMediaCardWidget;
import 'package:flutter/material.dart';

class UploadMediaCardModel extends FlutterFlowModel<UploadMediaCardWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? file;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadPhotoServCard = false;
  FFUploadedFile uploadedLocalFile_uploadPhotoServCard =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadMediaServCard = false;
  FFUploadedFile uploadedLocalFile_uploadMediaServCard =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
