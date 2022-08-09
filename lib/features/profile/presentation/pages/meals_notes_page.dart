import 'package:beitouti_chefs/core/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../injection.dart';
import '../bloc/profile.dart';

class MealsNotesPage extends StatefulWidget {
  const MealsNotesPage({Key? key}) : super(key: key);

  @override
  State<MealsNotesPage> createState() => _MealsNotesPageState();
}

class _MealsNotesPageState extends State<MealsNotesPage> {
  final _bloc = sl<ProfileBloc>();

  @override
  void initState() {
    _bloc.addGetOrderMealsNotesEvent();
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
            title: const Text("الملاحظات"),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ...state.orderMealsNotes.map(
                      (notes) => Padding(
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
                                NoteInfo(name: 'اسم الوجبة', info: notes.name),
                                NoteInfo(
                                  name: 'تاريخ التحضير',
                                  info: notes.preparedAt.substring(0, 10) +
                                      ' ' +
                                      notes.preparedAt.substring(11, 16),
                                ),
                                NoteInfo(
                                  name: 'التقييم',
                                  info: notes.mealRate!.round().toString() + ' نجوم',
                                ),
                                if(notes.mealRateNotes != null)
                                NoteInfo(
                                  name: 'الملاحظات',
                                  info: notes.mealRateNotes!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (state.isLoading) const Loader(),
            ],
          ),
        );
      },
    );
  }
}

class NoteInfo extends StatelessWidget {
  final String name;
  final String info;

  const NoteInfo({
    Key? key,
    required this.name,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: 10.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$name:  ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),
          Text(
            info,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}
