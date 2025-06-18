import 'package:isar/isar.dart';
part 'job_data.g.dart';

@collection
class JobData {
  Id id = Isar.autoIncrement;

  late String title;
}
