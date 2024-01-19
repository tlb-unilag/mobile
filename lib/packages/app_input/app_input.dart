// import 'package:taro_leaf_blight/core/utils/extensions/date_extensions.dart';

// import '../packages.dart';

// class AppInput extends StatefulWidget {
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;

//   /// If initialText is not null, it will override the initialText from controller
//   final String? initialText;

//   /// If errorText is not null, it will override the errorText from validator
//   final String? errorText;

//   final List<TextInputFormatter>? inputFormatters;

//   final bool readOnly;

//   /// Hint text to be displayed when the input is empty
//   final String? hintText;

//   /// What should be displayed over the hint icon
//   final String? hintIcon;

//   final Widget? trailingIcon;

//   /// Label text on top
//   final String? labelText;

//   /// Icon to be displayed on the left of the input
//   final Widget? leadingIcon;
//   final Function()? onTap;

//   /// Use this only for bertical padding
//   final EdgeInsets? contentPadding;
//   final String? helperText;
//   final AutovalidateMode autovalidateMode;
//   final TextInputType? keyboardType;
//   final List<DropdownMenuItem<String>>? items;
//   final String? initialItem;
//   final int? maxLines;
//   final int? minLines;
//   final bool isPasswordField;
//   final void Function(String?)? onChanged;
//   final void Function(DateTime?)? onDateTimeChanged;
//   final bool isDateTimeInputField;
//   final bool expands;
//   final DateTime? initialDateTime;

//   final bool enabled;

//   final String? currentCountryCode;
//   final Function(CountryCode)? onCountryPicked;

//   final String? currentCurrency;
//   final Function(Currency)? onCurrencyPicked;

//   /// Width of the input
//   final double? width;
//   final double? height;

//   final TextStyle? style;
//   final TextStyle? hintStyle;

//   final bool isDropDown;

//   /// If obscureText is true, maxLines must be specified as 1.
//   final bool? obscureText;

//   const AppInput({
//     super.key,
//     this.controller,
//     this.hintText,
//     this.hintIcon,
//     this.autovalidateMode = AutovalidateMode.onUserInteraction,
//     this.onTap,
//     this.initialText,
//     this.contentPadding,
//     this.trailingIcon,
//     this.hintStyle,
//     this.obscureText,
//     this.style,
//     this.onChanged,
//     this.readOnly = false,
//     this.inputFormatters,
//     this.minLines,
//     this.enabled = true,
//     this.keyboardType,
//     this.helperText,
//     this.leadingIcon,
//     this.maxLines = 1,
//     this.labelText,
//     this.validator,
//     this.height,
//     this.errorText,
//     this.expands = false,
//     this.width,
//   })  : isPasswordField = false,
//         initialDateTime = null,
//         isDateTimeInputField = false,
//         isDropDown = false,
//         currentCountryCode = null,
//         onDateTimeChanged = null,
//         items = null,
//         initialItem = null,
//         onCountryPicked = null,
//         currentCurrency = null,
//         onCurrencyPicked = null;

//   const AppInput.datePicker({
//     super.key,
//     this.hintText,
//     this.hintIcon,
//     this.autovalidateMode = AutovalidateMode.onUserInteraction,
//     this.initialDateTime,
//     this.contentPadding,
//     this.onTap,
//     this.trailingIcon,
//     this.hintStyle,
//     this.obscureText,
//     this.style,
//     required this.onDateTimeChanged,
//     this.inputFormatters,
//     this.minLines,
//     this.enabled = true,
//     this.keyboardType,
//     this.helperText,
//     this.leadingIcon,
//     this.maxLines = 1,
//     this.labelText,
//     this.validator,
//     this.height,
//     this.errorText,
//     this.expands = false,
//     this.width,
//   })  : isPasswordField = false,
//         controller = null,
//         isDateTimeInputField = true,
//         isDropDown = false,
//         currentCountryCode = null,
//         items = null,
//         readOnly = true,
//         initialText = null,
//         onChanged = null,
//         initialItem = null,
//         onCountryPicked = null,
//         currentCurrency = null,
//         onCurrencyPicked = null;

