import '/flutter_flow/flutter_flow_util.dart';
import 'create_debate_widget.dart' show CreateDebateWidget;
import 'package:flutter/material.dart';

class CreateDebateModel extends FlutterFlowModel<CreateDebateWidget> {
  ///  Local state fields for this page.

  List<String> uploadedMedia = [];
  void addToUploadedMedia(String item) => uploadedMedia.add(item);
  void removeFromUploadedMedia(String item) => uploadedMedia.remove(item);
  void removeAtIndexFromUploadedMedia(int index) =>
      uploadedMedia.removeAt(index);
  void insertAtIndexInUploadedMedia(int index, String item) =>
      uploadedMedia.insert(index, item);
  void updateUploadedMediaAtIndex(int index, Function(String) updateFn) =>
      uploadedMedia[index] = updateFn(uploadedMedia[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;
  // Stores action output result for [Bottom Sheet - uploadMediaCard] action in IconButton widget.
  FFUploadedFile? media;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
