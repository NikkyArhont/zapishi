import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

LatLng parsCoordinate(dynamic latlngnJson) {
  // функция принимает json данные latlonJson {   "lat": 45.036035,   "lng": 38.97457060000001 } (Это был примерданных) в которых есть координаты, а возвращать должна тип данных LatLng
  if (latlngnJson != null && latlngnJson is Map<String, dynamic>) {
    double lat = latlngnJson['lat'] ?? 0.0;
    double lng = latlngnJson['lng'] ?? 0.0;
    return LatLng(lat, lng);
  } else {
    return LatLng(0.0, 0.0);
  }
}

int? summBalance(List<int>? listTrans) {
  // функция получает массив чисел listTrans и выдает их сумму
  if (listTrans == null || listTrans.isEmpty) {
    return null;
  }

  int sum = 0;
  for (int num in listTrans) {
    sum += num;
  }

  return sum;
}

List<SearchPlaceStruct>? parsPlaces(
  List<String>? city,
  List<String>? placeID,
  List<String>? placeDescription,
) {
// функция будет получать 2 массива строк city и place Id, и должна создать список из data type, куда последовательно впишет элементы из этих двух массивов данные из масива city запишет в поле placeTitle а placeId в placeid
  if (city == null ||
      placeID == null ||
      placeDescription == null ||
      city.length != placeID.length) {
    return null;
  }

  List<SearchPlaceStruct> searchPlaces = [];
  for (int i = 0; i < city.length; i++) {
    searchPlaces.add(SearchPlaceStruct(
        placeTitle: city[i],
        placeId: placeID[i],
        placeDescript: placeDescription[i]));
  }

  return searchPlaces;
}

bool? degreesToRadians(
  LatLng? userC,
  double? radius,
  LatLng? jobC,
) {
  // // функция должна проверить находится ли координата jobC на расстоянии radius в киллометрах  от координат userC. Не используй сторонние библиотеки
  if (userC == null || jobC == null || radius == null || radius < 0) {
    return null;
  }
  double _degreesToRadians(double degrees) => degrees * math.pi / 180;
  const double earthRadius = 6371; // Radius of the Earth in kilometers
  double dLat = _degreesToRadians(jobC.latitude - userC.latitude);
  double dLon = _degreesToRadians(jobC.longitude - userC.longitude);

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(_degreesToRadians(userC.latitude)) *
          math.cos(_degreesToRadians(jobC.latitude)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double distance = earthRadius * c; // Distance in kilometers

  return distance <= radius;
}

LatLng? reternZeroLoc() {
  // нужна фенкция которая просто возвращает координаты со значением 0, 0
  return const LatLng(0.0, 0.0);
}

int? checkChountServ(
  DocumentReference? serv,
  List<DocumentReference>? servList,
) {
  // функция должна посчитать сколько раз ссылка serv встречается в массиве servList и вернуть это колличество. Если ссылка ни разу не встречается вернуть 0
  if (serv == null || servList == null) return 0; // Check for null inputs
  return servList
      .where((s) => s == serv)
      .length; // Count occurrences of serv in servList
}

DateTime? combineDate(
  DateTime? date,
  DateTime? time,
) {
// функуция получает два параметра дат из одного берет дату из второго время и обхеденяет их
  if (date == null || time == null) return null; // Check for null values
  return DateTime(date.year, date.month, date.day, time.hour, time.minute,
      time.second); // Combine date and time
}

List<DateTime>? createCalendar(DateTime? selectedDate) {
  if (selectedDate == null) return null;

  const int cells = 35; // поменяйте на 42, если нужна 6-я строка
  // 1. Первый день месяца
  final firstOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);

  // 2. Сдвигаемся назад до понедельника (Monday = 1)
  final int daysBack = (firstOfMonth.weekday - DateTime.monday) % 7;
  final startDate = firstOfMonth.subtract(Duration(days: daysBack));

  // 3. Генерируем последовательность дат
  return List<DateTime>.generate(
    cells,
    (i) => startDate.add(Duration(days: i)),
  );
}

bool? sameMonth(
  DateTime? firstDate,
  DateTime? secondDate,
) {
  if (firstDate == null || secondDate == null) return null;

  return firstDate.year == secondDate.year &&
      firstDate.month == secondDate.month;
}

