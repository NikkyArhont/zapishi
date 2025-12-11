// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceDetailInorderStruct extends FFFirebaseStruct {
  ServiceDetailInorderStruct({
    DocumentReference? servRef,
    String? note,
    List<String>? notePhotos,
    bool? choosen,
    bool? complete,
    String? completeNote,
    List<String>? competePhotos,
    DocumentReference? review,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _servRef = servRef,
        _note = note,
        _notePhotos = notePhotos,
        _choosen = choosen,
        _complete = complete,
        _completeNote = completeNote,
        _competePhotos = competePhotos,
        _review = review,
        super(firestoreUtilData);

  // "servRef" field.
  DocumentReference? _servRef;
  DocumentReference? get servRef => _servRef;
  set servRef(DocumentReference? val) => _servRef = val;

  bool hasServRef() => _servRef != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "notePhotos" field.
  List<String>? _notePhotos;
  List<String> get notePhotos => _notePhotos ?? const [];
  set notePhotos(List<String>? val) => _notePhotos = val;

  void updateNotePhotos(Function(List<String>) updateFn) {
    updateFn(_notePhotos ??= []);
  }

  bool hasNotePhotos() => _notePhotos != null;

  // "choosen" field.
  bool? _choosen;
  bool get choosen => _choosen ?? false;
  set choosen(bool? val) => _choosen = val;

  bool hasChoosen() => _choosen != null;

  // "complete" field.
  bool? _complete;
  bool get complete => _complete ?? false;
  set complete(bool? val) => _complete = val;

  bool hasComplete() => _complete != null;

  // "completeNote" field.
  String? _completeNote;
  String get completeNote => _completeNote ?? '';
  set completeNote(String? val) => _completeNote = val;

  bool hasCompleteNote() => _completeNote != null;

  // "competePhotos" field.
  List<String>? _competePhotos;
  List<String> get competePhotos => _competePhotos ?? const [];
  set competePhotos(List<String>? val) => _competePhotos = val;

  void updateCompetePhotos(Function(List<String>) updateFn) {
    updateFn(_competePhotos ??= []);
  }

  bool hasCompetePhotos() => _competePhotos != null;

  // "review" field.
  DocumentReference? _review;
  DocumentReference? get review => _review;
  set review(DocumentReference? val) => _review = val;

  bool hasReview() => _review != null;

  static ServiceDetailInorderStruct fromMap(Map<String, dynamic> data) =>
      ServiceDetailInorderStruct(
        servRef: data['servRef'] as DocumentReference?,
        note: data['note'] as String?,
        notePhotos: getDataList(data['notePhotos']),
        choosen: data['choosen'] as bool?,
        complete: data['complete'] as bool?,
        completeNote: data['completeNote'] as String?,
        competePhotos: getDataList(data['competePhotos']),
        review: data['review'] as DocumentReference?,
      );

  static ServiceDetailInorderStruct? maybeFromMap(dynamic data) => data is Map
      ? ServiceDetailInorderStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'servRef': _servRef,
        'note': _note,
        'notePhotos': _notePhotos,
        'choosen': _choosen,
        'complete': _complete,
        'completeNote': _completeNote,
        'competePhotos': _competePhotos,
        'review': _review,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'servRef': serializeParam(
          _servRef,
          ParamType.DocumentReference,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'notePhotos': serializeParam(
          _notePhotos,
          ParamType.String,
          isList: true,
        ),
        'choosen': serializeParam(
          _choosen,
          ParamType.bool,
        ),
        'complete': serializeParam(
          _complete,
          ParamType.bool,
        ),
        'completeNote': serializeParam(
          _completeNote,
          ParamType.String,
        ),
        'competePhotos': serializeParam(
          _competePhotos,
          ParamType.String,
          isList: true,
        ),
        'review': serializeParam(
          _review,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ServiceDetailInorderStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ServiceDetailInorderStruct(
        servRef: deserializeParam(
          data['servRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['services'],
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        notePhotos: deserializeParam<String>(
          data['notePhotos'],
          ParamType.String,
          true,
        ),
        choosen: deserializeParam(
          data['choosen'],
          ParamType.bool,
          false,
        ),
        complete: deserializeParam(
          data['complete'],
          ParamType.bool,
          false,
        ),
        completeNote: deserializeParam(
          data['completeNote'],
          ParamType.String,
          false,
        ),
        competePhotos: deserializeParam<String>(
          data['competePhotos'],
          ParamType.String,
          true,
        ),
        review: deserializeParam(
          data['review'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['reviews'],
        ),
      );

  @override
  String toString() => 'ServiceDetailInorderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ServiceDetailInorderStruct &&
        servRef == other.servRef &&
        note == other.note &&
        listEquality.equals(notePhotos, other.notePhotos) &&
        choosen == other.choosen &&
        complete == other.complete &&
        completeNote == other.completeNote &&
        listEquality.equals(competePhotos, other.competePhotos) &&
        review == other.review;
  }

  @override
  int get hashCode => const ListEquality().hash([
        servRef,
        note,
        notePhotos,
        choosen,
        complete,
        completeNote,
        competePhotos,
        review
      ]);
}

ServiceDetailInorderStruct createServiceDetailInorderStruct({
  DocumentReference? servRef,
  String? note,
  bool? choosen,
  bool? complete,
  String? completeNote,
  DocumentReference? review,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServiceDetailInorderStruct(
      servRef: servRef,
      note: note,
      choosen: choosen,
      complete: complete,
      completeNote: completeNote,
      review: review,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServiceDetailInorderStruct? updateServiceDetailInorderStruct(
  ServiceDetailInorderStruct? serviceDetailInorder, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    serviceDetailInorder
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServiceDetailInorderStructData(
  Map<String, dynamic> firestoreData,
  ServiceDetailInorderStruct? serviceDetailInorder,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (serviceDetailInorder == null) {
    return;
  }
  if (serviceDetailInorder.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && serviceDetailInorder.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final serviceDetailInorderData =
      getServiceDetailInorderFirestoreData(serviceDetailInorder, forFieldValue);
  final nestedData =
      serviceDetailInorderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      serviceDetailInorder.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServiceDetailInorderFirestoreData(
  ServiceDetailInorderStruct? serviceDetailInorder, [
  bool forFieldValue = false,
]) {
  if (serviceDetailInorder == null) {
    return {};
  }
  final firestoreData = mapToFirestore(serviceDetailInorder.toMap());

  // Add any Firestore field values
  serviceDetailInorder.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServiceDetailInorderListFirestoreData(
  List<ServiceDetailInorderStruct>? serviceDetailInorders,
) =>
    serviceDetailInorders
        ?.map((e) => getServiceDetailInorderFirestoreData(e, true))
        .toList() ??
    [];
