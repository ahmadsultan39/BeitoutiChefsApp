import 'package:beitouti_chefs/features/add_meal/presentation/bloc/add_meal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryDialog extends StatefulWidget {
  final AddMealBloc bloc;

  const AddCategoryDialog(this.bloc, {Key? key}) : super(key: key);

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final _textController = TextEditingController();
  bool _isValid = false;
  String _errorMessage = '';

  void _saveCategoryName(BuildContext context) {
    _category(_textController.text);
    if (_isValid) {
      widget.bloc.addAddCategoryEvent(_textController.text);
      Navigator.of(context).pop();
    }
  }

  void _category(String text) {
    setState(
      () {
        if (_textController.text.isEmpty ||
            _textController.text.trim().isEmpty) {
          _isValid = false;
          _errorMessage = 'الرجاء إضافة اسم';
        } else if (_textController.text.length < 2) {
          _isValid = false;
          _errorMessage = 'الاسم يجب أن يكون حرفين على الأقل';
        } else if (!_isValid) {
          _isValid = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              "أضف تصنيف جديد",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            TextField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                icon: Icon(
                  Icons.add_box_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                label: Text(
                  "أضف اسم التصنيف",
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              controller: _textController,
              onChanged: _category,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 8.0.h, start: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    !_isValid ? _errorMessage : "",
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60))),
              clipBehavior: Clip.hardEdge,
              child: TextButton(
                onPressed: () {
                  _saveCategoryName(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)),
                child: Text("إضافة", style:TextStyle(fontSize: 14.sp,color: Theme.of(context).colorScheme.tertiary) ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
