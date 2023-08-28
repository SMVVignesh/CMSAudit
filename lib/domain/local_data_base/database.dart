import 'dart:io';
import 'package:cms_audit/core/utils/db_api_status.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

// flutter packages pub run build_runner build

/*
* This class represents the data base table for Api cache*/
@DataClassName("ApiDataTable")
class ApiData extends Table {
  DateTimeColumn get updatedDateAndTime => dateTime()();

  TextColumn get data => text()();

  TextColumn get tag => text()();

  @override
  Set<Column> get primaryKey => {tag};
}

/*
* This class represents the data base table for Api cache*/
@DataClassName("WHLocationTable")
class WHLocation extends Table {
  DateTimeColumn get updatedDateAndTime => dateTime()();

  TextColumn get locationId => text()();

  TextColumn get locationName => text()();

  TextColumn get palletNumber => text()();

  TextColumn get description => text()();

  TextColumn get auditDetailId => text()();

  TextColumn get apiStatus => text()();

  BoolColumn get isActive => boolean()();

  @override
  Set<Column> get primaryKey => {locationName, palletNumber, auditDetailId};
}

/*
* This class represents the data base table for Api cache*/
@DataClassName("WHInOutWardsTable")
class WHInOutWards extends Table {
  DateTimeColumn get updatedDateAndTime => dateTime()();

  TextColumn get inOutWardId => text()();

  IntColumn get qty => integer()();

  TextColumn get stockType => text()();

  TextColumn get description => text()();

  TextColumn get invoNo => text()();

  TextColumn get invoType => text()();

  TextColumn get invoDate => text()();

  TextColumn get customerName => text()();

  TextColumn get whLocationId => text()();

  TextColumn get productId => text()();

  TextColumn get productName => text()();

  TextColumn get auditDetailId => text()();

  TextColumn get apiStatus => text()();




  @override
  Set<Column> get primaryKey => {invoNo, inOutWardId, auditDetailId};
}

/*
* This class represents the data base table for Api cache*/
@DataClassName("WHAuditingTable")
class WHAuditing extends Table {
  DateTimeColumn get updatedDateAndTime => dateTime()();

  TextColumn get auditingId => text()();

  IntColumn get qty => integer()();

  IntColumn get bestBefore => integer()();

  TextColumn get stockType => text()();

  TextColumn get productQuality => text()();

  TextColumn get productId => text()();

  TextColumn get productName => text()();

  TextColumn get whLocationId => text()();

  TextColumn get auditDetailId => text()();

  TextColumn get description => text()();

  TextColumn get mfDate => text()();

  TextColumn get file => text()();

  TextColumn get apiStatus => text()();

  @override
  Set<Column> get primaryKey => {auditingId, auditDetailId};
}

/*
* This class represents Data base and their tables*/
@DriftDatabase(
    tables: [ApiData, WHLocation, WHInOutWards, WHAuditing], views: [])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 9;

  @override
  @DriftDatabase(tables: [ApiData, WHLocation, WHInOutWards, WHAuditing])
  MigrationStrategy get migration {
    return MigrationStrategy(onUpgrade: (_migrator, from, to) async {
      print("MigrationStrategy :: Triggered");
      for(var item in allTables){
        _migrator.drop(item);
        _migrator.create(item);
      }
    });
  }
}

/*
* This method will create the database with the given name*/
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
