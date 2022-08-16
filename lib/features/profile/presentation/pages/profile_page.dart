import 'package:beitouti_chefs/core/util/generate_screen.dart';
import 'package:beitouti_chefs/core/widgets/custom_loader.dart';
import 'package:beitouti_chefs/features/profile/presentation/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return BlocListener<ProfileBloc, ProfileState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.isLoggedOut) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            NameScreen.splashScreen,
            (route) => false,
          );
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: _bloc,
        builder: (context, state) {
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            message(
              message: state.message,
              isError: state.error,
              context: context,
              bloc: _bloc,
            );
          });
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
                        profilePicture: state.profile!.profilePicture ?? "",
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
                      ProfileTile(
                        title: 'تعديل إعدادات الطلب',
                        icon: Icons.settings,
                        screenName: NameScreen.editOrderSettingsScreen,
                        arguments: _bloc,
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
                      ProfileTile(
                        title: 'الدعم',
                        icon: Icons.contact_support_outlined,
                        isFunctionCall: true,
                        function: () async {
                          const url = "tel:0953954152";
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      ),
                      ProfileTile(
                        title: 'تسجيل الخروج',
                        icon: Icons.logout,
                        isFunctionCall: true,
                        function: _bloc.addLogoutEvent,
                      ),
                    ],
                  ),
                ),
              if (state.isLoading) const Loader(),
            ],
          );
        },
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isFunctionCall;
  final String? screenName;
  final VoidCallback? function;
  final Object? arguments;

  const ProfileTile({
    Key? key,
    required this.title,
    required this.icon,
    this.screenName,
    this.isFunctionCall = false,
    this.function,
    this.arguments,
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
          if (isFunctionCall) {
            function!();
          } else {
            Navigator.of(context).pushNamed(screenName!, arguments: arguments);
          }
        },
        child: Container(
          height: 55.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
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
                size: 25.sp,
                color: Theme.of(context).colorScheme.tertiary,
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
