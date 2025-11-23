import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  bool hasShow() => _show != null;

  // "childCat" field.
  List<DocumentReference>? _childCat;
  List<DocumentReference> get childCat => _childCat ?? const [];
  bool hasChildCat() => _childCat != null;

  // "services" field.
  List<DocumentReference>? _services;
  List<DocumentReference> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "isParent" field.
  bool? _isParent;
  bool get isParent => _isParent ?? false;
  bool hasIsParent() => _isParent != null;

  // "parentCat" field.
  DocumentReference? _parentCat;
  DocumentReference? get parentCat => _parentCat;
  bool hasParentCat() => _parentCat != null;

  // "masters" field.
  List<DocumentReference>? _masters;
  List<DocumentReference> get masters => _masters ?? const [];
  bool hasMasters() => _masters != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _show = snapshotData['show'] as bool?;
    _childCat = getDataList(snapshotData['childCat']);
    _services = getDataList(snapshotData['services']);
    _isParent = snapshotData['isParent'] as bool?;
    _parentCat = snapshotData['parentCat'] as DocumentReference?;
    _masters = getDataList(snapshotData['masters']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryRecordData({
  String? title,
  bool? show,
  bool? isParent,
  DocumentReference? parentCat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'show': show,
      'isParent': isParent,
      'parentCat': parentCat,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryRecordDocumentEquality implements Equality<CategoryRecord> {
  const CategoryRecordDocumentEquality();

  @override
  bool equals(CategoryRecord? e1, CategoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.show == e2?.show &&
        listEquality.equals(e1?.childCat, e2?.childCat) &&
        listEquality.equals(e1?.services, e2?.services) &&
        e1?.isParent == e2?.isParent &&
        e1?.parentCat == e2?.parentCat &&
        listEquality.equals(e1?.masters, e2?.masters);
  }

  @override
  int hash(CategoryRecord? e) => const ListEquality().hash([
        e?.title,
        e?.show,
        e?.childCat,
        e?.services,
        e?.isParent,
        e?.parentCat,
        e?.masters
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoryRecord;
}
