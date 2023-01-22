import 'package:financial_application/Consts/requests.dart';
import 'package:financial_application/Models/UserModel/user_model.dart';
import 'package:financial_application/Repository/dio_options.dart';

class Repository {

  static Future<List<UserModel>> getUsers() async {
    final res = await dio.get(
      Requests.getUsers,
    );
    return res.data.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }
  
}