List<DateTime>? createMonth(DateTime? date) {
  if (date == null) return null; // стоп, если null

  // Сохраняем год и месяц в ненулевые переменные
  final int year = date.year;
  final int month = date.month;

  // Последний день месяца: день = 0 указывает на конец предыдущего месяца
  final int daysInMonth = DateTime(year, month + 1, 0).day;

  // Строим список от 1-го до последнего числа
  return List<DateTime>.generate(
    daysInMonth,
    (i) => DateTime(year, month, i + 1),
  );
}

List<DateTime>? createSchedule(
  DateTime? startDate,
  int? work,
  int? vaction,
) {
  if (startDate == null || work == null || vaction == null) return null;
  if (work <= 0 || vaction < 0) return null;

  // Конец «календарного года» — день-в-день через 1 год − 1 день
  final endDate = DateTime(startDate.year + 1, startDate.month, startDate.day)
      .subtract(const Duration(days: 1));

  final List<DateTime> result = [];
  DateTime cursor = startDate;

  while (!cursor.isAfter(endDate)) {
    // Рабочие дни
    for (var i = 0; i < work && !cursor.isAfter(endDate); i++) {
      result.add(cursor);
      cursor = cursor.add(const Duration(days: 1));
    }
    // Выходные дни
    cursor = cursor.add(Duration(days: vaction));
  }

  return result;
}

DateTime? mathCalendarMonth(
  DateTime? date,
  bool? operation,
) {
  if (date == null || operation == null) return null;

  // Смещение: +1 месяц, если true; –1 месяц, если false
  final int offset = operation ? 1 : -1;

  // Создаём новую дату, сохраняя номер дня; Dart сам скорректирует
  // если, например, 31-е числа нет в целевом месяце.
  return DateTime(date.year, date.month + offset, date.day);
}

DateTime? mathCalendarDay(
  DateTime? date,
  bool? operation,
) {
  if (date == null || operation == null) return null;

  // Смещение: +1 месяц, если true; –1 месяц, если false
  final int offset = operation ? 1 : -1;

  // Создаём новую дату, сохраняя номер дня; Dart сам скорректирует
  // если, например, 31-е числа нет в целевом месяце.
  return DateTime(date.year, date.month, date.day + offset);
}

List<WorkSchedulleStruct>? updateAppSchedulle(
  List<DateTime>? dates,
  DateTime? start,
  DateTime? end,
) {
  if (dates == null || start == null || end == null) return null;

  return dates.map((d) {
    // «Пришиваем» к каждой дате одинаковое время начала и конца
    final DateTime startDT =
        DateTime(d.year, d.month, d.day, start.hour, start.minute);
    final DateTime endDT =
        DateTime(d.year, d.month, d.day, end.hour, end.minute);

    return WorkSchedulleStruct(
      data: d,
      start: startDT,
      end: endDT,
      hasRecord: false,
    );
    // Если у вас сгенерирован helper, можно так:
    // return createWorkSchedulleStruct(data: d, start: startDT, end: endDT);
  }).toList();
}

List<WorkSchedulleStruct>? updateAppSchedulleEveryday(
  DateTime? firstDate,
  DateTime? startTime,
  DateTime? endTime,
) {
  if (firstDate == null || startTime == null || endTime == null) return null;

  // Дата окончания: ровно через 6 месяцев (тот же день) — не включаем.
  final endBoundary =
      DateTime(firstDate.year, firstDate.month + 1, firstDate.day);

  final int sHour = startTime.hour, sMin = startTime.minute;
  final int eHour = endTime.hour, eMin = endTime.minute;

  final List<WorkSchedulleStruct> result = [];
  DateTime cursor = firstDate;

  while (cursor.isBefore(endBoundary)) {
    result.add(
      WorkSchedulleStruct(
        data: cursor,
        start: DateTime(cursor.year, cursor.month, cursor.day, sHour, sMin),
        end: DateTime(cursor.year, cursor.month, cursor.day, eHour, eMin),
      ),
      // если у вас сгенерирована helper-функция:
      // createWorkSchedulleStruct(
      //   data: cursor,
      //   start: DateTime(cursor.year, cursor.month, cursor.day, sHour, sMin),
      //   end:   DateTime(cursor.year, cursor.month, cursor.day, eHour, eMin),
      // ),
    );
    cursor = cursor.add(const Duration(days: 1)); // следующий календарный день
  }

  return result;
}

