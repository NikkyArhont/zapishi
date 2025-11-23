import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'master_choose_cat_add_serv_widget.dart'
    show MasterChooseCatAddServWidget;
import 'package:flutter/material.dart';

class MasterChooseCatAddServModel
    extends FlutterFlowModel<MasterChooseCatAddServWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> choosenCat = [];
  void addToChoosenCat(DocumentReference item) => choosenCat.add(item);
  void removeFromChoosenCat(DocumentReference item) => choosenCat.remove(item);
  void removeAtIndexFromChoosenCat(int index) => choosenCat.removeAt(index);
  void insertAtIndexInChoosenCat(int index, DocumentReference item) =>
      choosenCat.insert(index, item);
  void updateChoosenCatAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      choosenCat[index] = updateFn(choosenCat[index]);

  DocumentReference? a1;

  DocumentReference? a2;

  DocumentReference? a3;

  ///  State fields for stateful widgets in this page.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
  }
}
