import '/aaazapishi/components/map_button/map_button_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_result_widget.dart' show SearchResultWidget;
import 'package:flutter/material.dart';

class SearchResultModel extends FlutterFlowModel<SearchResultWidget> {
  ///  Local state fields for this page.

  int? searchResult;

  bool searchActive = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ServicesRecord> simpleSearchResults = [];
  // Model for mapButton component.
  late MapButtonModel mapButtonModel;

  @override
  void initState(BuildContext context) {
    mapButtonModel = createModel(context, () => MapButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    mapButtonModel.dispose();
  }
}
