part of 'home_menu_cubit.dart';

class HomeMenuState extends Equatable {
  String menuItem;
  HomeMenuState({
    required this.menuItem,
  });

  @override
  List<Object?> get props => [menuItem];
}
