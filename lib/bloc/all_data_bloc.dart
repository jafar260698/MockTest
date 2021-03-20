
import 'package:rxdart/rxdart.dart';
import 'package:task/model/model.dart';
import 'package:task/persistance/repository.dart';

class  AllDataBloc{
  Repository repository = Repository();

  final fetchData = PublishSubject<Model>();
  Stream<Model> get mapStream=>fetchData.stream;

  Map<String,dynamic> params=Map<String,dynamic>();

  fetchAllData() async{
    params["page"]=1;
    Model response=await repository.getAllData(params);
    fetchData.sink.add(response);
  }


  dispose() {
    fetchData.close();
  }
}

final allDataBloc =AllDataBloc();