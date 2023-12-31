part of 'property_cubit.dart';

sealed class PropertyState extends Equatable {
  const PropertyState();

  @override
  List<Object> get props => [];
}

final class PropertyInitial extends PropertyState {}

final class PropertyLoading extends PropertyState {}

final class PropertyLoaded extends PropertyState {
  final Property property;
  final List<ImageModel> images;

  const PropertyLoaded({
    required this.property,
    this.images = const [],
  });

  @override
  List<Object> get props => [property];
}

final class PropertyError extends PropertyState {
  final String message;

  const PropertyError(this.message);

  @override
  List<Object> get props => [message];
}
