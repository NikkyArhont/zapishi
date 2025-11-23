// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanerDataOrganisationStruct extends FFFirebaseStruct {
  PlanerDataOrganisationStruct({
    int? emptyHeight,
    int? recordHeight,
    List<DocumentReference>? recordsRef,
    List<int>? recordIndex,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _emptyHeight = emptyHeight,
        _recordHeight = recordHeight,
        _recordsRef = recordsRef,
        _recordIndex = recordIndex,
        super(firestoreUtilData);

  // "emptyHeight" field.
  int? _emptyHeight;
  int get emptyHeight => _emptyHeight ?? 0;
  set emptyHeight(int? val) => _emptyHeight = val;

  void incrementEmptyHeight(int amount) => emptyHeight = emptyHeight + amount;

  bool hasEmptyHeight() => _emptyHeight != null;

  // "RecordHeight" field.
  int? _recordHeight;
  int get recordHeight => _recordHeight ?? 0;
  set recordHeight(int? val) => _recordHeight = val;

  void incrementRecordHeight(int amount) =>
      recordHeight = recordHeight + amount;

  bool hasRecordHeight() => _recordHeight != null;

  // "recordsRef" field.
  List<DocumentReference>? _recordsRef;
  List<DocumentReference> get recordsRef => _recordsRef ?? const [];
  set recordsRef(List<DocumentReference>? val) => _recordsRef = val;

  void updateRecordsRef(Function(List<DocumentReference>) updateFn) {
    updateFn(_recordsRef ??= []);
  }

  bool hasRecordsRef() => _recordsRef != null;

  // "recordIndex" field.
  List<int>? _recordIndex;
  List<int> get recordIndex => _recordIndex ?? const [];
  set recordIndex(List<int>? val) => _recordIndex = val;

  void updateRecordIndex(Function(List<int>) updateFn) {
    updateFn(_recordIndex ??= []);
  }

  bool hasRecordIndex() => _recordIndex != null;

  static PlanerDataOrganisationStruct fromMap(Map<String, dynamic> data) =>
      PlanerDataOrganisationStruct(
        emptyHeight: castToType<int>(data['emptyHeight']),
        recordHeight: castToType<int>(data['RecordHeight']),
        recordsRef: getDataList(data['recordsRef']),
        recordIndex: getDataList(data['recordIndex']),
      );

  static PlanerDataOrganisationStruct? maybeFromMap(dynamic data) => data is Map
      ? PlanerDataOrganisationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'emptyHeight': _emptyHeight,
        'RecordHeight': _recordHeight,
        'recordsRef': _recordsRef,
        'recordIndex': _recordIndex,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'emptyHeight': serializeParam(
          _emptyHeight,
          ParamType.int,
        ),
        'RecordHeight': serializeParam(
          _recordHeight,
          ParamType.int,
        ),
        'recordsRef': serializeParam(
          _recordsRef,
          ParamType.DocumentReference,
          isList: true,
        ),
        'recordIndex': serializeParam(
          _recordIndex,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static PlanerDataOrganisationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PlanerDataOrganisationStruct(
        emptyHeight: deserializeParam(
          data['emptyHeight'],
          ParamType.int,
          false,
        ),
        recordHeight: deserializeParam(
          data['RecordHeight'],
          ParamType.int,
          false,
        ),
        recordsRef: deserializeParam<DocumentReference>(
          data['recordsRef'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['records'],
        ),
        recordIndex: deserializeParam<int>(
          data['recordIndex'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'PlanerDataOrganisationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlanerDataOrganisationStruct &&
        emptyHeight == other.emptyHeight &&
        recordHeight == other.recordHeight &&
        listEquality.equals(recordsRef, other.recordsRef) &&
        listEquality.equals(recordIndex, other.recordIndex);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([emptyHeight, recordHeight, recordsRef, recordIndex]);
}

PlanerDataOrganisationStruct createPlanerDataOrganisationStruct({
  int? emptyHeight,
  int? recordHeight,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlanerDataOrganisationStruct(
      emptyHeight: emptyHeight,
      recordHeight: recordHeight,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlanerDataOrganisationStruct? updatePlanerDataOrganisationStruct(
  PlanerDataOrganisationStruct? planerDataOrganisation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    planerDataOrganisation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlanerDataOrganisationStructData(
  Map<String, dynamic> firestoreData,
  PlanerDataOrganisationStruct? planerDataOrganisation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (planerDataOrganisation == null) {
    return;
  }
  if (planerDataOrganisation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      planerDataOrganisation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final planerDataOrganisationData = getPlanerDataOrganisationFirestoreData(
      planerDataOrganisation, forFieldValue);
  final nestedData =
      planerDataOrganisationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      planerDataOrganisation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlanerDataOrganisationFirestoreData(
  PlanerDataOrganisationStruct? planerDataOrganisation, [
  bool forFieldValue = false,
]) {
  if (planerDataOrganisation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(planerDataOrganisation.toMap());

  // Add any Firestore field values
  planerDataOrganisation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlanerDataOrganisationListFirestoreData(
  List<PlanerDataOrganisationStruct>? planerDataOrganisations,
) =>
    planerDataOrganisations
        ?.map((e) => getPlanerDataOrganisationFirestoreData(e, true))
        .toList() ??
    [];
