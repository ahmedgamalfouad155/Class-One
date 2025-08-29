import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';

AppBar appBarMyCourses(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'My Corses',
            style: AppStyles.textStyle16(
              context,
            ).copyWith(color: context.appColors.white),
          ),
        ),
      ],
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Hello : ",
                  style: AppStyles.textStyle14(context).copyWith(
                    color: context.appColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Ahmed Gamal",
                  style: AppStyles.textStyle16(
                    context,
                  ).copyWith(color: context.appColors.white),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              "Lits to learn",
              style: AppStyles.textStyle12(
                context,
              ).copyWith(color: context.appColors.white),
            ),
          ],
        ),
      ),
    );
  }
