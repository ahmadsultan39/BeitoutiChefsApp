import 'package:beitouti_chefs/core/entities/category.dart';
import 'package:beitouti_chefs/features/show_menu/presentation/widgets/meal.dart';
import 'package:beitouti_chefs/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/loader.dart';
import '../bloc/show_menu_bloc.dart';
import '../bloc/show_menu_state.dart';

class CategoryExpansionTile extends StatefulWidget {
  final Category category;
  final ShowMenuBloc bloc;
  const CategoryExpansionTile(this.category, this.bloc , {Key? key}) : super(key: key);

  @override
  State<CategoryExpansionTile> createState() => _CategoryExpansionTileState();
}

class _CategoryExpansionTileState extends State<CategoryExpansionTile> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ShowMenuBloc, ShowMenuState>(
      bloc: widget.bloc,
      builder: (context, state) {
        return  Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 5),
                // constraints: BoxConstraints(maxHeight: 440.h),
                child: ExpansionTile(
                  onExpansionChanged: (open) {
                        if (open) {
                          widget.bloc.addGetCategoryMealsEvent(widget.category.id);
                        }
                  },
                  collapsedIconColor: theme.backgroundColor,
                  collapsedTextColor: theme.backgroundColor,
                  iconColor: theme.backgroundColor,
                  textColor: theme.backgroundColor,
                  title: Text(
                    widget.category.name,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: theme.backgroundColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      constraints: BoxConstraints(maxHeight: 400.h),

                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount:
                        widget.bloc.state.meals[widget.category.id]?.length ?? 0,
                        itemBuilder: (ctx, index) => MealTile(
                            widget.bloc.state.meals[widget.category.id]!
                                .elementAt(index),
                            widget.bloc),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
