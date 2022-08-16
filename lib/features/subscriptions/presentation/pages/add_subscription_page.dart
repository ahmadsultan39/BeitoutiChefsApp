import 'package:beitouti_chefs/features/subscriptions/domain/entities/add_subscription_meal.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/entities/new_subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/use_cases/add_new_subscription.dart';
import 'package:beitouti_chefs/features/subscriptions/domain/use_cases/edit_subscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/widgets/custom_loader.dart';
import '../../../../injection.dart';
import '../bloc/subscriptions.dart';

class AddNewSubscriptionPage extends StatefulWidget {
  final NewSubscription? initSubscription;

  const AddNewSubscriptionPage({Key? key, this.initSubscription})
      : super(key: key);

  @override
  State<AddNewSubscriptionPage> createState() => _AddNewSubscriptionPageState();
}

class _AddNewSubscriptionPageState extends State<AddNewSubscriptionPage> {
  final _form = GlobalKey<FormState>();
  String? name;
  int daysNumber = 5;
  List<int> mealsIds = [];
  String? startsAt;
  String? mealDeliveryTime;
  int? maxSubscribers;
  int? mealsCost;
  final _bloc = sl<SubscriptionsBloc>();
  String? mealsCostError;
  String? maxSubscribersError;

  @override
  void initState() {
    _bloc.addGetChefMealsEvent();
    if (widget.initSubscription != null) {
      name = widget.initSubscription!.name;
      daysNumber = widget.initSubscription!.daysNumber;
      mealsIds = widget.initSubscription!.mealsIds;
      startsAt = widget.initSubscription!.startsAt + " 00:00:00";
      mealDeliveryTime = widget.initSubscription!.mealDeliveryTime;
      maxSubscribers = widget.initSubscription!.maxSubscribers;
      mealsCost = widget.initSubscription!.mealsCost;
    }
    super.initState();
  }

