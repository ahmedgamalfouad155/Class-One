import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class PhoneFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final String initialCountryCode;

  const PhoneFieldWidget({
    super.key,
    this.onChanged,
    this.initialCountryCode = 'EG',
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      dropdownIcon: Icon(
        Icons.unfold_more_outlined,
        color: context.appColors.grey,
      ), 
      decoration: InputDecoration(
        hintText: '000 000 0000',
        fillColor: context.appColors.white,
        hintStyle: AppStyles.textStyle16w400(context),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: context.appColors.offWhite, width: 2),
        ),
        focusedBorder: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: context.appColors.blue, width: 2),
        ),
      ),
      initialCountryCode: initialCountryCode,
      onChanged: (phone) {
        onChanged?.call(phone.completeNumber); // يرجع +201234567890
      },
    );
  }
}
