import 'package:beitouti_chefs/core/widgets/loader.dart';
import 'package:beitouti_chefs/features/show_menu/presentation/widgets/category_expansion_tile.dart';
import 'package:beitouti_chefs/features/show_menu/presentation/widgets/meal.dart';
import 'package:beitouti_chefs/features/show_menu/presentation/widgets/meals_info_top_tile.dart';
import 'package:beitouti_chefs/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/show_menu.dart';

class ShowMenuPage extends StatelessWidget {
  const ShowMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = sl<ShowMenuBloc>();
    _bloc.addGetCategoriesEvent();
    _bloc.addGetActiveMealsCountEvent();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<ShowMenuBloc, ShowMenuState>(
        bloc: _bloc,
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 35),
                    MealsInfoTopTile(_bloc),
                    ..._bloc.state.categories
                        .map((e) => CategoryExpansionTile(e,_bloc)),
                  ],
                ),
              ),
              if (state.isLoading) Loader()
            ],
          );
        },
      ),
    );
  }
}
