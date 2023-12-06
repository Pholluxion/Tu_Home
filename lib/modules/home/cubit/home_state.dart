part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<Contract> contracts;
  final List<ImageModel> images;
  final List<Property> properties;
  final List<Notification> notifications;

  const HomeLoaded({
    this.properties = const [],
    this.contracts = const [],
    this.images = const [],
    this.notifications = const [],
  });

  HomeLoaded copyWith({
    List<Contract>? contracts,
    List<ImageModel>? images,
    List<Property>? properties,
    List<Notification>? notifications,
  }) {
    return HomeLoaded(
      properties: properties ?? this.properties,
      contracts: contracts ?? this.contracts,
      images: images ?? this.images,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object> get props => [
        contracts,
        images,
        properties,
        notifications,
      ];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
