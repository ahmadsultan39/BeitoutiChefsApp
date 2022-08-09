import 'package:beitouti_chefs/core/widgets/loader.dart';
import 'package:beitouti_chefs/features/profile/presentation/widgets/chef_balance_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../injection.dart';
import '../bloc/profile.dart';

class ChefBalancePage extends StatefulWidget {
  const ChefBalancePage({Key? key}) : super(key: key);

  @override
  State<ChefBalancePage> createState() => _ChefBalancePageState();
}

class _ChefBalancePageState extends State<ChefBalancePage> {
  final _bloc = sl<ProfileBloc>();

  @override
  void initState() {
    _bloc.addGetChefBalanceEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("الرصيد"),
          ),
          body: Stack(
            children: [
              if (state.chefBalance != null)
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 15.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 5),
                                blurRadius: 10,
                              ),
                            ],
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'الرصيد الإجمالي: ',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                Text(
                                  state.chefBalance!.balance.toString() +
                                      " ل.س",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ChefBalanceItem(
                        received: state.chefBalance!.today.received,
                        ordersCount: state.chefBalance!.today.ordersCount,
                        balance: state.chefBalance!.today.balance,
                        title: 'اليوم',
                      ),
                      ChefBalanceItem(
                        received: state.chefBalance!.thisWeek.received,
                        ordersCount: state.chefBalance!.thisWeek.ordersCount,
                        balance: state.chefBalance!.thisWeek.balance,
                        title: 'هذا الأسبوع',
                      ),
                      ChefBalanceItem(
                        received: state.chefBalance!.thisMonth.received,
                        ordersCount: state.chefBalance!.thisMonth.ordersCount,
                        balance: state.chefBalance!.thisMonth.balance,
                        title: 'هذا الشهر',
                      ),
                    ],
                  ),
                ),
              state.isLoading ? const Loader() : Container(),
            ],
          ),
        );
      },
    );
  }
}
