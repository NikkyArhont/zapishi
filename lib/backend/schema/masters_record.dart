import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MastersRecord extends FirestoreRecord {
  MastersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "manager" field.
  String? _manager;
  String get manager => _manager ?? '';
  bool hasManager() => _manager != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  bool hasBanner() => _banner != null;

  // "years" field.
  int? _years;
  int get years => _years ?? 0;
  bool hasYears() => _years != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "docs" field.
  List<String>? _docs;
  List<String> get docs => _docs ?? const [];
  bool hasDocs() => _docs != null;

  // "services" field.
  List<DocumentReference>? _services;
  List<DocumentReference> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "radius" field.
  double? _radius;
  double get radius => _radius ?? 0.0;
  bool hasRadius() => _radius != null;

  // "workTime" field.
  List<WorkSchedulleStruct>? _workTime;
  List<WorkSchedulleStruct> get workTime => _workTime ?? const [];
  bool hasWorkTime() => _workTime != null;

  // "remotePrice" field.
  int? _remotePrice;
  int get remotePrice => _remotePrice ?? 0;
  bool hasRemotePrice() => _remotePrice != null;

  // "adres" field.
  SearchPlaceStruct? _adres;
  SearchPlaceStruct get adres => _adres ?? SearchPlaceStruct();
  bool hasAdres() => _adres != null;

  // "remoteAdres" field.
  SearchPlaceStruct? _remoteAdres;
  SearchPlaceStruct get remoteAdres => _remoteAdres ?? SearchPlaceStruct();
  bool hasRemoteAdres() => _remoteAdres != null;

  // "type" field.
  UserStatus? _type;
  UserStatus? get type => _type;
  bool hasType() => _type != null;

  // "raiting" field.
  double? _raiting;
  double get raiting => _raiting ?? 0.0;
  bool hasRaiting() => _raiting != null;

  // "reviews" field.
  List<DocumentReference>? _reviews;
  List<DocumentReference> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "worker" field.
  List<DocumentReference>? _worker;
  List<DocumentReference> get worker => _worker ?? const [];
  bool hasWorker() => _worker != null;

  // "parentCat" field.
  List<DocumentReference>? _parentCat;
  List<DocumentReference> get parentCat => _parentCat ?? const [];
  bool hasParentCat() => _parentCat != null;

  // "middleCat" field.
  List<DocumentReference>? _middleCat;
  List<DocumentReference> get middleCat => _middleCat ?? const [];
  bool hasMiddleCat() => _middleCat != null;

  // "childCat" field.
  List<DocumentReference>? _childCat;
  List<DocumentReference> get childCat => _childCat ?? const [];
  bool hasChildCat() => _childCat != null;

  // "records" field.
  List<DocumentReference>? _records;
  List<DocumentReference> get records => _records ?? const [];
  bool hasRecords() => _records != null;

  // "job" field.
  DocumentReference? _job;
  DocumentReference? get job => _job;
  bool hasJob() => _job != null;

  // "jobStatus" field.
  JobStatus? _jobStatus;
  JobStatus? get jobStatus => _jobStatus;
  bool hasJobStatus() => _jobStatus != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _phone = snapshotData['phone'] as String?;
    _manager = snapshotData['manager'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _banner = snapshotData['banner'] as String?;
    _years = castToType<int>(snapshotData['years']);
    _description = snapshotData['description'] as String?;
    _docs = getDataList(snapshotData['docs']);
    _services = getDataList(snapshotData['services']);
    _radius = castToType<double>(snapshotData['radius']);
    _workTime = getStructList(
      snapshotData['workTime'],
      WorkSchedulleStruct.fromMap,
    );
    _remotePrice = castToType<int>(snapshotData['remotePrice']);
    _adres = snapshotData['adres'] is SearchPlaceStruct
        ? snapshotData['adres']
        : SearchPlaceStruct.maybeFromMap(snapshotData['adres']);
    _remoteAdres = snapshotData['remoteAdres'] is SearchPlaceStruct
        ? snapshotData['remoteAdres']
        : SearchPlaceStruct.maybeFromMap(snapshotData['remoteAdres']);
    _type = snapshotData['type'] is UserStatus
        ? snapshotData['type']
        : deserializeEnum<UserStatus>(snapshotData['type']);
    _raiting = castToType<double>(snapshotData['raiting']);
    _reviews = getDataList(snapshotData['reviews']);
    _worker = getDataList(snapshotData['worker']);
    _parentCat = getDataList(snapshotData['parentCat']);
    _middleCat = getDataList(snapshotData['middleCat']);
    _childCat = getDataList(snapshotData['childCat']);
    _records = getDataList(snapshotData['records']);
    _job = snapshotData['job'] as DocumentReference?;
    _jobStatus = snapshotData['jobStatus'] is JobStatus
        ? snapshotData['jobStatus']
        : deserializeEnum<JobStatus>(snapshotData['jobStatus']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('masters');

  static Stream<MastersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MastersRecord.fromSnapshot(s));

  static Future<MastersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MastersRecord.fromSnapshot(s));

  static MastersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MastersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MastersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MastersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MastersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MastersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMastersRecordData({
  String? title,
  String? phone,
  String? manager,
  DocumentReference? owner,
  String? banner,
  int? years,
  String? description,
  double? radius,
  int? remotePrice,
  SearchPlaceStruct? adres,
  SearchPlaceStruct? remoteAdres,
  UserStatus? type,
  double? raiting,
  DocumentReference? job,
  JobStatus? jobStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'phone': phone,
      'manager': manager,
      'owner': owner,
      'banner': banner,
      'years': years,
      'description': description,
      'radius': radius,
      'remotePrice': remotePrice,
      'adres': SearchPlaceStruct().toMap(),
      'remoteAdres': SearchPlaceStruct().toMap(),
      'type': type,
      'raiting': raiting,
      'job': job,
      'jobStatus': jobStatus,
    }.withoutNulls,
  );

  // Handle nested data for "adres" field.
  addSearchPlaceStructData(firestoreData, adres, 'adres');

  // Handle nested data for "remoteAdres" field.
  addSearchPlaceStructData(firestoreData, remoteAdres, 'remoteAdres');

  return firestoreData;
}

