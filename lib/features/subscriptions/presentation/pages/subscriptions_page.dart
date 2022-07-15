import 'package:beitouti_chefs/core/widgets/custom_loader.dart';
import 'package:beitouti_chefs/features/subscriptions/presentation/bloc/subscriptions_bloc.dart';
import 'package:beitouti_chefs/features/subscriptions/presentation/widgets/subscription_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/generate_screen.dart';
import '../../../../injection.dart';
import '../bloc/subscriptions_state.dart';

class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = sl<SubscriptionsBloc>();
    _bloc.addGetSubscriptionsEvent();
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
                          SubscriptionTile(
                              bloc: _bloc, subscription: subscription)),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