List<WorkSchedulleStruct>? setWeeklyWork(
  DateTime? startDate,
  List<WeeklyWorkStruct>? weeklyPattern,
) {
  if (startDate == null || weeklyPattern == null) return null;

  // RU-день → weekday (1-7)
  const ruWeekday = <String, int>{
    'понедельник': DateTime.monday,
    'вторник': DateTime.tuesday,
    'среда': DateTime.wednesday,
    'четверг': DateTime.thursday,
    'пятница': DateTime.friday,
    'суббота': DateTime.saturday,
    'воскресенье': DateTime.sunday,
  };

  // шаблон недели: weekday → WeeklyWorkStruct
  final pattern = <int, WeeklyWorkStruct>{};
  for (final w in weeklyPattern) {
    final ru = w.day?.toLowerCase();
    final key = ru != null ? ruWeekday[ru] : null;
    if (key != null) pattern[key] = w;
  }

  final first = DateTime(startDate.year, startDate.month, startDate.day);
  final last = DateTime(first.year, first.month + 1, first.day); // +6 мес
  final result = <WorkSchedulleStruct>[];

  for (var cursor = first;
      !cursor.isAfter(last);
      cursor = cursor.add(const Duration(days: 1))) {
    final tmpl = pattern[cursor.weekday];

    // берём день, только если рабочий и заданы времена
    if (tmpl?.work == true && tmpl?.start != null && tmpl?.end != null) {
      final s = tmpl!.start!;
      final e = tmpl.end!;
      result.add(
        WorkSchedulleStruct(
          data: cursor,
          start:
              DateTime(cursor.year, cursor.month, cursor.day, s.hour, s.minute),
          end:
              DateTime(cursor.year, cursor.month, cursor.day, e.hour, e.minute),
        ),
      );
      // или createWorkSchedulleStruct(...) если генератор сделал helper
    }
  }
  return result;
}

List<DocumentReference> setListCat(
  DocumentReference first,
  DocumentReference second,
  DocumentReference third,
) {
  final list = <DocumentReference>[];

  list.add(first);
  list.add(second);
  list.add(third);

  // если все три были null — вернём null, иначе сам список
  return list;
}

List<DateTime> scheduleForRecord(
  List<WorkSchedulleStruct> schedulle,
  DateTime choosen,
  DateTime current,
  List<RecordsRecord>? records,
) {
// ---------- базовые даты без времени ---------------------------------
  final chooseD = DateTime(choosen.year, choosen.month, choosen.day);
  final today = DateTime(current.year, current.month, current.day);

  // ---------- ищем смену именно на chooseD ------------------------------
  WorkSchedulleStruct? entry;
  for (final w in schedulle) {
    final d = w.data?.toLocal();
    if (d != null &&
        d.year == chooseD.year &&
        d.month == chooseD.month &&
        d.day == chooseD.day) {
      entry = w;
      break;
    }
  }

  // ---------- если смены нет → вернуть «произвольный» слот -------------
  if (entry == null || entry.start == null || entry.end == null) {
    if (schedulle.isEmpty) return [];
    final first = schedulle.first;
    final fd = first.data?.toLocal() ?? current;
    final fs = first.start?.toLocal();
    return fs == null
        ? [fd]
        : [DateTime(fd.year, fd.month, fd.day, fs.hour, fs.minute)];
  }

  // ---------- начало / конец смены -------------------------------------
  final s = entry.start!.toLocal();
  final e = entry.end!.toLocal();
  DateTime startDT =
      DateTime(chooseD.year, chooseD.month, chooseD.day, s.hour, s.minute);
  DateTime endDT =
      DateTime(chooseD.year, chooseD.month, chooseD.day, e.hour, e.minute);
  if (!endDT.isAfter(startDT))
    endDT = endDT.add(const Duration(days: 1)); // ночная

  // ---------- округление вверх до 00 / 30 мин ---------------------------
  DateTime ceil30(DateTime t) {
    final add = (t.minute % 30 == 0 && t.second == 0 && t.millisecond == 0)
        ? 0
        : 30 - (t.minute % 30);
    return DateTime(t.year, t.month, t.day, t.hour, t.minute)
        .add(Duration(minutes: add));
  }

  // ---------- точка старта генерации слотов -----------------------------
  DateTime begin;
  final isToday = chooseD.isAtSameMomentAs(today);
  if (isToday) {
    begin = ceil30(current.toLocal());
    if (begin.isBefore(startDT)) begin = ceil30(startDT);
  } else {
    begin = ceil30(startDT);
    if (choosen.isAfter(startDT) && choosen.isBefore(endDT)) {
      final alt = ceil30(choosen.toLocal());
      if (alt.isAfter(begin)) begin = alt;
    }
  }

  // ---------- генерируем все 30-минутные слоты --------------------------
  const step = Duration(minutes: 30);
  final slots = <DateTime>[];
  var cursor = begin;
  while (!cursor.add(step).isAfter(endDT)) {
    slots.add(cursor);
    cursor = cursor.add(step);
  }

  // ---------- вычитаем занятые интервалы из records ---------------------
  if (records != null && records.isNotEmpty) {
    final occupied = <DateTime>{};
    for (final r in records) {
      final rs = r.date?.toLocal();
      final dur = r.duration ?? 0;
      if (rs == null || dur <= 0) continue;
      if (rs.year != chooseD.year ||
          rs.month != chooseD.month ||
          rs.day != chooseD.day) continue;

      final re = rs.add(Duration(minutes: dur));
      for (final sl in slots) {
        final slEnd = sl.add(step);
        final overlap = sl.isBefore(re) && slEnd.isAfter(rs);
        if (overlap) occupied.add(sl);
      }
    }
    slots.removeWhere((dt) => occupied.contains(dt));
  }

  return slots; // может быть [], если всё занято
}

