import 'package:sommelio/models/token_model.dart';
import 'package:sommelio/models/user.dart';
import 'package:sommelio/providers/sommelio_provider.dart';

class Repository {
  final SommelioProvider sommelioProvider;
  Repository(this.sommelioProvider);

  Future<User> login(String username, String password) async {
    return sommelioProvider.login(username, password);
  }
}