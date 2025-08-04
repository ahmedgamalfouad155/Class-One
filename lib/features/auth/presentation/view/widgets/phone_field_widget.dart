import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/countries.dart'; // مهم!
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.initialCountryCode = 'EG',
    this.onChanged,
  });

  final String hintText;
  final TextEditingController? controller;
  final String initialCountryCode;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: initialCountryCode,
      countries: countries.where((country) {
        const arabCountries = [
          'EG',
          'SA',
          'AE',
          'QA',
          'KW',
          'OM',
          'BH',
          'JO',
          'IQ',
          'LY',
          'SY',
          'YE',
          'SD',
          'DZ',
          'MA',
          'TN',
          'LB',
          'PS',
        ];
        return arabCountries.contains(country.code);
      }).toList(),
      onChanged: (phone) {
        onChanged?.call(phone.completeNumber);
      },
      cursorColor: context.appColors.blue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.textStyle12(context),
        fillColor: context.appColors.offWhite,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: context.appColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: context.appColors.blue),
        ),
      ),
    );
  }
}
