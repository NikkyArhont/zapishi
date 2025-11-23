import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "record" field.
  DocumentReference? _record;
  DocumentReference? get record => _record;
  bool hasRecord() => _record != null;

  // "messages" field.
  List<DocumentReference>? _messages;
  List<DocumentReference> get messages => _messages ?? const [];
  bool hasMessages() => _messages != null;

  // "lastMessage" field.
  DocumentReference? _lastMessage;
  DocumentReference? get lastMessage => _lastMessage;
  bool hasLastMessage() => _lastMessage != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "lastMessageSeenBy" field.
  List<DocumentReference>? _lastMessageSeenBy;
  List<DocumentReference> get lastMessageSeenBy =>
      _lastMessageSeenBy ?? const [];
  bool hasLastMessageSeenBy() => _lastMessageSeenBy != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "lastMessageText" field.
  String? _lastMessageText;
  String get lastMessageText => _lastMessageText ?? '';
  bool hasLastMessageText() => _lastMessageText != null;

  // "lastMessageSender" field.
  DocumentReference? _lastMessageSender;
  DocumentReference? get lastMessageSender => _lastMessageSender;
  bool hasLastMessageSender() => _lastMessageSender != null;

  void _initializeFields() {
    _record = snapshotData['record'] as DocumentReference?;
    _messages = getDataList(snapshotData['messages']);
    _lastMessage = snapshotData['lastMessage'] as DocumentReference?;
    _members = getDataList(snapshotData['members']);
    _lastMessageSeenBy = getDataList(snapshotData['lastMessageSeenBy']);
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _lastMessageText = snapshotData['lastMessageText'] as String?;
    _lastMessageSender =
        snapshotData['lastMessageSender'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  DocumentReference? record,
  DocumentReference? lastMessage,
  DateTime? lastMessageTime,
  String? lastMessageText,
  DocumentReference? lastMessageSender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'record': record,
      'lastMessage': lastMessage,
      'last_message_time': lastMessageTime,
      'lastMessageText': lastMessageText,
      'lastMessageSender': lastMessageSender,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.record == e2?.record &&
        listEquality.equals(e1?.messages, e2?.messages) &&
        e1?.lastMessage == e2?.lastMessage &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.lastMessageSeenBy, e2?.lastMessageSeenBy) &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.lastMessageText == e2?.lastMessageText &&
        e1?.lastMessageSender == e2?.lastMessageSender;
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([
        e?.record,
        e?.messages,
        e?.lastMessage,
        e?.members,
        e?.lastMessageSeenBy,
        e?.lastMessageTime,
        e?.lastMessageText,
        e?.lastMessageSender
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
