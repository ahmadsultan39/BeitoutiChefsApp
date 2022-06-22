import 'package:beitouti_chefs/features/show_menu/presentation/bloc/show_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsInfoTopTile extends StatelessWidget {
  final ShowMenuBloc bloc;

  const MealsInfoTopTile(this.bloc, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Text(
            "عدد الوجبات المفعلة : ${bloc.state.mealsInfo.activeMeals}/${bloc.state.mealsInfo.totalMeals}",
            style: TextStyle(fontSize: 14.sp, color: theme.backgroundColor),
          ),
          Spacer(),
          TextButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(theme.colorScheme.tertiary)),
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: theme.primaryColor,
              ),
              label: Text(
                "إضافة وجبة",
                style: TextStyle(color: theme.primaryColor, fontSize: 14.sp),
              ))
        ],
      ),
    );
  }
}
