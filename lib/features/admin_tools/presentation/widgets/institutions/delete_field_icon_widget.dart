import 'package:flutter/material.dart';

class DeleteFieldIconWidget extends StatelessWidget {
  const DeleteFieldIconWidget({super.key, }); 

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () { 
            },
            child: Icon(Icons.delete_outline_outlined),
          );
  }
}

