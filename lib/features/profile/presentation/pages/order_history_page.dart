import 'package:beitouti_chefs/features/profile/presentation/bloc/profile.dart';
import 'package:beitouti_chefs/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final _bloc = sl<ProfileBloc>();

  @override
  void initState() {
    _bloc.addGetOrdersHistoryEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
        );
      },
    );
  }
}
