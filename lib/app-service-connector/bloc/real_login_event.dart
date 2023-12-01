part of 'real_login_bloc.dart';

sealed class RealmLoginEvent extends Equatable {
  const RealmLoginEvent();
  @override
  List<Object> get props => [];
}

class RealmAppLogin extends RealmLoginEvent {
  final String email;
  final String password;
  RealmAppLogin(this.email, this.password);
}

class RealmAppLogut extends RealmLoginEvent{}
