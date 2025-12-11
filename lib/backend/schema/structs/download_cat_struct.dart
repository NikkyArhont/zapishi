// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DownloadCatStruct extends FFFirebaseStruct {
  DownloadCatStruct({
    String? title,
    DocumentReference? refCat,
    List<DocumentReference>? morherCat,
    List<DocumentReference>? childCat,
    String? imageCat,
    bool? isParent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _refCat = refCat,
        _morherCat = morherCat,
        _childCat = childCat,
        _imageCat = imageCat,
        _isParent = isParent,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "refCat" field.
  DocumentReference? _refCat;
  DocumentReference? get refCat => _refCat;
  set refCat(DocumentReference? val) => _refCat = val;

  bool hasRefCat() => _refCat != null;

  // "morherCat" field.
  List<DocumentReference>? _morherCat;
  List<DocumentReference> get morherCat => _morherCat ?? const [];
  set morherCat(List<DocumentReference>? val) => _morherCat = val;

  void updateMorherCat(Function(List<DocumentReference>) updateFn) {
    updateFn(_morherCat ??= []);
  }

  bool hasMorherCat() => _morherCat != null;

  // "childCat" field.
  List<DocumentReference>? _childCat;
  List<DocumentReference> get childCat => _childCat ?? const [];
  set childCat(List<DocumentReference>? val) => _childCat = val;

  void updateChildCat(Function(List<DocumentReference>) updateFn) {
    updateFn(_childCat ??= []);
  }

  bool hasChildCat() => _childCat != null;

  // "imageCat" field.
  String? _imageCat;
  String get imageCat => _imageCat ?? '';
  set imageCat(String? val) => _imageCat = val;

  bool hasImageCat() => _imageCat != null;

  // "IsParent" field.
  bool? _isParent;
  bool get isParent => _isParent ?? false;
  set isParent(bool? val) => _isParent = val;

  bool hasIsParent() => _isParent != null;

  static DownloadCatStruct fromMap(Map<String, dynamic> data) =>
      DownloadCatStruct(
        title: data['title'] as String?,
        refCat: data['refCat'] as DocumentReference?,
        morherCat: getDataList(data['morherCat']),
        childCat: getDataList(data['childCat']),
        imageCat: data['imageCat'] as String?,
        isParent: data['IsParent'] as bool?,
      );

  static DownloadCatStruct? maybeFromMap(dynamic data) => data is Map
      ? DownloadCatStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'refCat': _refCat,
        'morherCat': _morherCat,
        'childCat': _childCat,
        'imageCat': _imageCat,
        'IsParent': _isParent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'refCat': serializeParam(
          _refCat,
          ParamType.DocumentReference,
        ),
        'morherCat': serializeParam(
          _morherCat,
          ParamType.DocumentReference,
          isList: true,
        ),
        'childCat': serializeParam(
          _childCat,
          ParamType.DocumentReference,
          isList: true,
        ),
        'imageCat': serializeParam(
          _imageCat,
          ParamType.String,
        ),
        'IsParent': serializeParam(
          _isParent,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DownloadCatStruct fromSerializableMap(Map<String, dynamic> data) =>
      DownloadCatStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        refCat: deserializeParam(
          data['refCat'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['category'],
        ),
        morherCat: deserializeParam<DocumentReference>(
          data['morherCat'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['category'],
        ),
        childCat: deserializeParam<DocumentReference>(
          data['childCat'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['category'],
        ),
        imageCat: deserializeParam(
          data['imageCat'],
          ParamType.String,
          false,
        ),
        isParent: deserializeParam(
          data['IsParent'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DownloadCatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DownloadCatStruct &&
        title == other.title &&
        refCat == other.refCat &&
        listEquality.equals(morherCat, other.morherCat) &&
        listEquality.equals(childCat, other.childCat) &&
        imageCat == other.imageCat &&
        isParent == other.isParent;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, refCat, morherCat, childCat, imageCat, isParent]);
}

DownloadCatStruct createDownloadCatStruct({
  String? title,
  DocumentReference? refCat,
  String? imageCat,
  bool? isParent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DownloadCatStruct(
      title: title,
      refCat: refCat,
      imageCat: imageCat,
      isParent: isParent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DownloadCatStruct? updateDownloadCatStruct(
  DownloadCatStruct? downloadCat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    downloadCat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDownloadCatStructData(
  Map<String, dynamic> firestoreData,
  DownloadCatStruct? downloadCat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (downloadCat == null) {
    return;
  }
  if (downloadCat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && downloadCat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final downloadCatData =
      getDownloadCatFirestoreData(downloadCat, forFieldValue);
  final nestedData =
      downloadCatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = downloadCat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDownloadCatFirestoreData(
  DownloadCatStruct? downloadCat, [
  bool forFieldValue = false,
]) {
  if (downloadCat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(downloadCat.toMap());

  // Add any Firestore field values
  downloadCat.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDownloadCatListFirestoreData(
  List<DownloadCatStruct>? downloadCats,
) =>
    downloadCats?.map((e) => getDownloadCatFirestoreData(e, true)).toList() ??
    [];
