import 'dart:io';

import 'package:beitouti_chefs/core/util/constants.dart';
import 'package:beitouti_chefs/features/add_meal/domain/use_cases/add_meal.dart';
import 'package:beitouti_chefs/features/add_meal/presentation/widgets/add_category_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/entities/meal.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../injection.dart';
import '../../domain/use_cases/edit_meal.dart';
import '../bloc/add_meal.dart';

class AddMealPage extends StatefulWidget {
  final Meal? initMeal;

  const AddMealPage({Key? key, this.initMeal}) : super(key: key);

  @override
  State<AddMealPage> createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  final _form = GlobalKey<FormState>();
  final editPriceForm = GlobalKey<FormState>();
  XFile? pickedImage;
  String? name;
  int? categoryId;
  String? ingredients;
  int? preparingTime;
  int? maxMeals;
  int? price;
  String? priceEditReason;
  double? discount;
  final _bloc = sl<AddMealBloc>();

  @override
  void initState() {
    _bloc.addGetCategoriesEvent();
    if (widget.initMeal != null) {
      name = widget.initMeal!.name;
      categoryId = widget.initMeal!.categoryId;
      ingredients = widget.initMeal!.ingredients;
      preparingTime = widget.initMeal!.preparingTime;
      maxMeals = widget.initMeal!.maxMeals;
      price = widget.initMeal!.price;
      discount = widget.initMeal!.discount;
    }
    super.initState();
  }

