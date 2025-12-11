import 'package:collection/collection.dart';

enum CurrentPage {
  main,
  records,
  profile,
  chats,
  work,
}

enum UserStatus {
  admin,
  user,
  manager,
  buisinesman,
  organization,
}

enum AdminMenu {
  profile,
  category,
  orders,
  money,
  chats,
}

enum RecordStatus {
  newREc,
  confirmed,
  denied,
  complete,
}

enum JobStatus {
  hasOffer,
  alone,
  worInOrg,
}

enum ServiceStatus {
  show,
  hide,
  denied,
}

enum ReportStatus {
  open,
  client,
  master,
  separete,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (CurrentPage):
      return CurrentPage.values.deserialize(value) as T?;
    case (UserStatus):
      return UserStatus.values.deserialize(value) as T?;
    case (AdminMenu):
      return AdminMenu.values.deserialize(value) as T?;
    case (RecordStatus):
      return RecordStatus.values.deserialize(value) as T?;
    case (JobStatus):
      return JobStatus.values.deserialize(value) as T?;
    case (ServiceStatus):
      return ServiceStatus.values.deserialize(value) as T?;
    case (ReportStatus):
      return ReportStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
