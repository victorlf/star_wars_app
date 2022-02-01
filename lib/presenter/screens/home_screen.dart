import 'package:escribo_star_wars/constants/enums.dart';
import 'package:escribo_star_wars/controller/cubit/api_cubit.dart';
import 'package:escribo_star_wars/controller/cubit/home_menu_cubit.dart';
import 'package:escribo_star_wars/core/themes/app_progress_indicator.dart';
import 'package:escribo_star_wars/core/themes/size_config.dart';
import 'package:escribo_star_wars/data/models/character_model.dart';
import 'package:escribo_star_wars/data/models/movie_model.dart';
import 'package:escribo_star_wars/presenter/widgets/home_app_bar.dart';
import 'package:escribo_star_wars/presenter/widgets/list_item.dart';
import 'package:escribo_star_wars/presenter/widgets/menu_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<ApiCubit>().getAllMovies();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        context.read<ApiCubit>().getAllCharacters();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return SafeArea(
        child: Scaffold(
      appBar: const HomeAppBar(),
      body: Container(
        height: SizeConfig.height,
        width: SizeConfig.width,
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 30.0),
        child: BlocConsumer<HomeMenuCubit, HomeMenuState>(
          listener: (context, state) {
            if (state.menuItem == 'Filmes') {
              context.read<ApiCubit>().getAllMovies();
            } else if (state.menuItem == 'Personagens') {
              context.read<ApiCubit>().getAllCharacters();
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuButton(
                      text: 'Filmes',
                      isSelected: state.menuItem == 'Filmes',
                      selectMenuItem:
                          context.read<HomeMenuCubit>().emitChangeMenuItem,
                      selectedBorderColor: Colors.redAccent,
                    ),
                    MenuButton(
                      text: 'Personagens',
                      isSelected: state.menuItem == 'Personagens',
                      selectMenuItem:
                          context.read<HomeMenuCubit>().emitChangeMenuItem,
                      selectedBorderColor: Colors.greenAccent,
                    ),
                    MenuButton(
                      text: 'Favoritos',
                      isSelected: state.menuItem == 'Favoritos',
                      selectMenuItem:
                          context.read<HomeMenuCubit>().emitChangeMenuItem,
                      selectedBorderColor: Colors.yellowAccent,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.height * 0.05,
                ),
                Expanded(
                  child: BlocBuilder<ApiCubit, ApiState>(
                    builder: (context, state) {
                      if (state is ApiLoading) {
                        return const AppProgressIndicator();
                      } else if (state is ApiError) {
                        return const Center(child: Text('Error'));
                      } else if (state is ApiSuccess) {
                        if (state.dataType == DataType.Movie) {
                          List<MovieModel> list = state.moviesList!;
                          return ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return ListItem(
                                    text: list[index].title, index: index);
                              });
                        } else {
                          List<CharacterModel> list = state.charactersList!;
                          return Stack(
                            children: [
                              ListView.builder(
                                  controller: _scrollController,
                                  itemCount: list.length,
                                  itemBuilder: (context, index) {
                                    return ListItem(
                                        text: list[index].name, index: index);
                                  }),
                              if (context
                                  .read<ApiCubit>()
                                  .isLoagingRestOfCharacters)
                                Positioned(
                                    left: 150,
                                    bottom: 0,
                                    child: AppProgressIndicator()),
                            ],
                          );
                        }
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height * 0.05,
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
