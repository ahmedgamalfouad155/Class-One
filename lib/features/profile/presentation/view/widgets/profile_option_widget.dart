// import 'package:flutter/material.dart';
// import 'package:sinna/core/theme/colors.dart';
// import 'package:sinna/core/theme/styles.dart';

// class ProfileOptionWidget extends StatelessWidget {
//   const ProfileOptionWidget({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.onTap,
//     this.color,
//   });
//   final String title;
//   final IconData icon;
//   final VoidCallback onTap;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       splashColor: const Color.fromARGB(255, 203, 227, 238),
//       highlightColor: const Color.fromARGB(255, 235, 242, 193),
//       customBorder: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 13.0),
//         child: Row(
//           children: [
//             Icon(icon, color: color ?? context.appColors.blue),
//             SizedBox(width: 10),
//             Text(title, style: AppStyles.textStyle16(context)),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

class ProfileOptionWidget extends StatelessWidget {
  const ProfileOptionWidget({
    super.key,
    required this.title,
    this.widget,
    required this.onTap,
    this.verticalPading,
  });
  final String title;
  final Widget? widget;
  final VoidCallback? onTap;
  final double? verticalPading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPading ?? 10),
        child: Row(
          children: [
            Text(title, style: AppStyles.textStyle14W600(context)),
            Spacer(),
            widget ??
                Icon(
                  Icons.arrow_forward_ios,
                  color: context.appColors.black,
                  size: 12,
                ),
          ],
        ),
      ),
    );
  }
}
