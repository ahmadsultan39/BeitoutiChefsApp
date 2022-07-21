import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/default_image.dart';

class ProfilePicture extends StatelessWidget {
  final XFile? pickedImage;
  final String profilePicture;
  final VoidCallback pickImage;

  const ProfilePicture({
    Key? key,
    required this.profilePicture,
    required this.pickedImage,
    required this.pickImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: GestureDetector(
          onTap: pickImage,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 140.w,
                height: 140.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                ),
                child: pickedImage != null
                    ? Image.file(
                        File(pickedImage!.path),
                        fit: BoxFit.cover,
                      )
                    : profilePicture.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: profilePicture,
                          )
                        : const DefaultImage(),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.sp),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                child: Icon(
                  Icons.add_a_photo_rounded,
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
