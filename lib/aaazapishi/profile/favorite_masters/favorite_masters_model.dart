import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'favorite_masters_widget.dart' show FavoriteMastersWidget;
import 'package:flutter/material.dart';

class FavoriteMastersModel extends FlutterFlowModel<FavoriteMastersWidget> {
  ///  Local state fields for this page.

  List<MastersRecord> searcchMasters = [];
  void addToSearcchMasters(MastersRecord item) => searcchMasters.add(item);
  void removeFromSearcchMasters(MastersRecord item) =>
      searcchMasters.remove(item);
  void removeAtIndexFromSearcchMasters(int index) =>
      searcchMasters.removeAt(index);
  void insertAtIndexInSearcchMasters(int index, MastersRecord item) =>
      searcchMasters.insert(index, item);
  void updateSearcchMastersAtIndex(
          int index, Function(MastersRecord) updateFn) =>
      searcchMasters[index] = updateFn(searcchMasters[index]);

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