//   const AppInput.dropdown({
//     super.key,
//     this.hintText,
//     this.hintIcon,
//     required this.items,
//     this.initialItem,
//     this.autovalidateMode = AutovalidateMode.onUserInteraction,
//     this.contentPadding,
//     this.trailingIcon,
//     this.hintStyle,
//     this.obscureText,
//     this.style,
//     required this.onChanged,
//     this.inputFormatters,
//     this.minLines,
//     this.enabled = true,
//     this.keyboardType,
//     this.helperText,
//     this.leadingIcon,
//     this.maxLines = 1,
//     this.labelText,
//     this.onTap,
//     this.validator,
//     this.height,
//     this.errorText,
//     this.expands = false,
//     this.width,
//   })  : isPasswordField = false,
//         initialText = null,
//         onDateTimeChanged = null,
//         controller = null,
//         readOnly = false,
//         initialDateTime = null,
//         isDateTimeInputField = false,
//         isDropDown = true,
//         currentCountryCode = null,
//         onCountryPicked = null,
//         currentCurrency = null,
//         onCurrencyPicked = null;

//   const AppInput.password({
//     super.key,
//     this.controller,
//     this.hintText,
//     this.hintIcon,
//     this.inputFormatters,
//     this.onChanged,
//     this.autovalidateMode = AutovalidateMode.onUserInteraction,
//     this.initialText,
//     this.contentPadding,
//     this.trailingIcon,
//     this.hintStyle,
//     this.readOnly = false,
//     this.obscureText,
//     this.style,
//     this.onTap,
//     this.minLines,
//     this.enabled = true,
//     this.keyboardType,
//     this.helperText,
//     this.leadingIcon,
//     this.maxLines = 1,
//     this.labelText,
//     this.validator,
//     this.height,
//     this.errorText,
//     this.expands = false,
//     this.width,
//   })  : isDropDown = false,
//         initialItem = null,
//         isPasswordField = true,
//         initialDateTime = null,
//         isDateTimeInputField = false,
//         onDateTimeChanged = null,
//         currentCountryCode = null,
//         items = null,
//         onCountryPicked = null,
//         currentCurrency = null,
//         onCurrencyPicked = null;

//   // const AppInput.phoneNumber({
//   //   super.key,
//   //   this.controller,
//   //   this.hintText,
//   //   this.hintIcon,
//   //   this.autovalidateMode = AutovalidateMode.onUserInteraction,

//   //   this.enabled = true,
//   //   this.minLines,
//   //   this.obscureText,
//   //   this.initialText,
//   //   this.hintStyle,
//   //   this.style,
//   //   this.expands = false,
//   //   this.height,
//   //   this.trailingIcon,
//   //   required this.onCountryPicked,
//   //   this.horizontalMargin,
//   //   this.helperText,
//   //   this.labelText,
//   //   this.currentCountryCode,
//   //   this.validator,
//   //   this.contentPadding,
//   //   this.errorText,
//   //   this.width,
//   // })  : leadingIcon = null,
//   //       keyboardType = null,
//   //       isPhoneNumberField = true,
//   //       isEmailField = false,
//   //       isPasswordField = false,
//   //       isCurrencyInputField = false,
//   //       isHttpInputField = false,
//   //       isCardNumberInputField = false,
//   //       currentCurrency = null,
//   //       maxLines = 1,
//   //       onCurrencyPicked = null;

//   @override
//   State<AppInput> createState() => _AppInputState();
// }

// class _AppInputState extends State<AppInput> {
//   final _onNullController = TextEditingController();

//   bool isFocused = false;
//   bool isEmpty = true;
//   String dropdownText = '';
//   final _focusNode = FocusNode();
//   String? error;
//   String? get errorText => widget.errorText ?? error;

//   CountryCode? _phoneDropdownValue;

//   void controllerOnEmptyListiner() {
//     if (controller.text.isEmpty) {
//       if (isEmpty == false) {
//         setState(() {
//           isEmpty = true;
//         });
//       }
//     } else {
//       if (isEmpty) {
//         setState(() {
//           isEmpty = false;
//         });
//       }
//     }
//   }

//   // asyncValidator() async {
//   //   setState(() {
//   //     errorText = '';
//   //   });
//   //   final error = await widget.asyncValidator!(controller.text);
//   //   WidgetsBinding.instance.addPostFrameCallback((_) {
//   //     setState(() {
//   //       errorText = error;
//   //     });
//   //     errorText;
//   //   });
//   // }

