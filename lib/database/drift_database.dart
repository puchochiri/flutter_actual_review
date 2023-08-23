import 'package:flutter_actual_review/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
// private값까지 불러올 수 있음
part 'drift_database.g.dart'; // part 파일 지정

@DriftDatabase(
  tables: [
    Schedules,
  ],
)

class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());


  Stream<List<Schedule>> watchSchedules(DateTime date) =>
      // 데이터를 조회하고 변화 감지
  (select(schedules).. where((tbl) => tbl.date.equals(date))).watch();

  // watchSchedules() 함수 아래에 작성
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  // createSchedule() 함수 아래에 작성
  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();


  // removeSchedule() 함수 아래에 작성
  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;




}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder  = await getApplicationDocumentsDirectory();
    final file      = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
