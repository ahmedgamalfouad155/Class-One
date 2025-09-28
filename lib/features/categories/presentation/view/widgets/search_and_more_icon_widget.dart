
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';

class SearchAndMoreIconWidget extends StatelessWidget {
  const SearchAndMoreIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomTextFieldWidget(
              hintText: "Explore topics,lessons and more...",
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: context.appColors.greyBackgroundTextFiled,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz, color: context.appColors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
