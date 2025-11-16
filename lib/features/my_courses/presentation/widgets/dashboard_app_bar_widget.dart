import 'package:flutter/material.dart'; 
import 'package:sinna/core/widgets/custom_profile_avatar.dart';

class DashboardAppBarWidget extends StatelessWidget {
  const DashboardAppBarWidget({super.key}); 

  @override
  Widget build(BuildContext context) { 
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.search),
        const SizedBox(width: 10,),
        CustomProfileAvatar(),
      ],
    );
  }
}
