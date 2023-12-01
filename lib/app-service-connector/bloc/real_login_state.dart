part of 'real_login_bloc.dart';

sealed class RealmLoginState extends Equatable {
  const RealmLoginState();

  @override
  List<Object> get props => [];
}
final class RealmLoginInitial extends RealmLoginState {}

final class RealmLoginSuccess extends RealmLoginState {
  final User user;
  const RealmLoginSuccess({required this.user});
}
final class RealmLoginFailed extends RealmLoginState {}
