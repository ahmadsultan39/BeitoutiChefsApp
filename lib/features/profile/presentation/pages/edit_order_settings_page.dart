import 'package:beitouti_chefs/core/widgets/loader.dart';
import 'package:beitouti_chefs/features/profile/presentation/bloc/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';

class EditOrderSettingsPage extends StatefulWidget {
  const EditOrderSettingsPage({Key? key}) : super(key: key);

  @override
  State<EditOrderSettingsPage> createState() => _EditOrderSettingsPageState();
}

class _EditOrderSettingsPageState extends State<EditOrderSettingsPage> {
  final _bloc = sl<ProfileBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("تعديل إعدادات الطلب"),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "",
                    )
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
