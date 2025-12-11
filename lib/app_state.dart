import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _firstTime = prefs.getBool('ff_firstTime') ?? _firstTime;
    });
    _safeInit(() {
      _accessToken = prefs.getString('ff_accessToken') ?? _accessToken;
    });
    _safeInit(() {
      _refreshToken = prefs.getString('ff_refreshToken') ?? _refreshToken;
    });
    _safeInit(() {
      _notifPermiss = prefs.getBool('ff_notifPermiss') ?? _notifPermiss;
    });
    _safeInit(() {
      _locationPermiss =
          prefs.getBool('ff_locationPermiss') ?? _locationPermiss;
    });
    _safeInit(() {
      _weeklyWorkSETTINGS = prefs
              .getStringList('ff_weeklyWorkSETTINGS')
              ?.map((x) {
                try {
                  return WeeklyWorkStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _weeklyWorkSETTINGS;
    });
    _safeInit(() {
      _bannerToMaster = prefs.getBool('ff_bannerToMaster') ?? _bannerToMaster;
    });
    _safeInit(() {
      _hourHeight = prefs.getInt('ff_hourHeight') ?? _hourHeight;
    });
    _safeInit(() {
      _workBanner = prefs.getBool('ff_workBanner') ?? _workBanner;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _firstTime = true;
  bool get firstTime => _firstTime;
  set firstTime(bool value) {
    _firstTime = value;
    prefs.setBool('ff_firstTime', value);
  }

  FilterDataStruct _mainFilter = FilterDataStruct.fromSerializableMap(
      jsonDecode('{\"userPoint\":\"0.0,0.0\",\"categories\":\"[]\"}'));
  FilterDataStruct get mainFilter => _mainFilter;
  set mainFilter(FilterDataStruct value) {
    _mainFilter = value;
  }

  void updateMainFilterStruct(Function(FilterDataStruct) updateFn) {
    updateFn(_mainFilter);
  }

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String value) {
    _accessToken = value;
    prefs.setString('ff_accessToken', value);
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String value) {
    _refreshToken = value;
    prefs.setString('ff_refreshToken', value);
  }

  bool _notifPermiss = false;
  bool get notifPermiss => _notifPermiss;
  set notifPermiss(bool value) {
    _notifPermiss = value;
    prefs.setBool('ff_notifPermiss', value);
  }

  bool _locationPermiss = false;
  bool get locationPermiss => _locationPermiss;
  set locationPermiss(bool value) {
    _locationPermiss = value;
    prefs.setBool('ff_locationPermiss', value);
  }

  DateTime? _choosenDate;
  DateTime? get choosenDate => _choosenDate;
  set choosenDate(DateTime? value) {
    _choosenDate = value;
  }

  DateTime? _choosenTime;
  DateTime? get choosenTime => _choosenTime;
  set choosenTime(DateTime? value) {
    _choosenTime = value;
  }

  String _choosenPlace = '';
  String get choosenPlace => _choosenPlace;
  set choosenPlace(String value) {
    _choosenPlace = value;
  }

  List<WorkSchedulleStruct> _precreateSchedulle = [];
  List<WorkSchedulleStruct> get precreateSchedulle => _precreateSchedulle;
  set precreateSchedulle(List<WorkSchedulleStruct> value) {
    _precreateSchedulle = value;
  }

  void addToPrecreateSchedulle(WorkSchedulleStruct value) {
    precreateSchedulle.add(value);
  }

  void removeFromPrecreateSchedulle(WorkSchedulleStruct value) {
    precreateSchedulle.remove(value);
  }

  void removeAtIndexFromPrecreateSchedulle(int index) {
    precreateSchedulle.removeAt(index);
  }

  void updatePrecreateSchedulleAtIndex(
    int index,
    WorkSchedulleStruct Function(WorkSchedulleStruct) updateFn,
  ) {
    precreateSchedulle[index] = updateFn(_precreateSchedulle[index]);
  }

  void insertAtIndexInPrecreateSchedulle(int index, WorkSchedulleStruct value) {
    precreateSchedulle.insert(index, value);
  }

  List<WeeklyWorkStruct> _weeklyWorkSETTINGS = [
    WeeklyWorkStruct.fromSerializableMap(jsonDecode(
        '{\"day\":\"Понедельник\",\"work\":\"true\",\"start\":\"1758603600000\",\"end\":\"1758646800000\"}')),
    WeeklyWorkStruct.fromSerializableMap(jsonDecode(
        '{\"day\":\"Вторник\",\"work\":\"true\",\"start\":\"1758603600000\",\"end\":\"1758646800000\"}')),
    WeeklyWorkStruct.fromSerializableMap(jsonDecode(
        '{\"day\":\"Среда\",\"work\":\"true\",\"start\":\"1758603600000\",\"end\":\"1758646800000\"}')),
    WeeklyWorkStruct.fromSerializableMap(jsonDecode(
        '{\"day\":\"Четверг\",\"work\":\"true\",\"start\":\"1758603600000\",\"end\":\"1758646800000\"}')),
    WeeklyWorkStruct.fromSerializableMap(jsonDecode(
        '{\"day\":\"Пятница\",\"work\":\"true\",\"start\":\"1758603600000\",\"end\":\"1758646800000\"}')),
    WeeklyWorkStruct.fromSerializableMap(jsonDecode(
        '{\"day\":\"Суббота\",\"work\":\"true\",\"start\":\"1758603600000\",\"end\":\"1758646800000\"}')),
    WeeklyWorkStruct.fromSerializableMap(jsonDecode(
        '{\"day\":\"Воскресенье\",\"work\":\"true\",\"start\":\"1758603600000\",\"end\":\"1758646800000\"}'))
  ];
  List<WeeklyWorkStruct> get weeklyWorkSETTINGS => _weeklyWorkSETTINGS;
  set weeklyWorkSETTINGS(List<WeeklyWorkStruct> value) {
    _weeklyWorkSETTINGS = value;
    prefs.setStringList(
        'ff_weeklyWorkSETTINGS', value.map((x) => x.serialize()).toList());
  }

  void addToWeeklyWorkSETTINGS(WeeklyWorkStruct value) {
    weeklyWorkSETTINGS.add(value);
    prefs.setStringList('ff_weeklyWorkSETTINGS',
        _weeklyWorkSETTINGS.map((x) => x.serialize()).toList());
  }

  void removeFromWeeklyWorkSETTINGS(WeeklyWorkStruct value) {
    weeklyWorkSETTINGS.remove(value);
    prefs.setStringList('ff_weeklyWorkSETTINGS',
        _weeklyWorkSETTINGS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromWeeklyWorkSETTINGS(int index) {
    weeklyWorkSETTINGS.removeAt(index);
    prefs.setStringList('ff_weeklyWorkSETTINGS',
        _weeklyWorkSETTINGS.map((x) => x.serialize()).toList());
  }

  void updateWeeklyWorkSETTINGSAtIndex(
    int index,
    WeeklyWorkStruct Function(WeeklyWorkStruct) updateFn,
  ) {
    weeklyWorkSETTINGS[index] = updateFn(_weeklyWorkSETTINGS[index]);
    prefs.setStringList('ff_weeklyWorkSETTINGS',
        _weeklyWorkSETTINGS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInWeeklyWorkSETTINGS(int index, WeeklyWorkStruct value) {
    weeklyWorkSETTINGS.insert(index, value);
    prefs.setStringList('ff_weeklyWorkSETTINGS',
        _weeklyWorkSETTINGS.map((x) => x.serialize()).toList());
  }

  List<CreateServiceStruct> _createdServices = [];
  List<CreateServiceStruct> get createdServices => _createdServices;
  set createdServices(List<CreateServiceStruct> value) {
    _createdServices = value;
  }

  void addToCreatedServices(CreateServiceStruct value) {
    createdServices.add(value);
  }

  void removeFromCreatedServices(CreateServiceStruct value) {
    createdServices.remove(value);
  }

  void removeAtIndexFromCreatedServices(int index) {
    createdServices.removeAt(index);
  }

  void updateCreatedServicesAtIndex(
    int index,
    CreateServiceStruct Function(CreateServiceStruct) updateFn,
  ) {
    createdServices[index] = updateFn(_createdServices[index]);
  }

  void insertAtIndexInCreatedServices(int index, CreateServiceStruct value) {
    createdServices.insert(index, value);
  }

  bool _bannerToMaster = true;
  bool get bannerToMaster => _bannerToMaster;
  set bannerToMaster(bool value) {
    _bannerToMaster = value;
    prefs.setBool('ff_bannerToMaster', value);
  }

  int _hourHeight = 300;
  int get hourHeight => _hourHeight;
  set hourHeight(int value) {
    _hourHeight = value;
    prefs.setInt('ff_hourHeight', value);
  }

  bool _workBanner = false;
  bool get workBanner => _workBanner;
  set workBanner(bool value) {
    _workBanner = value;
    prefs.setBool('ff_workBanner', value);
  }

  List<String> _testPhones = [
    '+79181010101',
    '+79092222222',
    '+79184444444',
    '+79186666666',
    '+79183333333',
    '+79181234567',
    '+79181111111',
    '+79185555555',
    '+79182323232',
    '+79182222222'
  ];
  List<String> get testPhones => _testPhones;
  set testPhones(List<String> value) {
    _testPhones = value;
  }

  void addToTestPhones(String value) {
    testPhones.add(value);
  }

  void removeFromTestPhones(String value) {
    testPhones.remove(value);
  }

  void removeAtIndexFromTestPhones(int index) {
    testPhones.removeAt(index);
  }

  void updateTestPhonesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    testPhones[index] = updateFn(_testPhones[index]);
  }

  void insertAtIndexInTestPhones(int index, String value) {
    testPhones.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
