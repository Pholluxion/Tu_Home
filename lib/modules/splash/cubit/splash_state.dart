part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  final String message;
  const SplashState({required this.message});
}

class SplashInitial extends SplashState {
  const SplashInitial() : super(message: 'Initial');
  @override
  List<Object> get props => [message];
}

class SplashLoading extends SplashState {
  const SplashLoading({required super.message});
  @override
  List<Object> get props => [message];

  SplashLoading copyWith({
    String? message,
  }) {
    return SplashLoading(
      message: message ?? this.message,
    );
  }
}

class SplashError extends SplashState {
  const SplashError({required super.message});
  @override
  List<Object> get props => [message];
}

class SplashLoaded extends SplashState {
  const SplashLoaded() : super(message: 'Loaded');
  @override
  List<Object> get props => [message];
}
