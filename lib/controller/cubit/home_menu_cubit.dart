import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_menu_state.dart';

class HomeMenuCubit extends Cubit<HomeMenuState> {
  HomeMenuCubit() : super(HomeMenuState(menuItem: 'Filmes'));

  void emitChangeMenuItem(String item) {
    emit(HomeMenuState(menuItem: item));
  }
}
