part of 'adaptive_cubit.dart';

class AdaptiveState extends Equatable {
  const AdaptiveState({
    this.selectedNavigation = 0,
  });

  final int selectedNavigation;

  @override
  List<Object> get props => [
        selectedNavigation,
      ];

  AdaptiveState copyWith({
    int? selectedNavigation,
  }) =>
      AdaptiveState(
        selectedNavigation: selectedNavigation ?? this.selectedNavigation,
      );
}