  bool saveForm() {
    if (mealsIds.length < daysNumber) {
      message(
          message: "عدد الوجبات غير كاف",
          context: context,
          bloc: _bloc,
          isError: true);
      return false;
    }
    if (mealsIds.length > daysNumber) {
      message(
          message: "عدد الوجبات أكبر من عدد الأيام",
          context: context,
          bloc: _bloc,
          isError: true);
      return false;
    }
    if (startsAt == null) {
      message(
          message: "الرجاء اختيار تاريخ بداية للاشتراك",
          context: context,
          bloc: _bloc,
          isError: true);
      return false;
    }
    if (mealDeliveryTime == null) {
      message(
          message: "الرجاء اختيار توقيت الوجبات",
          context: context,
          bloc: _bloc,
          isError: true);
      return false;
    }
    if (!_form.currentState!.validate()) return false;
    _form.currentState!.save();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<SubscriptionsBloc, SubscriptionsState>(
      bloc: _bloc,
      listener: (context,state) {
        if (state.popScreen){
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          message(
            message: state.message,
            isError: state.error,
            context: context,
            bloc: _bloc,
          );
        });
        return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.initSubscription == null
                    ? 'إضافة اشتراك'
                    : 'تعديل اشتراك',
              ),
            ),
            body: Stack(
              children: [
                if (!state.isLoading && state.meals.isNotEmpty)
                  Form(
                    key: _form,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            initialValue: name,
                            decoration: const InputDecoration(
                                labelText: 'اسم الاشتراك'),
                            validator: (value) {
                              value?.trim();
                              if (value == null || value.isEmpty) {
                                return "الاسم لا يجب أن يكون فارغ";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              value!.trim();
                              name = value;
                            },
                          ),
                          SizedBox(height: 8.h),
                          DropdownButton<String>(
                            value: daysNumber.toString(),
                            hint: const Text("عدد أيام الاشتراك"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: ["5", "7"].map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                daysNumber = int.parse(newValue!);
                              });
                            },
                          ),
                          SizedBox(height: 8.h),
                          TextButton.icon(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(Duration(days: 365)));
                                if (pickedDate != null) {
                                  setState(() {
                                    startsAt =
                                        pickedDate.toString().split(".").first;
                                  });

                                }
                              },
                              icon: const Icon(Icons.date_range),
                              label: const Text("اختر تاريخ بداية الاشتراك")),
                          SizedBox(height: 8.h),
                          if (startsAt != null) Text(startsAt!.split(" ").first),
                          SizedBox(height: 8.h),
                          SizedBox(
                            height: 250.h,
                            child: Row(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const Text("اختر وجبة لإضاقتها"),
                                      ...state.meals.map(
                                        (meal) => Row(
                                          children: [
                                            Text(meal.name),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    mealsIds.add(meal.id);
                                                  });
                                                },
                                                icon: const Icon(Icons.add))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const VerticalDivider(),
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const Text("ترتيب الوجبات"),
                                      ...mealsIds.map((mealId) {
                                        AddSubscriptionMeal meal = state.meals
                                            .firstWhere(
                                                (meal) => meal.id == mealId);
                                        return Row(
                                          children: [
                                            Text(meal.name),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    mealsIds.remove(meal.id);
                                                  });
                                                },
                                                icon: const Icon(Icons.close))
                                          ],
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          DropdownButton<String>(
                            value: mealDeliveryTime?.split(":").first,
                            hint: const Text("توقيت الوجبات"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: [
                              "1",
                              "2",
                              "3",
                              "4",
                              "5",
                              "6",
                              "7",
                              "8",
                              "9",
                              "10",
                              "11",
                              "12",
                              "13",
                              "14",
                              "15",
                              "16",
                              "17",
                              "18",
                              "19",
                              "20",
                              "21",
                              "22",
                              "23",
                              "24"
                            ].map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                mealDeliveryTime = newValue! + ":00:00";
                              });
                            },
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              const Text("السعر الإجمالي"),
                              SizedBox(
                                width: 125.w,
                                child: TextFormField(
                                  initialValue: mealsCost?.toString(),
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    value?.trim();
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        mealsCostError = "السعر لا يجب أن يكون فارغ";
                                      });
                                      return " ";
                                    }
                                    if (int.tryParse(value) == null) {
                                      setState(() {
                                        mealsCostError = "السعر يجب أن يكون رقم";
                                      });
                                      return " ";
                                    }
                                    setState(() {
                                      mealsCostError = null;
                                    });
                                    return null;
                                  },
                                  onSaved: (value) {
                                    value!.trim();
                                    mealsCost = int.parse(value);
                                  },
                                ),
                              ),
                              const Text("ل.س")
                            ],
                          ),
                          if(mealsCostError != null)
                            Text(mealsCostError!, style: TextStyle(color: Theme.of(context).errorColor),),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              const Text("عدد المشتركين الأعظمي"),
                              SizedBox(
                                width: 35.w,
                                child: TextFormField(
                                  initialValue: maxSubscribers?.toString(),
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    value?.trim();
                                    if (value == null || value.isEmpty) {
                                      setState(() {
                                        maxSubscribersError = "العدد الأعظمي لا يجب أن يكون فارغ";
                                      });
                                      return " ";
                                    }
                                    if (int.tryParse(value) == null) {
                                      setState(() {
                                        maxSubscribersError = "العدد الأعظمي يجب أن يكون رقم";
                                      });
                                      return " ";
                                    }
                                    setState(() {
                                      maxSubscribersError = null;
                                    });
                                    return null;
                                  },
                                  onSaved: (value) {
                                    value!.trim();
                                    if (value.isNotEmpty) {
                                      maxSubscribers = int.parse(value);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          if(maxSubscribersError != null)
                            Text(maxSubscribersError!, style: TextStyle(color: Theme.of(context).errorColor),),
                          SizedBox(height: 8.h),
                          Center(
                            child: SizedBox(
                              width: 300.w,
                              child: TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              theme.colorScheme.tertiary)),
                                  onPressed: () {
                                    if (saveForm()) {
                                      widget.initSubscription == null
                                          ? _bloc.addAddNewSubscriptionEvent(
                                              ParamsAddNewSubscriptionUseCase(
                                                  NewSubscription(
                                                      name!,
                                                      daysNumber,
                                                      mealsIds,
                                                      startsAt!,
                                                      mealDeliveryTime!,
                                                      maxSubscribers!,
                                                      mealsCost!,
                                                      null)))
                                          : _bloc.addEditSubscriptionEvent(
                                              ParamsEditSubscriptionUseCase(
                                                  NewSubscription(
                                                      name!,
                                                      daysNumber,
                                                      mealsIds,
                                                      startsAt!,
                                                      mealDeliveryTime!,
                                                      maxSubscribers!,
                                                      mealsCost!,
                                                      widget.initSubscription!
                                                          .id!)));
                                    }
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: theme.primaryColor,
                                  ),
                                  label: Text(
                                    widget.initSubscription == null
                                        ? "إضافة اشتراك"
                                        : 'تعديل اشتراك',
                                    style: TextStyle(
                                        color: theme.primaryColor,
                                        fontSize: 14.sp),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                if (state.isLoading) const Loader()
              ],
            ));
      },
    );
  }
}
