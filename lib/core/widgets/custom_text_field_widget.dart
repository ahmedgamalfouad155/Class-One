// import 'package:flutter/material.dart';

// class CustomTextFormFieldWidget extends StatelessWidget {
//   const CustomTextFormFieldWidget({
//     super.key,
//     required this.hintText,
//     this.controller,
//     this.keyboardType,
//   });

//   final String hintText;
//   final TextEditingController? controller;
//   final TextInputType? keyboardType;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PasswordVisibilityCubit, bool>(
//       builder: (context, isHidden) {
//         return TextFormField(
//           obscureText: isHidden,
//           keyboardType: keyboardType,
//           controller: controller,
//           cursorColor: context.appColors.teal,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return '${S.of(context).pleaseEnterYour} $hintText';
//             }
//             return null;
//           },
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: AppStyles.textStyle16Teal(context),
//             fillColor: context.appColors.offWhite,
//             filled: true,
//             suffixIcon: IconButton(
//               icon: Icon(
//                 isHidden ? Icons.visibility_off : Icons.visibility,
//                 color: context.appColors.teal,
//               ),
//               onPressed: () {
//                 context.read<PasswordVisibilityCubit>().toggleVisibility();
//               },
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: BorderSide(color: context.appColors.teal),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: BorderSide(color: context.appColors.teal),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
