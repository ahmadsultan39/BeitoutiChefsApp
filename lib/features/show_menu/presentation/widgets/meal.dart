import 'package:beitouti_chefs/core/entities/meal.dart';
import 'package:beitouti_chefs/core/util/constants.dart';
import 'package:beitouti_chefs/core/util/generate_screen.dart';
import 'package:beitouti_chefs/core/widgets/loader.dart';
import 'package:beitouti_chefs/features/show_menu/presentation/bloc/show_menu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MealTile extends StatefulWidget {
  final Meal meal;
  final ShowMenuBloc bloc;

  const MealTile(this.meal, this.bloc, {Key? key}) : super(key: key);

  @override
  State<MealTile> createState() => _MealTileState();
}

class _MealTileState extends State<MealTile> {
  @override
  Widget build(BuildContext context) {
    bool? value = widget.meal.isAvailable;
    return BlocBuilder<ShowMenuBloc, ShowMenuState>(
      bloc: widget.bloc,
      builder: (context, state) {
        return ColorFiltered(
          colorFilter:
              (widget.meal.isApproved != null && !widget.meal.isApproved!)
                  ? const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.saturation,
                    )
                  : const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.saturation,
                    ),
          child: Center(
            child: Container(
              width: 360.w,
              margin: EdgeInsets.symmetric(vertical: 12.h),
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                elevation: 5,
                child: Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      extentRatio: 0.15,
                      dragDismissible: false,
                      children: [
                        Container(
                          height: double.infinity,
                          width: 360.w * 0.15,
                          color: Theme.of(context).backgroundColor,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    NameScreen.addMeal,
                                    arguments: widget.meal);
                              },
                              icon: const Icon(
                                Icons.edit,
                              )),
                        )
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      extentRatio: 0.15,
                      dragDismissible: false,
                      children: [
                        Container(
                          height: double.infinity,
                          width: 360.w * 0.15,
                          color: Theme.of(context).errorColor,
                          child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                widget.bloc.addDeleteMealEvent(
                                    widget.meal.id, widget.meal.categoryId);
                              },
                              icon: const Icon(
                                Icons.delete,
                              )),
                        )
                      ],
                    ),
                    child: Row(children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 75.w,
                        width: 75.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: CachedNetworkImage(
                          imageUrl: Endpoints.url + widget.meal.imageUrl,
                          fit: BoxFit.cover,
                          errorWidget: (ctx, _, error) =>
                              const Icon(Icons.error),
                          placeholder: (ctx, _) => const Loader(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.meal.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            widget.meal.discount == null ||
                                    widget.meal.discount == 0
                                ? Text(widget.meal.price.toString(),
                                    style: TextStyle(fontSize: 16.sp))
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          (widget.meal.price -
                                                  widget.meal.price *
                                                      widget.meal.discount!)
                                              .toString(),
                                          style: TextStyle(fontSize: 16.sp)),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(widget.meal.price.toString(),
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12.sp)),
                                    ],
                                  ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20.sp,
                                ),
                                if (widget.meal.rating != null)
                                  Text(
                                    widget.meal.rating.toString(),
                                    style: TextStyle(fontSize: 14.sp),
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Column(
                          children: [
                            Container(
                              width: 30,
                              child: SwitchListTile.adaptive(
                                activeColor:
                                    Theme.of(context).colorScheme.secondary,
                                value: value ?? false,
                                onChanged: (newValue) {
                                  if (widget.meal.isApproved != null &&
                                      widget.meal.isApproved!) {
                                    widget.bloc.addChangeMealAvailabilityEvent(
                                        widget.meal.id, widget.meal.categoryId);
                                    setState(() {
                                      value = !value!;
                                    });
                                  } else {
                                    message(

                                      message:
                                          "لا يمكن تغيير حالة الوجبة مالم تتم الموافقة عليها",
                                      context: context,
                                      isError: state.error,
                                      bloc: widget.bloc,
                                    );
                                  }
                                },
                              ),
                            ),
                            Container(
                              height: 35.h,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30.w,
                                    color: Theme.of(context).primaryColor,
                                    child: IconButton(
                                      onPressed: () {
                                        if (widget.meal.isApproved != null &&
                                            widget.meal.isApproved!) {
                                          widget.bloc
                                              .addIncreaseMaxMealNumberEvent(
                                                  widget.meal.id,
                                                  widget.meal.categoryId);
                                        } else {
                                          message(

                                            message:
                                                "لا يمكن تغيير حالة الوجبة مالم تتم الموافقة عليها",
                                            context: context,
                                            isError: state.error,
                                            bloc: widget.bloc,
                                          );
                                        }
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                      padding: const EdgeInsets.all(0),
                                    ),
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.h),
                                      child: Text(
                                        widget.meal.maxMeals.toString(),
                                        style: TextStyle(fontSize: 14.sp),
                                      )),
                                  Container(
                                    width: 30.w,
                                    color: Theme.of(context).primaryColor,
                                    child: IconButton(
                                      onPressed: () {
                                        if (widget.meal.isApproved != null &&
                                            widget.meal.isApproved!) {
                                          widget.bloc
                                              .addDecreaseMaxMealNumberEvent(
                                                  widget.meal.id,
                                                  widget.meal.categoryId);
                                        } else {
                                          message(
                                            message:
                                                "لا يمكن تغيير حالة الوجبة مالم تتم الموافقة عليها",
                                            context: context,
                                            isError: state.error,
                                            bloc: widget.bloc,
                                          );
                                        }
                                      },
                                      icon: Icon(Icons.remove,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      padding: const EdgeInsets.all(0),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ])),
              ),
            ),
          ),
        );
      },
    );
  }
}
