import 'package:sommelio/models/token_model.dart';
import 'package:sommelio/providers/sommelio_provider.dart';

class Repository {
  final SommelioProvider sommelioProvider;
  Repository(this.sommelioProvider);

  Future<void> login(String username, String password, context) async {
    return sommelioProvider.login(username, password, context);
  }
}