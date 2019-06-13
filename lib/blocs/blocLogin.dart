import 'package:rxdart/rxdart.dart';
import 'package:artis_app/models/UserModel.dart';


class BlocLogin {

  BehaviorSubject<UserModel> _user = BehaviorSubject<UserModel>();
  BehaviorSubject<bool> _logged = BehaviorSubject<bool>.seeded(false);

  Observable<UserModel> get userLogged => _user.stream;
  Observable<bool> get isLogged => _logged.stream;

  Function(UserModel) get changeUser => _user.sink.add;
  Function(bool) get changeLogged => _logged.sink.add;

  void dispose() async {
    await _user.drain();
    _user.close();
    await _logged.drain();
    _logged.close();
  }
}

final blocLogin = BlocLogin();