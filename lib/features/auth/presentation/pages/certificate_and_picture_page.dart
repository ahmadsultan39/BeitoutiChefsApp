import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_expansion_tile.dart';
import '../widgets/form_entity.dart';
import '../widgets/page_view_item.dart';

class CertificateAndPicturePage extends StatefulWidget {
  final VoidCallback onPressed;
  final VoidCallback pickFile;
  final VoidCallback pickProfilePicture;
  final FilePickerResult? certificateFile;
  final FilePickerResult? profilePicture;

  const CertificateAndPicturePage({
    Key? key,
    required this.onPressed,
    required this.pickFile,
    required this.pickProfilePicture,
    required this.certificateFile,
    required this.profilePicture,
  }) : super(key: key);

  @override
  State<CertificateAndPicturePage> createState() =>
      _CertificateAndPicturePageState();
}

class _CertificateAndPicturePageState extends State<CertificateAndPicturePage> {
  final TextEditingController _certificateTextController =
      TextEditingController(text: "اضعط هنا لتحميل الرخصة");

  final TextEditingController _profilePictureTextController =
      TextEditingController(text: "اضعط هنا لتحميل الصورة");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.certificateFile != null) {
      setState(() {
        _certificateTextController.text = widget.certificateFile!.names.first!;
      });
    }
    if (widget.profilePicture != null) {
      setState(() {
        _profilePictureTextController.text =
            widget.profilePicture!.names.first!;
      });
    }
    return PageViewItem(
      buttonText: "إنشاء الحساب",
      onPressed: () {
        widget.onPressed();
      },
      children: [
        FormEntity(
          textSize: 12.sp,
          upperLabel: "أرفق رخصة إن وجدت",
          onTap: () {
            widget.pickFile();
          },
          controller: _certificateTextController,
          isInputTextValid: true,
          error: "",
          enabled: false,
          onChanged: (_) {},
        ),
        FormEntity(
          textSize: 12.sp,
          upperLabel: "الصورة الشخصية",
          onTap: () {
            widget.pickProfilePicture();
          },
          controller: _profilePictureTextController,
          isInputTextValid: true,
          error: "",
          enabled: false,
          onChanged: (_) {},
        ),
      ],
    );
  }
}
