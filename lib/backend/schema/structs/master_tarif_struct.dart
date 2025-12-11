// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MasterTarifStruct extends FFFirebaseStruct {
  MasterTarifStruct({
    DocumentReference? tarif,
    DateTime? start,
    DateTime? end,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tarif = tarif,
        _start = start,
        _end = end,
        super(firestoreUtilData);

  // "tarif" field.
  DocumentReference? _tarif;
  DocumentReference? get tarif => _tarif;
  set tarif(DocumentReference? val) => _tarif = val;

  bool hasTarif() => _tarif != null;

  // "start" field.
  DateTime? _start;
  DateTime? get start => _start;
  set start(DateTime? val) => _start = val;

  bool hasStart() => _start != null;

  // "end" field.
  DateTime? _end;
  DateTime? get end => _end;
  set end(DateTime? val) => _end = val;

  bool hasEnd() => _end != null;

  static MasterTarifStruct fromMap(Map<String, dynamic> data) =>
      MasterTarifStruct(
        tarif: data['tarif'] as DocumentReference?,
        start: data['start'] as DateTime?,
        end: data['end'] as DateTime?,
      );

  static MasterTarifStruct? maybeFromMap(dynamic data) => data is Map
      ? MasterTarifStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tarif': _tarif,
        'start': _start,
        'end': _end,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tarif': serializeParam(
          _tarif,
          ParamType.DocumentReference,
        ),
        'start': serializeParam(
          _start,
          ParamType.DateTime,
        ),
        'end': serializeParam(
          _end,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static MasterTarifStruct fromSerializableMap(Map<String, dynamic> data) =>
      MasterTarifStruct(
        tarif: deserializeParam(
          data['tarif'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tarif'],
        ),
        start: deserializeParam(
          data['start'],
          ParamType.DateTime,
          false,
        ),
        end: deserializeParam(
          data['end'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'MasterTarifStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MasterTarifStruct &&
        tarif == other.tarif &&
        start == other.start &&
        end == other.end;
  }

  @override
  int get hashCode => const ListEquality().hash([tarif, start, end]);
}

MasterTarifStruct createMasterTarifStruct({
  DocumentReference? tarif,
  DateTime? start,
  DateTime? end,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MasterTarifStruct(
      tarif: tarif,
      start: start,
      end: end,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MasterTarifStruct? updateMasterTarifStruct(
  MasterTarifStruct? masterTarif, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    masterTarif
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMasterTarifStructData(
  Map<String, dynamic> firestoreData,
  MasterTarifStruct? masterTarif,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (masterTarif == null) {
    return;
  }
  if (masterTarif.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && masterTarif.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final masterTarifData =
      getMasterTarifFirestoreData(masterTarif, forFieldValue);
  final nestedData =
      masterTarifData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = masterTarif.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMasterTarifFirestoreData(
  MasterTarifStruct? masterTarif, [
  bool forFieldValue = false,
]) {
  if (masterTarif == null) {
    return {};
  }
  final firestoreData = mapToFirestore(masterTarif.toMap());

  // Add any Firestore field values
  masterTarif.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMasterTarifListFirestoreData(
  List<MasterTarifStruct>? masterTarifs,
) =>
    masterTarifs?.map((e) => getMasterTarifFirestoreData(e, true)).toList() ??
    [];
