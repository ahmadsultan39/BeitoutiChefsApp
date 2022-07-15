import 'package:beitouti_chefs/features/subscriptions/domain/entities/new_subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/presentation/bloc/subscriptions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/util/generate_screen.dart';
import '../bloc/subscriptions_state.dart';

class SubscriptionTile extends StatelessWidget {
  final SubscriptionsBloc bloc;
  final Subscription subscription;

  const SubscriptionTile(
      {Key? key, required this.bloc, required this.subscription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionsBloc, SubscriptionsState>(
      bloc: bloc,
      builder: (context, state) {
        return Container(
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
                            Navigator.of(context)
                                .pushNamed(NameScreen.addSubscription,
                                    arguments: NewSubscription(
                                      subscription.name,
                                      subscription.daysNumber,
                                      [...subscription.meals.map((e) => e.id)],
                                      subscription.startsAt,
                                      subscription.mealDeliveryTime,
                                      subscription.maxSubscribers,
                                      subscription.mealsCost,
                                      subscription.id,
                                    ));
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
                            bloc.addDeleteSubscriptionsEvent(subscription.id);
                          },
                          icon: const Icon(
                            Icons.delete,
                          )),
                    )
                  ],
                ),
                child: Row(children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subscription.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("السعر : ${subscription.mealsCost}",
                            style: TextStyle(fontSize: 16.sp)),
                        Text("توقيت الوجبات : ${subscription.mealDeliveryTime}",
                            style: TextStyle(fontSize: 16.sp)),
                        Text(subscription.startsAt,
                            style: TextStyle(fontSize: 16.sp)),
                        Text("عدد الأيام : ${subscription.daysNumber}",
                            style: TextStyle(fontSize: 16.sp)),
                        Text(
                            "${subscription.maxSubscribers}/${subscription.currentSubscribers}",
                            style: TextStyle(fontSize: 16.sp)),
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
                            value: subscription.isAvailable,
                            onChanged: (newValue) {
                              bloc.addEditSubscriptionAvailabilityEvent(
                                  subscription.id);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ])),
          ),
        );
      },
    );
  }
}
