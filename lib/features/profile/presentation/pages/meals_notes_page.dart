import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return Container();
      },
    );
  }
}