class MastersRecordDocumentEquality implements Equality<MastersRecord> {
  const MastersRecordDocumentEquality();

  @override
  bool equals(MastersRecord? e1, MastersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.phone == e2?.phone &&
        e1?.manager == e2?.manager &&
        e1?.owner == e2?.owner &&
        e1?.banner == e2?.banner &&
        e1?.years == e2?.years &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.docs, e2?.docs) &&
        listEquality.equals(e1?.services, e2?.services) &&
        e1?.radius == e2?.radius &&
        listEquality.equals(e1?.workTime, e2?.workTime) &&
        e1?.remotePrice == e2?.remotePrice &&
        e1?.adres == e2?.adres &&
        e1?.remoteAdres == e2?.remoteAdres &&
        e1?.type == e2?.type &&
        e1?.raiting == e2?.raiting &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        listEquality.equals(e1?.worker, e2?.worker) &&
        listEquality.equals(e1?.parentCat, e2?.parentCat) &&
        listEquality.equals(e1?.middleCat, e2?.middleCat) &&
        listEquality.equals(e1?.childCat, e2?.childCat) &&
        listEquality.equals(e1?.records, e2?.records) &&
        e1?.job == e2?.job &&
        e1?.jobStatus == e2?.jobStatus;
  }

  @override
  int hash(MastersRecord? e) => const ListEquality().hash([
        e?.title,
        e?.phone,
        e?.manager,
        e?.owner,
        e?.banner,
        e?.years,
        e?.description,
        e?.docs,
        e?.services,
        e?.radius,
        e?.workTime,
        e?.remotePrice,
        e?.adres,
        e?.remoteAdres,
        e?.type,
        e?.raiting,
        e?.reviews,
        e?.worker,
        e?.parentCat,
        e?.middleCat,
        e?.childCat,
        e?.records,
        e?.job,
        e?.jobStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is MastersRecord;
}
