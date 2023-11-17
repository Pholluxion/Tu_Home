part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState({
    this.customProperty = 'Default Value',
  });

  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  SignupState copyWith({
    String? customProperty,
  }) {
    return SignupState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

class SignupInitial extends SignupState {
  const SignupInitial() : super();
}