  bool saveForm() {
    if (widget.initMeal == null) {
      if (_bloc.state.pickedImage == null) {
        message(
            message: "الرجاء إضافة صورة",
            context: context,
            bloc: _bloc,
            isError: true);
        return false;
      }
      if (categoryId == null) {
        message(
            message: "الرجاء إضافة تصنيف",
            context: context,
            bloc: _bloc,
            isError: true);
        return false;
      }
    }
    if (!_form.currentState!.validate()) return false;
    _form.currentState!.save();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AddMealBloc, AddMealState>(
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
        return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.initMeal == null ? 'إضافة وجبة' : 'تعديل وجبة',
              ),
            ),
            body: Stack(
              children: [
                Form(
                  key: _form,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: GestureDetector(
                              onTap: () {
                                _bloc.addPickImageEvent();
                              },
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    width: 160.w,
                                    height: 160.w,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: state.pickedImage != null
                                        ? Image.file(
                                            File(state.pickedImage!.path),
                                            fit: BoxFit.cover)
                                        : widget.initMeal != null
                                            ? CachedNetworkImage(
                                                imageUrl: Endpoints.url +
                                                    widget.initMeal!.imageUrl)
                                            : Container(),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(12.sp),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                    child: Icon(
                                      Icons.add_a_photo_rounded,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      size: 24.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          initialValue: name,
                          decoration:
                              const InputDecoration(labelText: 'اسم الوجبة'),
                          validator: (value) {
                            value?.trim();
                            if (value == null || value.isEmpty) {
                              return "الاسم لا يجب أن يكون فارغ";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            value!.trim();
                            name = value;
                          },
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            DropdownButton<String>(
                              value: state.categories.isNotEmpty &&
                                      categoryId != null
                                  ? state.categories
                                      .firstWhere(
                                          (element) => element.id == categoryId)
                                      .id
                                      .toString()
                                  : null,
                              hint: const Text("التصنيف"),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: state.categories.map((items) {
                                return DropdownMenuItem(
                                  value: items.id.toString(),
                                  child: Text(items.name),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  categoryId = int.parse(newValue!);
                                });
                              },
                            ),
                            const Spacer(),
                            TextButton.icon(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) =>
                                          AddCategoryDialog(_bloc));
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: theme.colorScheme.tertiary,
                                ),
                                label: Text(
                                  "إضافة تصنيف",
                                  style: TextStyle(
                                      color: theme.colorScheme.tertiary,
                                      fontSize: 14.sp),
                                )),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          initialValue: ingredients,
                          decoration: const InputDecoration(
                            labelText: "المكونات",
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.grey),
                            ),
                          ),
                          maxLines: 3,
                          validator: (value) {
                            value?.trim();
                            if (value == null || value.isEmpty) {
                              return "المكونات لا يجب أن يكون فارغة";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            value!.trim();
                            ingredients = value;
                          },
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            const Text("الوقت المتوقع للتحضير"),
                            SizedBox(
                              width: 35.w,
                              child: TextFormField(
                                initialValue: preparingTime?.toString(),
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  value?.trim();
                                  if (value == null || value.isEmpty) {
                                    return "الوقت المتوقع لا يجب أن يكون فارغ";
                                  }
                                  if (int.tryParse(value) == null) {
                                    return "الوقت المتوقع يجب أن يكون رقم";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  value!.trim();
                                  preparingTime = int.parse(value);
                                },
                              ),
                            ),
                            const Text("دقيقة")
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            const Text("العدد الأعظمي للتحضير"),
                            SizedBox(
                              width: 35.w,
                              child: TextFormField(
                                initialValue: maxMeals?.toString(),
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  value?.trim();
                                  if (value == null || value.isEmpty) {
                                    return "العدد الأعظمي لا يجب أن يكون فارغ";
                                  }
                                  if (int.tryParse(value) == null) {
                                    return "العدد الأعظمي يجب أن يكون رقم";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  value!.trim();
                                  maxMeals = int.parse(value);
                                },
                              ),
                            ),
                            const Text("وجبة")
                          ],
                        ),
                        SizedBox(height: 8.h),
                        if (widget.initMeal == null)
                          Row(
                            children: [
                              const Text("السعر"),
                              SizedBox(
                                width: 125.w,
                                child: TextFormField(
                                  initialValue: price?.toString(),
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    value?.trim();
                                    if (value == null || value.isEmpty) {
                                      return "السعر لا يجب أن يكون فارغ";
                                    }
                                    if (int.tryParse(value) == null) {
                                      return "السعر يجب أن يكون رقم";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    value!.trim();
                                    price = int.parse(value);
                                  },
                                ),
                              ),
                              const Text("ل.س")
                            ],
                          ),
                        if (widget.initMeal != null)
                          Row(
                            children: [
                              Text("السعر $price ل.س "),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          elevation: 0,
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  24.0, 20.0, 24.0, 0.0),
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(32.0),
                                            ),
                                          ),
                                          content: Form(
                                            key: editPriceForm,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  initialValue:
                                                      price.toString(),
                                                  textAlign: TextAlign.center,
                                                  validator: (value) {
                                                    value?.trim();
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return "السعر لا يجب أن يكون فارغ";
                                                    }
                                                    if (int.tryParse(value) ==
                                                        null) {
                                                      return "السعر يجب أن يكون رقم";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (value) {
                                                    value!.trim();
                                                    price = int.parse(value);
                                                  },
                                                ),
                                                TextFormField(
                                                  textAlign: TextAlign.center,
                                                  validator: (value) {
                                                    value?.trim();
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return "السعر لا يجب أن يكون فارغ";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (value) {
                                                    value!.trim();
                                                    priceEditReason = value;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (!editPriceForm
                                                      .currentState!
                                                      .validate()) return;
                                                  editPriceForm.currentState!
                                                      .save();
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  height: 30.h,
                                                  width: 80.w,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .cardColor,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(30),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        offset: const Offset(
                                                            1.0, 3.0),
                                                        blurRadius: 1,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'موافق',
                                                      style: TextStyle(
                                                        // color: Theme.of(context)
                                                        //     .primaryColorDark,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 30.h,
                                                  width: 80.w,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .cardColor,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(30),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        offset: const Offset(
                                                            1.0, 3.0),
                                                        blurRadius: 1,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'إلغاء',
                                                      style: TextStyle(
                                                          // color: Theme.of(context)
                                                          //     .primaryColorDark,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit))
                            ],
                          ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            const Text("الحسم"),
                            SizedBox(
                              width: 35.w,
                              child: TextFormField(
                                initialValue: discount?.toString(),
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  value?.trim();
                                  if (value != null && value.isNotEmpty) {
                                    if (int.tryParse(value) == null) {
                                      return "الحسم يجب أن يكون رقم";
                                    }
                                    if (int.parse(value) < 0 ||
                                        int.parse(value) > 100) {
                                      return "الحسم يجب أن يكون رقم بين 0 و 100";
                                    }
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  value!.trim();
                                  if (value.isNotEmpty) {
                                    discount = double.parse(value);
                                  }
                                },
                              ),
                            ),
                            const Text("%")
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Center(
                          child: SizedBox(
                            width: 300.w,
                            child: TextButton.icon(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        theme.colorScheme.tertiary)),
                                onPressed: () {
                                  if (saveForm()) {
                                    _bloc.addGetFinalPriceEvent(price!);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BlocBuilder<AddMealBloc,
                                            AddMealState>(
                                          bloc: _bloc,
                                          builder: (context, state) {
                                            return AlertDialog(
                                              elevation: 0,
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      24.0, 20.0, 24.0, 0.0),
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0),
                                                ),
                                              ),
                                              content: _bloc.state.isLoading &&
                                                      _bloc.state.finalPrice ==
                                                          null
                                                  ? SizedBox(
                                                      height: 50.h,
                                                      child: const Loader(),
                                                    )
                                                  : Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "السعر للطالب سوف يكون",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            // color: Theme.of(context).hintColor,
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          _bloc.state.finalPrice
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            // color: Theme.of(context).hintColor,
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                              actions: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      widget.initMeal == null
                                                          ? _bloc.addAddNewMealEvent(
                                                              AddMealUseCaseParams(
                                                              pickedImage: state
                                                                  .pickedImage!,
                                                              name: name!,
                                                              categoryId:
                                                                  categoryId!,
                                                              ingredients:
                                                                  ingredients!,
                                                              preparingTime:
                                                                  preparingTime!,
                                                              maxMeals:
                                                                  maxMeals!,
                                                              price: price!,
                                                              discount:
                                                                  discount,
                                                            ))
                                                          : _bloc.addEditMealEvent(
                                                              EditMealUseCaseParams(
                                                              mealId: widget
                                                                  .initMeal!.id,
                                                              pickedImage: state
                                                                  .pickedImage,
                                                              name: name!,
                                                              categoryId:
                                                                  categoryId!,
                                                              ingredients:
                                                                  ingredients!,
                                                              preparingTime:
                                                                  preparingTime!,
                                                              maxMeals:
                                                                  maxMeals!,
                                                              price:
                                                                  priceEditReason !=
                                                                          null
                                                                      ? price
                                                                      : null,
                                                              priceEditReason:
                                                                  priceEditReason,
                                                              discount:
                                                                  discount,
                                                            ));
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Container(
                                                      height: 30.h,
                                                      width: 80.w,
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .cardColor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(30),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                const Offset(
                                                                    1.0, 3.0),
                                                            blurRadius: 1,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'موافق',
                                                          style: TextStyle(
                                                            // color: Theme.of(context)
                                                            //     .primaryColorDark,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      height: 30.h,
                                                      width: 80.w,
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .cardColor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(30),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                const Offset(
                                                                    1.0, 3.0),
                                                            blurRadius: 1,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'إلغاء',
                                                          style: TextStyle(
                                                              // color: Theme.of(context)
                                                              //     .primaryColorDark,
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: theme.primaryColor,
                                ),
                                label: Text(
                                  widget.initMeal == null
                                      ? "إضافة الوجبة"
                                      : 'تعديل الوجبة',
                                  style: TextStyle(
                                      color: theme.primaryColor,
                                      fontSize: 14.sp),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                if (state.isLoading) const Loader()
              ],
            ));
      },
    );
  }
}
