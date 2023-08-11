import 'dart:io';
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
* This class represents Data base and their tables*/
@DriftDatabase(tables: [ApiData], views: [])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy();
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
