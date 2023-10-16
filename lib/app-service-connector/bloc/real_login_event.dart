part of 'real_login_bloc.dart';

sealed class RealLoginEvent extends Equatable {
  const RealLoginEvent();
  @override
  List<Object> get props => [];
}

class RealmAppLogin extends RealLoginEvent {
  final String email;
  final String password;
  RealmAppLogin(this.email, this.password);
}

class RealmAppLogut extends RealLoginEvent{}
