import 'package:beitouti_chefs/core/util/generate_screen.dart';
import 'package:beitouti_chefs/core/widgets/custom_loader.dart';
import 'package:beitouti_chefs/features/profile/presentation/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/constants.dart';
import '../../../../injection.dart';
import '../bloc/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _bloc = sl<ProfileBloc>();

  @override
  void initState() {
    _bloc.addGetProfileEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      builder: (context, state) {
        message(
          bloc: _bloc,
          isError: state.error,
          message: state.message,
          context: context,
        );
        return Stack(
          children: [
            if (state.profile != null)
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    ProfilePicture(
                      profilePicture: state.profile!.profilePicture,
                      pickedImage: state.pickedImage,
                      pickImage: _bloc.addPickImageEvent,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ChefInfo(
                      name: "الاسم",
                      info: state.profile!.name,
                    ),
                    ChefInfo(
                      name: "العنوان",
                      info: state.profile!.locationName,
                    ),
                    ChefInfo(
                      name: "الرقم",
                      info: state.profile!.phoneNumber,
                    ),
                    const ProfileTile(
                      title: 'سجل الطلبات',
                      icon: Icons.history,
                      screenName: NameScreen.ordersHistoryScreen,
                    ),
                    const ProfileTile(
                      title: 'تعديل إعدادات الطلب',
                      icon: Icons.settings,
                      screenName: NameScreen.editOrderSettingsScreen,
                    ),
                    const ProfileTile(
                      title: 'الملاحظات',
                      icon: Icons.notes,
                      screenName: NameScreen.orderMealsNotesScreen,
                    ),
                    const ProfileTile(
                      title: 'الرصيد',
                      icon: Icons.balance,
                      screenName: NameScreen.chefBalanceScreen,
                    ),
                    const ProfileTile(
                      title: 'تسجيل الخروج',
                      icon: Icons.logout,
                      isLogout: true,
                      logoutFunction: _bloc.a,
                    ),
                  ],
                ),
              ),
            if (state.isLoading) const Loader(),
          ],
        );
      },
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isLogout;
  final String? screenName;
  final VoidCallback? logoutFunction;

  const ProfileTile({
    Key? key,
    required this.title,
    required this.icon,
    this.screenName,
    this.isLogout = false,
    this.logoutFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 10.h,
      ),
      child: GestureDetector(
        onTap: () {
          if (isLogout) {
            logoutFunction!();
          } else {
            WidgetsBinding.instance?.addPostFrameCallback(
              (_) {
                Navigator.of(context).pushNamed(screenName!);
              },
            );
          }
        },
        child: Container(
          height: 55.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Icon(
                icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChefInfo extends StatelessWidget {
  final String name;
  final String info;

  const ChefInfo({
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$name :",
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
