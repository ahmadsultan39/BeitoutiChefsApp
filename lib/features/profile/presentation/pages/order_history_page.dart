import 'package:beitouti_chefs/core/widgets/loader.dart';
import 'package:beitouti_chefs/features/profile/presentation/bloc/profile.dart';
import 'package:beitouti_chefs/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/enums.dart';
import 'meals_notes_page.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final _bloc = sl<ProfileBloc>();

  final _controller = ScrollController();

  @override
  void initState() {
    _bloc.addGetOrdersHistoryEvent();
    _controller.addListener(
      () {
        if (_controller.position.pixels ==
            _controller.position.maxScrollExtent) {
          _bloc.addGetOrdersHistoryEvent();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      builder: (context, state) {
        WidgetsBinding.instance?.addPostFrameCallback(
          (_) => message(
            message: state.message,
            isError: state.error,
            bloc: _bloc,
            context: context,
          ),
        );
        return Scaffold(
          appBar: AppBar(
            title: const Text("سجل الطلبات"),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: [
                    ...state.preparedOrder.items.map(
                      (preparedOrder) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 15.h,
                        ),
                        child: Container(
                          width: 375.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 10),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NoteInfo(
                                    name: 'النوع', info: preparedOrder.type),
                                NoteInfo(
                                  name: 'تاريخ التحضير',
                                  info: preparedOrder.preparedAt!
                                          .substring(0, 10) +
                                      ' ' +
                                      preparedOrder.preparedAt!
                                          .substring(11, 16),
                                ),
                                NoteInfo(
                                  name: 'تم استلام ثمنه',
                                  info: preparedOrder.paidToChef == 1
                                      ? 'نعم'
                                      : 'لا',
                                ),
                                NoteInfo(
                                  name: 'تكلفة الوجبات',
                                  info: preparedOrder.mealsCost.toString() +
                                      " ل.س",
                                ),
                                NoteInfo(
                                  name: 'الحالة',
                                  info: orderStatusToMessage(
                                      preparedOrder.status),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    state.preparedOrder.isLoading
                        ? const Loader()
                        : Container(),
                  ],
                ),
              ),
              if (state.isLoading) const Loader()
            ],
          ),
        );
      },
    );
  }
}
