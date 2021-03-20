
import 'package:task/model/model.dart';

import 'api_provider.dart';

class Repository {
  ApiProvider provider = ApiProvider();

  Future<Model> getAllData(Map<String, dynamic> map) =>
      provider.getAllData(map);

}
