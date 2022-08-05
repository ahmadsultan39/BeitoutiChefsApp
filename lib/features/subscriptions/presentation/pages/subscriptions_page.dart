import 'package:beitouti_chefs/core/widgets/custom_loader.dart';
import 'package:beitouti_chefs/features/subscriptions/presentation/bloc/subscriptions_bloc.dart';
import 'package:beitouti_chefs/features/subscriptions/presentation/widgets/subscription_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/generate_screen.dart';
import '../../../../injection.dart';
import '../bloc/subscriptions_state.dart';

class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  final _bloc = sl<SubscriptionsBloc>();

  @override
  void initState() {
    _bloc.addGetSubscriptionsEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionsBloc, SubscriptionsState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: state.isLoading
                ? const Loader()
                : Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              NameScreen.addSubscription,
                            );
                          },
                          child: const Text("إنشاء اشتراك جديد")),
                      ...state.subscriptions.map((subscription) =>
                          Center(
                            child: SubscriptionTile(
                                bloc: _bloc, subscription: subscription),
                          )),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
