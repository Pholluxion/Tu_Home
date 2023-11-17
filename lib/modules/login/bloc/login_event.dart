part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class CustomLoginEvent extends LoginEvent {
  const CustomLoginEvent();
}
