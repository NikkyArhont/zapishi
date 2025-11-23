import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'master_offer_set_serv_widget.dart' show MasterOfferSetServWidget;
import 'package:flutter/material.dart';

class MasterOfferSetServModel
    extends FlutterFlowModel<MasterOfferSetServWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> choosenServ = [];
  void addToChoosenServ(DocumentReference item) => choosenServ.add(item);
  void removeFromChoosenServ(DocumentReference item) =>
      choosenServ.remove(item);
  void removeAtIndexFromChoosenServ(int index) => choosenServ.removeAt(index);
  void insertAtIndexInChoosenServ(int index, DocumentReference item) =>
      choosenServ.insert(index, item);
  void updateChoosenServAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      choosenServ[index] = updateFn(choosenServ[index]);

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
