import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/countries.dart'; // مهم!
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    super.key,
    this.controller,
    this.initialCountryCode = 'EG',
    required this.onChanged, // ✅ خليها required
  });

  final TextEditingController? controller;
  final String initialCountryCode;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      validator: (value) {
        if (value == null || value.completeNumber.isEmpty) {
          return 'please Enter Your Phone';
        }
        return null;
      },
      dropdownIcon: Icon(
        Icons.unfold_more,
        color: context.appColors.grey,
        size: 20,
      ),
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
        onChanged(phone.completeNumber); // ✅ يرجع الرقم كامل
      },
      cursorColor: context.appColors.blue,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14),
        hintText: "000 000 0000",
        hintStyle: AppStyles.textStyle12GreyW400(context),
        fillColor: context.appColors.greyBackgroundTextFiled,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: context.appColors.greyBackgroundTextFiled,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: context.appColors.greyBackgroundTextFiled,
          ),
        ),
      ),
    );
  }
}