DateTime? plus30minutes(DateTime? date) {
  if (date == null) return null;
  return date.add(const Duration(minutes: 30));
}

List<DateTime>? createDayPlaner(
  List<WorkSchedulleStruct>? schedulle,
  DateTime? choosenDay,
) {
  // защита от пустых аргументов
  if (schedulle == null || choosenDay == null) return [];

  // календарная дата без времени
  final base = DateTime(choosenDay.year, choosenDay.month, choosenDay.day);

  // ищем смену именно на эту дату
  WorkSchedulleStruct? entry;
  for (final w in schedulle) {
    final d = w.data?.toLocal();
    if (d != null &&
        d.year == base.year &&
        d.month == base.month &&
        d.day == base.day) {
      entry = w;
      break;
    }
  }
  // если нет смены – вернуть пустой список
  if (entry == null || entry.start == null || entry.end == null) return [];

  // собираем начало / конец смены
  final s = entry.start!.toLocal();
  final e = entry.end!.toLocal();

  DateTime startDT =
      DateTime(base.year, base.month, base.day, s.hour, s.minute);
  DateTime endDT = DateTime(base.year, base.month, base.day, e.hour, e.minute);

  // если ночная (end ≤ start) – считаем, что нет слотов в пределах дня
  if (!endDT.isAfter(startDT)) return [];

  // первый полный час (если минута > 0 – начинаем со следующего часа)
  int firstHour = startDT.minute == 0 ? startDT.hour : startDT.hour + 1;
  // последний час *не включаем* (без последнего часа)
  int lastHour = endDT.hour; // 14:00 → 14 не включаем

  if (firstHour >= lastHour) return [];

  final results = <DateTime>[];
  for (int h = firstHour; h < lastHour; h++) {
    results.add(DateTime(base.year, base.month, base.day, h));
  }
  return results;
}

