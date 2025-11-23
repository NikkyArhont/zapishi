import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photo" field.
  List<String>? _photo;
  List<String> get photo => _photo ?? const [];
  bool hasPhoto() => _photo != null;

  // "raiting" field.
  double? _raiting;
  double get raiting => _raiting ?? 0.0;
  bool hasRaiting() => _raiting != null;

  // "reviews" field.
  List<DocumentReference>? _reviews;
  List<DocumentReference> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  bool hasShow() => _show != null;

  // "fixedPrice" field.
  bool? _fixedPrice;
  bool get fixedPrice => _fixedPrice ?? false;
  bool hasFixedPrice() => _fixedPrice != null;

  // "category" field.
  List<DocumentReference>? _category;
  List<DocumentReference> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "whoCreate" field.
  DocumentReference? _whoCreate;
  DocumentReference? get whoCreate => _whoCreate;
  bool hasWhoCreate() => _whoCreate != null;

  // "organisation" field.
  DocumentReference? _organisation;
  DocumentReference? get organisation => _organisation;
  bool hasOrganisation() => _organisation != null;

  // "masters" field.
  List<DocumentReference>? _masters;
  List<DocumentReference> get masters => _masters ?? const [];
  bool hasMasters() => _masters != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "locationMaster" field.
  LatLng? _locationMaster;
  LatLng? get locationMaster => _locationMaster;
  bool hasLocationMaster() => _locationMaster != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
    _photo = getDataList(snapshotData['photo']);
    _raiting = castToType<double>(snapshotData['raiting']);
    _reviews = getDataList(snapshotData['reviews']);
    _show = snapshotData['show'] as bool?;
    _fixedPrice = snapshotData['fixedPrice'] as bool?;
    _category = getDataList(snapshotData['category']);
    _whoCreate = snapshotData['whoCreate'] as DocumentReference?;
    _organisation = snapshotData['organisation'] as DocumentReference?;
    _masters = getDataList(snapshotData['masters']);
    _duration = castToType<int>(snapshotData['duration']);
    _locationMaster = snapshotData['locationMaster'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
  String? title,
  int? price,
  String? description,
  double? raiting,
  bool? show,
  bool? fixedPrice,
  DocumentReference? whoCreate,
  DocumentReference? organisation,
  int? duration,
  LatLng? locationMaster,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'price': price,
      'description': description,
      'raiting': raiting,
      'show': show,
      'fixedPrice': fixedPrice,
      'whoCreate': whoCreate,
      'organisation': organisation,
      'duration': duration,
      'locationMaster': locationMaster,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.photo, e2?.photo) &&
        e1?.raiting == e2?.raiting &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        e1?.show == e2?.show &&
        e1?.fixedPrice == e2?.fixedPrice &&
        listEquality.equals(e1?.category, e2?.category) &&
        e1?.whoCreate == e2?.whoCreate &&
        e1?.organisation == e2?.organisation &&
        listEquality.equals(e1?.masters, e2?.masters) &&
        e1?.duration == e2?.duration &&
        e1?.locationMaster == e2?.locationMaster;
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.price,
        e?.description,
        e?.photo,
        e?.raiting,
        e?.reviews,
        e?.show,
        e?.fixedPrice,
        e?.category,
        e?.whoCreate,
        e?.organisation,
        e?.masters,
        e?.duration,
        e?.locationMaster
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
