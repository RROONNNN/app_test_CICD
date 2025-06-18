import 'dart:async';

import 'package:isar/isar.dart';
import 'package:test_app/job_data.dart';

class HomeBloc {
  HomeBloc({required this.isar}) {
    _streamSubscription = isar.jobDatas
        .where()
        .watch(fireImmediately: true)
        .listen((event) {
          _streamController.add(event);
        });
  }

  final Isar isar;
  final _streamController = StreamController<List<JobData>>.broadcast();
  StreamSubscription? _streamSubscription;
  Stream<List<JobData>> get data => _streamController.stream;

  void close() {
    _streamSubscription?.cancel();
    _streamController.close();
    _streamSubscription = null;
  }
}
