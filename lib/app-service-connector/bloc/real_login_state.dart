part of 'real_login_bloc.dart';

sealed class RealLoginState extends Equatable {
  const RealLoginState();

  @override
  List<Object> get props => [];
}

final class RealLoginInitial extends RealLoginState {}

final class RealLoginSuccess extends RealLoginState {
  final User user;
  RealLoginSuccess({required this.user});
}

final class RealLoginFailed extends RealLoginState {}
