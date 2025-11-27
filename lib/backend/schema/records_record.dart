import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordsRecord extends FirestoreRecord {
  RecordsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "master" field.
  DocumentReference? _master;
  DocumentReference? get master => _master;
  bool hasMaster() => _master != null;

  // "organisation" field.
  DocumentReference? _organisation;
  DocumentReference? get organisation => _organisation;
  bool hasOrganisation() => _organisation != null;

  // "services" field.
  List<DocumentReference>? _services;
  List<DocumentReference> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "client" field.
  DocumentReference? _client;
  DocumentReference? get client => _client;
  bool hasClient() => _client != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "totalCost" field.
  int? _totalCost;
  int get totalCost => _totalCost ?? 0;
  bool hasTotalCost() => _totalCost != null;

  // "status" field.
  RecordStatus? _status;
  RecordStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "location" field.
  SearchPlaceStruct? _location;
  SearchPlaceStruct get location => _location ?? SearchPlaceStruct();
  bool hasLocation() => _location != null;

  // "revievs" field.
  DocumentReference? _revievs;
  DocumentReference? get revievs => _revievs;
  bool hasRevievs() => _revievs != null;

  // "createAt" field.
  DateTime? _createAt;
  DateTime? get createAt => _createAt;
  bool hasCreateAt() => _createAt != null;

  // "clientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  bool hasClientName() => _clientName != null;

  // "clientPhone" field.
  String? _clientPhone;
  String get clientPhone => _clientPhone ?? '';
  bool hasClientPhone() => _clientPhone != null;

  // "chatRecord" field.
  DocumentReference? _chatRecord;
  DocumentReference? get chatRecord => _chatRecord;
  bool hasChatRecord() => _chatRecord != null;

  // "reviewOnClient" field.
  DocumentReference? _reviewOnClient;
  DocumentReference? get reviewOnClient => _reviewOnClient;
  bool hasReviewOnClient() => _reviewOnClient != null;

  // "report" field.
  ReportStruct? _report;
  ReportStruct get report => _report ?? ReportStruct();
  bool hasReport() => _report != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _master = snapshotData['master'] as DocumentReference?;
    _organisation = snapshotData['organisation'] as DocumentReference?;
    _services = getDataList(snapshotData['services']);
    _client = snapshotData['client'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _duration = castToType<int>(snapshotData['duration']);
    _comment = snapshotData['comment'] as String?;
    _totalCost = castToType<int>(snapshotData['totalCost']);
    _status = snapshotData['status'] is RecordStatus
        ? snapshotData['status']
        : deserializeEnum<RecordStatus>(snapshotData['status']);
    _location = snapshotData['location'] is SearchPlaceStruct
        ? snapshotData['location']
        : SearchPlaceStruct.maybeFromMap(snapshotData['location']);
    _revievs = snapshotData['revievs'] as DocumentReference?;
    _createAt = snapshotData['createAt'] as DateTime?;
    _clientName = snapshotData['clientName'] as String?;
    _clientPhone = snapshotData['clientPhone'] as String?;
    _chatRecord = snapshotData['chatRecord'] as DocumentReference?;
    _reviewOnClient = snapshotData['reviewOnClient'] as DocumentReference?;
    _report = snapshotData['report'] is ReportStruct
        ? snapshotData['report']
        : ReportStruct.maybeFromMap(snapshotData['report']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('records');

  static Stream<RecordsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecordsRecord.fromSnapshot(s));

  static Future<RecordsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecordsRecord.fromSnapshot(s));

  static RecordsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecordsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecordsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecordsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecordsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecordsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecordsRecordData({
  String? title,
  DocumentReference? master,
  DocumentReference? organisation,
  DocumentReference? client,
  DateTime? date,
  int? duration,
  String? comment,
  int? totalCost,
  RecordStatus? status,
  SearchPlaceStruct? location,
  DocumentReference? revievs,
  DateTime? createAt,
  String? clientName,
  String? clientPhone,
  DocumentReference? chatRecord,
  DocumentReference? reviewOnClient,
  ReportStruct? report,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'master': master,
      'organisation': organisation,
      'client': client,
      'date': date,
      'duration': duration,
      'comment': comment,
      'totalCost': totalCost,
      'status': status,
      'location': SearchPlaceStruct().toMap(),
      'revievs': revievs,
      'createAt': createAt,
      'clientName': clientName,
      'clientPhone': clientPhone,
      'chatRecord': chatRecord,
      'reviewOnClient': reviewOnClient,
      'report': ReportStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "location" field.
  addSearchPlaceStructData(firestoreData, location, 'location');

  // Handle nested data for "report" field.
  addReportStructData(firestoreData, report, 'report');

  return firestoreData;
}

class RecordsRecordDocumentEquality implements Equality<RecordsRecord> {
  const RecordsRecordDocumentEquality();

  @override
  bool equals(RecordsRecord? e1, RecordsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.master == e2?.master &&
        e1?.organisation == e2?.organisation &&
        listEquality.equals(e1?.services, e2?.services) &&
        e1?.client == e2?.client &&
        e1?.date == e2?.date &&
        e1?.duration == e2?.duration &&
        e1?.comment == e2?.comment &&
        e1?.totalCost == e2?.totalCost &&
        e1?.status == e2?.status &&
        e1?.location == e2?.location &&
        e1?.revievs == e2?.revievs &&
        e1?.createAt == e2?.createAt &&
        e1?.clientName == e2?.clientName &&
        e1?.clientPhone == e2?.clientPhone &&
        e1?.chatRecord == e2?.chatRecord &&
        e1?.reviewOnClient == e2?.reviewOnClient &&
        e1?.report == e2?.report;
  }

  @override
  int hash(RecordsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.master,
        e?.organisation,
        e?.services,
        e?.client,
        e?.date,
        e?.duration,
        e?.comment,
        e?.totalCost,
        e?.status,
        e?.location,
        e?.revievs,
        e?.createAt,
        e?.clientName,
        e?.clientPhone,
        e?.chatRecord,
        e?.reviewOnClient,
        e?.report
      ]);

  @override
  bool isValidKey(Object? o) => o is RecordsRecord;
}
