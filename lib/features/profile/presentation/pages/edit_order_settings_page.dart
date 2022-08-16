import 'package:beitouti_chefs/core/util/constants.dart';
import 'package:beitouti_chefs/core/widgets/custom_loader.dart';
import 'package:beitouti_chefs/features/profile/presentation/bloc/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../injection.dart';

class EditOrderSettingsPage extends StatefulWidget {
  final ProfileBloc? profileBloc;

  const EditOrderSettingsPage({
    Key? key,
    this.profileBloc,
  }) : super(key: key);

  @override
  State<EditOrderSettingsPage> createState() => _EditOrderSettingsPageState();
}

class _EditOrderSettingsPageState extends State<EditOrderSettingsPage> {
  final _bloc = sl<ProfileBloc>();
  TextEditingController maxMealsController = TextEditingController();
  String? deliveryStartsAt;
  String? deliveryEndsAt;
  int? maxMealsPerDay;

  void save() {
    maxMealsController.text.trim();
    if (maxMealsController.text.isEmpty) {
      message(
          message: "العدد الأعظمي لا يجب أن يكون فارغ",
          isError: true,
          context: context,
          bloc: _bloc);
      return;
    }
    if (int.tryParse(maxMealsController.text) == null) {
      message(
          message: "العدد الأعظمي يجب أن يكون رقم",
          isError: true,
          context: context,
          bloc: _bloc);
      return;
    }
    maxMealsPerDay = int.parse(maxMealsController.text);
    if (!(deliveryStartsAt ==
            widget.profileBloc!.state.profile!.deliveryStartsAt &&
        deliveryEndsAt == widget.profileBloc!.state.profile!.deliveryEndsAt)) {
      _bloc.addEditDeliverMealTimeEvent(
          startsAt: deliveryStartsAt!, endsAt: deliveryEndsAt!);
    }
    if (maxMealsPerDay != widget.profileBloc!.state.profile!.maxMealsPerDay) {
      _bloc.addEditMaxMealsPerDayEvent(maxMealsPerDay: maxMealsPerDay!);
    }
  }

  @override
  void initState() {
    if (widget.profileBloc != null) {
      deliveryStartsAt = widget.profileBloc!.state.profile!.deliveryStartsAt;
      deliveryEndsAt = widget.profileBloc!.state.profile!.deliveryEndsAt;
      maxMealsPerDay = widget.profileBloc!.state.profile!.maxMealsPerDay;
      maxMealsController.text = maxMealsPerDay.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.pop) {
            widget.profileBloc!.addGetProfileEvent();
            Navigator.of(context).pop();
            _bloc.changePopStatus();
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
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: const Text("تعديل إعدادات الطلب"),
              actions: [
                IconButton(onPressed: save, icon: const Icon(Icons.save))
              ],
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("بداية وقت التوصيل"),
                            ),
                            DropdownButton<String>(
                              value: int.parse(
                                          deliveryStartsAt!.split(":").first) <=
                                      9
                                  ? deliveryStartsAt!.split(":").first[1]
                                  : deliveryStartsAt!.split(":").first,
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
                                  deliveryStartsAt = int.parse(newValue!) <= 9
                                      ? "0" + newValue + ":00:00"
                                      : newValue + ":00:00";
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("نهاية وقت التوصيل"),
                            ),
                            DropdownButton<String>(
                              value: deliveryEndsAt?.split(":").first,
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
                                  deliveryEndsAt = newValue! + ":00:00";
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          const Text("العدد الأعظمي للتحضير"),
                          SizedBox(
                            width: 35.w,
                            child: Container(
                              clipBehavior: Clip.none,
                              child: TextField(
                                controller: maxMealsController,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const Text("وجبة")
                        ],
                      ),
                    ],
                  ),
                ),
                if (state.isLoading) const Loader(),
              ],
            ),
          );
        },
      ),
    );
  }
}
