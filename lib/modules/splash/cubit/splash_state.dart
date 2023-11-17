part of 'splash_cubit.dart';

class SplashState extends Equatable {
  const SplashState({
    this.customProperty = 'Default Value',
  });

  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  SplashState copyWith({
    String? customProperty,
  }) {
    return SplashState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