//   @override
//   void initState() {
//     error = widget.errorText;
//     _focusNode.addListener(() {
//       setState(() {
//         isFocused = _focusNode.hasFocus;
//       });
//     });
//     if (widget.isDropDown) {
//       _focusNode.addListener(() {
//         setState(() {
//           isFocused = _focusNode.hasFocus;
//         });
//       });
//     }
//     // if (widget.asyncValidator != null) {
//     //   controller.addListener(asyncValidator);
//     // }
//     if (widget.initialText != null) {
//       controller.text = widget.initialText!;
//     }
//     if (widget.initialDateTime != null) {
//       controller.text = widget.initialDateTime!.formatDateDash;
//     }
//     if (controller.text.isNotEmpty) {
//       isEmpty = false;
//     }

//     controller.addListener(controllerOnEmptyListiner);

//     // if (widget.isPhoneNumberField) {
//     //   onPhoneInit();
//     // }

//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.removeListener(controllerOnEmptyListiner);
//     // if (widget.asyncValidator != null) {
//     //   controller.removeListener(asyncValidator);
//     // }
//     super.dispose();
//   }

//   void onPhoneInit() {
//     _phoneDropdownValue =
//         countries.data!.firstWhere((element) => element.dialCode == '234');

//     if (widget.currentCountryCode != null) {
//       _phoneDropdownValue = countries.data!.firstWhereOrNull((element) =>
//               element.shortCode == widget.currentCountryCode ||
//               element.dialCode == widget.currentCountryCode) ??
//           countries.data!.first;
//       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//         widget.onCountryPicked!(_phoneDropdownValue!);
//       });
//     } else {
//       _phoneDropdownValue = countries.data!
//               .firstWhereOrNull((element) => element.shortCode == 'NG') ??
//           countries.data!.first;
//       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//         widget.onCountryPicked!(_phoneDropdownValue!);
//       });
//     }
//     if (widget.isDropDown) {
//       if (widget.initialItem != null) {
//         widget.items!.add(
//           DropdownMenuItem(
//             value: widget.initialItem,
//             child: Text(widget.initialItem ?? ''),
//           ),
//         );
//       }
//     }
//   }

//   bool passwordVisibilityChange = true;

//   Widget _passwordVisibility() {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           passwordVisibilityChange = !passwordVisibilityChange;
//         });
//       },
//       child: passwordVisibilityChange
//           ? SvgPicture.asset(
//               IconsaxBold.eye,
//               width: 30,
//               height: 20,
//               color: AppColors.greySecondary,
//             )
//           : SvgPicture.asset(
//               IconsaxBulk.eyeSlash,
//               width: 30,
//               height: 20,
//               color: AppColors.greySecondary,
//             ),
//     );
//   }

//   DateTime? chosenDate;

//   TextEditingController get controller =>
//       widget.controller ?? _onNullController;

//   @override
//   Widget build(BuildContext context) {
//     var showEmpty = isEmpty && !isFocused;

//     Color textColor() {
//       return AppColors.baseBlack;
//     }

//     Color hintColor() {
//       return AppColors.greyTertiary;
//     }

//     Color borderColor() {
//       if (showEmpty) {
//         return Colors.transparent;
//       } else if (errorText != null) {
//         return AppColors.error400;
//       } else if (isFocused) {
//         return AppColors.baseBlack;
//       } else {
//         return AppColors.bordersHover;
//       }
//     }

//     return InkWell(
//       onTap: widget.onTap ??
//           (widget.readOnly
//               ? null
//               : () async {
//                   if (widget.isDateTimeInputField) {
//                     handleDateTime();
//                   }
//                   _focusNode.requestFocus();
//                 }),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (widget.labelText != null && showEmpty) ...[
//             Text(
//               widget.labelText!,
//               style: CustomTextStyle.textsmall14.w700,
//             ),
//             12.spacingH,
//           ],
//           SizedBox(
//             width: widget.width,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: borderColor(),
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: showEmpty
//                           ? EdgeInsets.zero
//                           : const EdgeInsets.symmetric(horizontal: 12),
//                       child: Row(
//                         children: [
//                           if (widget.leadingIcon != null) ...[
//                             widget.leadingIcon!,
//                             8.spacingW,
//                           ],

