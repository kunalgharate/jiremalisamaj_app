import 'package:bloc/bloc.dart';
import 'package:community_app/app_services.dart';
import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';

part 'real_login_event.dart';
part 'real_login_state.dart';

class RealLoginBloc extends Bloc<RealmLoginEvent, RealmLoginState> {
  final AppServices appServices;
  RealLoginBloc(this.appServices) : super(RealmLoginInitial()) {
    on<RealmAppLogin>((event, emit) async {
      emit(RealmLoginInitial());
      if (event is RealmAppLogin) {
        User user = await appServices.logInUserEmailPassword(
            event.email, event.password);
        emit(RealmLoginSuccess(user: user));
      } else if (event is RealmAppLogut) {
        await appServices.logOut();
        emit(RealmLoginFailed());
      }
    });
  }
}
