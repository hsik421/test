import 'package:untitled/data/datasource/bitgetDataSource.dart';

class TimeRepository {
  final BitgetDataSource _bitgetDataSource = BitgetDataSource();

  Future<String> load() async {
    return _bitgetDataSource.getServerTime();
  }
}