List<PlanerDataMasterStruct>? createPlanerMaster(
  List<RecordsRecord>? records,
  List<WorkSchedulleStruct>? workSchedulle,
  DateTime? selectedDay,
) {
  if (records == null ||
      records.isEmpty ||
      workSchedulle == null ||
      selectedDay == null) {
    return [];
  }

  final List<PlanerDataMasterStruct> result = [];
  final int selectedWeekday = selectedDay.weekday;

  // ищем нужный рабочий день по полю "data"
  final WorkSchedulleStruct? work = workSchedulle.firstWhere(
    (w) => w.data?.weekday == selectedWeekday,
    orElse: () => WorkSchedulleStruct(),
  );

  final DateTime? workStartRaw = work?.start;
  final DateTime? workEndRaw = work?.end;
  if (workStartRaw == null || workEndRaw == null) return [];

  // нормализуем рабочее время под выбранную дату
  final workStart = DateTime(
    selectedDay.year,
    selectedDay.month,
    selectedDay.day,
    workStartRaw.hour,
    workStartRaw.minute,
  );
  final workEnd = DateTime(
    selectedDay.year,
    selectedDay.month,
    selectedDay.day,
    workEndRaw.hour,
    workEndRaw.minute,
  );

  // фильтруем записи выбранного дня
  final dayRecords = records.asMap().entries.where((entry) {
    final r = entry.value;
    return r.date != null &&
        r.date!.year == selectedDay.year &&
        r.date!.month == selectedDay.month &&
        r.date!.day == selectedDay.day;
  }).toList();

  if (dayRecords.isEmpty) {
    // если нет записей — один пустой блок на весь день
    result.add(PlanerDataMasterStruct(
      emptyHeight: (workEnd.difference(workStart).inMinutes * 5).toInt(),
      recordHeight: 0,
      recordRef: null,
    ));
    return result;
  }

  // сортируем по времени начала записи
  dayRecords.sort((a, b) => a.value.date!.compareTo(b.value.date!));

  DateTime currentTime = workStart;

  for (final entry in dayRecords) {
    final int index = entry.key;
    final RecordsRecord record = entry.value;

    // нормализуем время записи под выбранную дату
    final recStart = DateTime(
      selectedDay.year,
      selectedDay.month,
      selectedDay.day,
      record.date!.hour,
      record.date!.minute,
    );
    final int durationMinutes = record.duration ?? 0;
    final recEnd = recStart.add(Duration(minutes: durationMinutes));

    // если запись начинается после текущего времени — добавляем пустоту
    if (recStart.isAfter(currentTime)) {
      final emptyMinutes = recStart.difference(currentTime).inMinutes;
      if (emptyMinutes > 0) {
        result.add(PlanerDataMasterStruct(
          emptyHeight: (emptyMinutes * 5).toInt(),
          recordHeight: 0,
          recordRef: null,
        ));
      }
    }

    // если запись выходит за пределы рабочего дня — обрезаем
    final clippedEnd = recEnd.isAfter(workEnd) ? workEnd : recEnd;
    final actualMinutes =
        clippedEnd.difference(recStart).inMinutes.clamp(0, durationMinutes);

    if (actualMinutes > 0) {
      result.add(PlanerDataMasterStruct(
        emptyHeight: 0,
        recordHeight: (actualMinutes * 5).toInt(),
        recordRef: index,
      ));
    }

    currentTime = clippedEnd;
    if (currentTime.isAfter(workEnd)) break;
  }

  // добавляем пробел после последней записи, если остался
  if (currentTime.isBefore(workEnd)) {
    final emptyMinutes = workEnd.difference(currentTime).inMinutes;
    if (emptyMinutes > 0) {
      result.add(PlanerDataMasterStruct(
        emptyHeight: (emptyMinutes * 5).toInt(),
        recordHeight: 0,
        recordRef: null,
      ));
    }
  }

  return result;
}

int? pinNumbers(
  DateTime? choosenDay,
  List<WorkSchedulleStruct>? scheddule,
  DateTime? time,
) {
  if (choosenDay == null ||
      scheddule == null ||
      scheddule.isEmpty ||
      time == null) {
    return 0;
  }

  // находим расписание выбранного дня
  final WorkSchedulleStruct? work = scheddule.firstWhere(
    (w) =>
        w.data?.year == choosenDay.year &&
        w.data?.month == choosenDay.month &&
        w.data?.day == choosenDay.day,
    orElse: () => WorkSchedulleStruct(),
  );

  final DateTime? start = work?.start;
  final DateTime? end = work?.end;
  if (start == null || end == null) return 0;

  // если время до начала рабочего дня → иголка вверху
  if (time.isBefore(start)) return 0;

  // если время после конца рабочего дня → иголка внизу
  if (time.isAfter(end)) {
    final totalMinutes = end.difference(start).inMinutes;
    return (totalMinutes * 5).toInt(); // 60 мин = 300 px => 1 мин = 5 px
  }

  // иначе считаем смещение в пикселях от начала дня
  final minutesPassed = time.difference(start).inMinutes;
  final offset = (minutesPassed * 5).toInt();

  return offset;
}

