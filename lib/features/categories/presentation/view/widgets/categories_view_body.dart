import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> levels = [
      'level one',
      'level two',
      'level three',
      'level four',
      'level five',
    ];
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: context.appColors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text(levels[index])),
          );
        },
      ),
    );
  }
} 

/*
 final lesonCubit = BlocProvider.of<LeasonCubit>(context);
    lesonCubit.getLeson(
      country: 'egypt',
      university: "mansoura",
      system: "Bachelors",
      level: "level one",
      subject: "science",
      term: "first term",
      doctor: "Dr Ezzat",
    );

*/