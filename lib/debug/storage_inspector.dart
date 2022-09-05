// ignore_for_file: depend_on_referenced_packages

import 'package:redpoint/database/database.dart';
import 'package:storage_inspector/storage_inspector.dart';
import 'package:drift_local_storage_inspector/drift_local_storage_inspector.dart';

Future<void> runStorageInspector(AppDatabase driftDb) async {
  final driver = StorageServerDriver(bundleId: 'com.example.redpoint');
  final sqlServer =
      DriftSQLDatabaseServer(id: "1", name: "SQL Server", database: driftDb);

  driver.addSQLServer(sqlServer);
  await driver.start();
}