//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 if (widget.labelText != null && !showEmpty) ...[
//                                   12.spacingH,
//                                   Text(
//                                     widget.labelText!,
//                                     style: CustomTextStyle.textxSmall12.w500
//                                         .withColor(borderColor()),
//                                   ),
//                                 ],
//                                 if (widget.isDropDown)
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(12),
//                                     child: dropDown(textColor(), hintColor()),
//                                   )
//                                 else if (showEmpty)
//                                   onEmptyField(textColor(), hintColor())
//                                 else
//                                   textField(textColor(), hintColor()),
//                               ],
//                             ),
//                           ),
//                           // if (widget.hintIcon != null) ...[
//                           //   8.spacingW,
//                           //   SvgPicture.asset(
//                           //     SvgBaseIcons.helpCircle,
//                           //     color: helpIconColor(),
//                           //     width: 16,
//                           //     height: 16,
//                           //   ),
//                           // ],
//                           if (widget.isPasswordField) ...[
//                             _passwordVisibility()
//                           ],
//                           if (widget.trailingIcon != null) ...[
//                             8.spacingW,
//                             widget.trailingIcon!,
//                           ],
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (errorText != null) ...[
//             12.spacingH,
//             Text(
//               errorText!,
//               style: widget.style?.withColor(AppColors.error400) ??
//                   CustomTextStyle.textsmall14.withColor(AppColors.error400),
//             ),
//           ],
//           if (widget.helperText != null) ...[
//             4.spacingH,
//             Text(
//               widget.helperText!,
//               style: widget.style?.withColor(AppColors.greyTertiary) ??
//                   CustomTextStyle.textsmall14.withColor(AppColors.greyTertiary),
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   Future<void> handleDateTime() async {
//     final date = await showDatePicker(
//       context: context,
//       initialDate: widget.initialDateTime ?? chosenDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );
//     if (date != null) {
//       chosenDate = date;
//       widget.onDateTimeChanged!(date);
//       controller.text = date.formatDateDash;
//     }
//   }

//   @widgetFactory
//   Widget dropDown(Color textColor, Color hintColor) {
//     var showEmpty = isEmpty && !isFocused;

//     return DropdownButtonFormField<String>(
//       items: widget.items!,
//       onChanged: (v) {
//         widget.onChanged!(v);
//         setState(() {
//           isEmpty = v!.isEmpty;
//         });
//       },
//       value: widget.initialItem,
//       focusNode: _focusNode,
//       icon: const Icon(
//         Icons.keyboard_arrow_down,
//         color: AppColors.greyTertiary,
//       ),
//       style: widget.style?.withColor(textColor) ??
//           CustomTextStyle.textmedium16.w500.withColor(textColor),
//       decoration: InputDecoration(
//         contentPadding: showEmpty
//             ? const EdgeInsets.symmetric(vertical: 18, horizontal: 12)
//             : const EdgeInsets.symmetric(vertical: 8).copyWith(
//                 bottom: 16,
//               ),
//         hintText: widget.hintText,
//         fillColor: showEmpty ? AppColors.bordersLight : Colors.transparent,
//         filled: showEmpty,
//         hintStyle: widget.hintStyle?.withColor(hintColor) ??
//             CustomTextStyle.textmedium16.withColor(hintColor),
//         isCollapsed: true,
//         isDense: true,
//         border: InputBorder.none,
//         focusedBorder: InputBorder.none,
//         errorBorder: InputBorder.none,
//         enabledBorder: InputBorder.none,
//         disabledBorder: InputBorder.none,
//         focusedErrorBorder: InputBorder.none,
//         errorStyle: const TextStyle(
//           height: 0,
//         ),
//       ),
//       autovalidateMode: widget.autovalidateMode,
//       validator: widget.validator == null
//           ? null
//           : (v) {
//               final error = widget.validator!(v);

//               if (widget.errorText == null) {
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   setState(() {
//                     this.error = error;
//                   });
//                 });
//               }
//               if (error == null) {
//                 return null;
//               }
//               return '';
//             },
//     );
//   }

//   Widget onEmptyField(Color textColor, Color hintColor) {
//     var outlineInputBorder = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(
//         color: AppColors.bordersLight,
//         width: 1,
//       ),
//     );
//     return TextFormField(
//       focusNode: _focusNode,
//       enabled: widget.enabled,
//       expands: widget.expands,
//       readOnly: widget.readOnly,
//       onChanged: widget.onChanged,
//       obscureText: widget.isPasswordField ? passwordVisibilityChange : false,
//       keyboardType: widget.keyboardType,
//       style: widget.style?.withColor(textColor) ??
//           CustomTextStyle.textmedium16.w500.withColor(textColor),
//       inputFormatters: [
//         if (widget.inputFormatters != null) ...widget.inputFormatters!,
//       ],
//       onTap: widget.isDateTimeInputField
//           ? () {
//               handleDateTime();
//             }
//           : widget.onTap,
//       maxLines: widget.maxLines,
//       minLines: widget.minLines,
//       decoration: InputDecoration(
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
//         hintText: widget.hintText,
//         fillColor: AppColors.bordersLight,
//         filled: true,
//         hintStyle: widget.hintStyle?.withColor(hintColor) ??
//             CustomTextStyle.textmedium16.withColor(hintColor),
//         border: outlineInputBorder,
//         focusedBorder: outlineInputBorder,
//         errorBorder: outlineInputBorder,
//         enabledBorder: outlineInputBorder,
//         disabledBorder: outlineInputBorder,
//         focusedErrorBorder: outlineInputBorder,
//         errorStyle: const TextStyle(
//           height: 0,
//         ),
//       ),
//       autovalidateMode: widget.autovalidateMode,
//       controller: controller,
//       validator: widget.validator == null
//           ? null
//           : (v) {
//               final error = widget.validator!(v);

//               if (widget.errorText == null) {
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   setState(() {
//                     this.error = error;
//                   });
//                 });
//               }
//               if (error == null) {
//                 return null;
//               }
//               return '';
//             },
//     );
//   }

//   TextFormField textField(Color textColor, Color hintColor) {
//     return TextFormField(
//       focusNode: _focusNode,
//       enabled: widget.enabled,
//       expands: widget.expands,
//       readOnly: widget.readOnly,

//       onChanged: widget.onChanged,
//       //cursorHeight: 10,
//       obscureText: widget.isPasswordField ? passwordVisibilityChange : false,
//       keyboardType: widget.keyboardType,
//       style: widget.style?.withColor(textColor) ??
//           CustomTextStyle.textmedium16.w500.withColor(textColor),
//       inputFormatters: [
//         if (widget.inputFormatters != null) ...widget.inputFormatters!,
//       ],
//       onTap: widget.isDateTimeInputField
//           ? () {
//               handleDateTime();
//             }
//           : widget.onTap,
//       maxLines: widget.maxLines,
//       minLines: widget.minLines,
//       decoration: InputDecoration(
//         contentPadding: widget.contentPadding ??
//             const EdgeInsets.symmetric(vertical: 8).copyWith(
//               bottom: 16,
//             ),

//         hintText: widget.hintText,
//         fillColor: AppColors.error400,
//         //filled: true,
//         hintStyle: widget.hintStyle?.withColor(hintColor) ??
//             CustomTextStyle.textmedium16.withColor(hintColor),
//         isCollapsed: true,
//         isDense: true,
//         border: InputBorder.none,

//         focusedBorder: InputBorder.none,
//         errorBorder: InputBorder.none,

//         enabledBorder: InputBorder.none,
//         disabledBorder: InputBorder.none,
//         focusedErrorBorder: InputBorder.none,
//         errorStyle: const TextStyle(
//           height: 0,
//         ),
//       ),
//       autovalidateMode: widget.autovalidateMode,
//       controller: controller,
//       validator: widget.validator == null
//           ? null
//           : (v) {
//               final error = widget.validator!(v);

//               if (widget.errorText == null) {
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   setState(() {
//                     this.error = error;
//                   });
//                 });
//               }
//               if (error == null) {
//                 return null;
//               }
//               return '';
//             },
//     );
//   }
// }
