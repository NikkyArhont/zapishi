// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PlanerDataMasterStruct extends FFFirebaseStruct {
  PlanerDataMasterStruct({
    int? emptyHeight,
    int? recordHeight,
    int? recordRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _emptyHeight = emptyHeight,
        _recordHeight = recordHeight,
        _recordRef = recordRef,
        super(firestoreUtilData);

  // "emptyHeight" field.
  int? _emptyHeight;
  int get emptyHeight => _emptyHeight ?? 0;
  set emptyHeight(int? val) => _emptyHeight = val;

  void incrementEmptyHeight(int amount) => emptyHeight = emptyHeight + amount;

  bool hasEmptyHeight() => _emptyHeight != null;

  // "recordHeight" field.
  int? _recordHeight;
  int get recordHeight => _recordHeight ?? 0;
  set recordHeight(int? val) => _recordHeight = val;

  void incrementRecordHeight(int amount) =>
      recordHeight = recordHeight + amount;

  bool hasRecordHeight() => _recordHeight != null;

  // "recordRef" field.
  int? _recordRef;
  int get recordRef => _recordRef ?? 0;
  set recordRef(int? val) => _recordRef = val;

  void incrementRecordRef(int amount) => recordRef = recordRef + amount;

  bool hasRecordRef() => _recordRef != null;

  static PlanerDataMasterStruct fromMap(Map<String, dynamic> data) =>
      PlanerDataMasterStruct(
        emptyHeight: castToType<int>(data['emptyHeight']),
        recordHeight: castToType<int>(data['recordHeight']),
        recordRef: castToType<int>(data['recordRef']),
      );

  static PlanerDataMasterStruct? maybeFromMap(dynamic data) => data is Map
      ? PlanerDataMasterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'emptyHeight': _emptyHeight,
        'recordHeight': _recordHeight,
        'recordRef': _recordRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'emptyHeight': serializeParam(
          _emptyHeight,
          ParamType.int,
        ),
        'recordHeight': serializeParam(
          _recordHeight,
          ParamType.int,
        ),
        'recordRef': serializeParam(
          _recordRef,
          ParamType.int,
        ),
      }.withoutNulls;

  static PlanerDataMasterStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PlanerDataMasterStruct(
        emptyHeight: deserializeParam(
          data['emptyHeight'],
          ParamType.int,
          false,
        ),
        recordHeight: deserializeParam(
          data['recordHeight'],
          ParamType.int,
          false,
        ),
        recordRef: deserializeParam(
          data['recordRef'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PlanerDataMasterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlanerDataMasterStruct &&
        emptyHeight == other.emptyHeight &&
        recordHeight == other.recordHeight &&
        recordRef == other.recordRef;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([emptyHeight, recordHeight, recordRef]);
}

PlanerDataMasterStruct createPlanerDataMasterStruct({
  int? emptyHeight,
  int? recordHeight,
  int? recordRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlanerDataMasterStruct(
      emptyHeight: emptyHeight,
      recordHeight: recordHeight,
      recordRef: recordRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlanerDataMasterStruct? updatePlanerDataMasterStruct(
  PlanerDataMasterStruct? planerDataMaster, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    planerDataMaster
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlanerDataMasterStructData(
  Map<String, dynamic> firestoreData,
  PlanerDataMasterStruct? planerDataMaster,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (planerDataMaster == null) {
    return;
  }
  if (planerDataMaster.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && planerDataMaster.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final planerDataMasterData =
      getPlanerDataMasterFirestoreData(planerDataMaster, forFieldValue);
  final nestedData =
      planerDataMasterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = planerDataMaster.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlanerDataMasterFirestoreData(
  PlanerDataMasterStruct? planerDataMaster, [
  bool forFieldValue = false,
]) {
  if (planerDataMaster == null) {
    return {};
  }
  final firestoreData = mapToFirestore(planerDataMaster.toMap());

  // Add any Firestore field values
  planerDataMaster.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlanerDataMasterListFirestoreData(
  List<PlanerDataMasterStruct>? planerDataMasters,
) =>
    planerDataMasters
        ?.map((e) => getPlanerDataMasterFirestoreData(e, true))
        .toList() ??
    [];