List<PlanerDataOrganisationStruct>? organisationPlaner(
  List<RecordsRecord>? records,
  List<WorkSchedulleStruct>? workTime,
  DateTime? choosenDay,
) {
  if (records == null ||
      records.isEmpty ||
      workTime == null ||
      choosenDay == null) {
    return [];
  }

  // Находим рабочий день по точной дате
  final WorkSchedulleStruct work = workTime.firstWhere(
    (w) =>
        w.data?.year == choosenDay.year &&
        w.data?.month == choosenDay.month &&
        w.data?.day == choosenDay.day,
    orElse: () => WorkSchedulleStruct(),
  );

  final DateTime? startRaw = work.start;
  final DateTime? endRaw = work.end;
  if (startRaw == null || endRaw == null) return [];

  // Нормализуем рамки дня к выбранной дате
  final start = DateTime(choosenDay.year, choosenDay.month, choosenDay.day,
      startRaw.hour, startRaw.minute);
  final end = DateTime(choosenDay.year, choosenDay.month, choosenDay.day,
      endRaw.hour, endRaw.minute);
  if (!end.isAfter(start)) return [];

  // Берём только записи выбранной даты И попадающие во временной интервал рабочего дня
  final entries = records.asMap().entries.where((e) {
    final d = e.value.date;
    if (d == null) return false;
    if (d.year != choosenDay.year ||
        d.month != choosenDay.month ||
        d.day != choosenDay.day) return false;

    // Время записи в рамках выбранного дня
    final s = DateTime(
        choosenDay.year, choosenDay.month, choosenDay.day, d.hour, d.minute);
    return !s.isBefore(start) && s.isBefore(end);
  }).toList();

  if (entries.isEmpty) {
    // Полностью пустой день — один элемент-хвост
    return [
      PlanerDataOrganisationStruct(
        emptyHeight: (end.difference(start).inMinutes * 5).toInt(),
        recordHeight: 0,
        recordsRef: const [],
        recordIndex: const [],
      )
    ];
  }

  // Группируем по точному старту (час:мин) на дате choosenDay
  final Map<String, List<MapEntry<int, RecordsRecord>>> grouped = {};
  for (final e in entries) {
    final d = e.value.date!;
    final key = '${d.hour}:${d.minute.toString().padLeft(2, '0')}';
    (grouped[key] ??= []).add(e);
  }

  // Сортируем ключи по времени
  final keys = grouped.keys.toList()
    ..sort((a, b) {
      final ap = a.split(':').map(int.parse).toList();
      final bp = b.split(':').map(int.parse).toList();
      final at = DateTime(
          choosenDay.year, choosenDay.month, choosenDay.day, ap[0], ap[1]);
      final bt = DateTime(
          choosenDay.year, choosenDay.month, choosenDay.day, bp[0], bp[1]);
      return at.compareTo(bt);
    });

  final result = <PlanerDataOrganisationStruct>[];
  DateTime cursor = start;

  for (final k in keys) {
    final parts = k.split(':').map(int.parse).toList();
    final blockStart = DateTime(
        choosenDay.year, choosenDay.month, choosenDay.day, parts[0], parts[1]);

    // Пустота до блока
    int emptyPx = 0;
    if (blockStart.isAfter(cursor)) {
      final gapMin = blockStart.difference(cursor).inMinutes;
      if (gapMin > 0) emptyPx = (gapMin * 5).toInt();
    }

    // Записи этого блока
    final block = grouped[k]!;
    final idxs = block.map((e) => e.key).toList();
    final refs = block.map((e) => e.value.reference).toList();

    // ОДИН элемент: пустота + сам блок фикс 150 px + индексы
    result.add(PlanerDataOrganisationStruct(
      emptyHeight: emptyPx,
      recordHeight: 150, // 30 мин = 150 px
      recordsRef: refs,
      recordIndex: idxs,
    ));

    // Сдвигаем курсор на конец 30-минутного слота
    final next = blockStart.add(const Duration(minutes: 30));
    if (next.isAfter(cursor)) cursor = next;
    if (!cursor.isBefore(end)) break;
  }

  // Хвост после последнего блока
  if (cursor.isBefore(end)) {
    final tailMin = end.difference(cursor).inMinutes;
    if (tailMin > 0) {
      result.add(PlanerDataOrganisationStruct(
        emptyHeight: (tailMin * 5).toInt(),
        recordHeight: 0,
        recordsRef: const [],
        recordIndex: const [],
      ));
    }
  }

  return result;
}

double? getRaiting(List<ReviewsRecord>? reviews) {
  if (reviews == null || reviews.isEmpty) {
    return 0;
  }

  double total = 0;
  for (final review in reviews) {
    total += review.star ?? 0;
  }

  return total / reviews.length;
}
