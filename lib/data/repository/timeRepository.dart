import 'package:untitled/data/datasource/timeDataSource.dart';
import 'package:untitled/data/model/timeModel.dart';

class TimeRepository{
  final TimeDataSource _timeDataSource = TimeDataSource();
  Future<String> load() async{
    return _timeDataSource.load();
  }
}