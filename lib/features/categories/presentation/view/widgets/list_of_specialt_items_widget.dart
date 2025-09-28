import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/categories/presentation/manager/special_cubit/special_cubit.dart';
import 'package:sinna/features/categories/presentation/view/widgets/special_item_widget.dart';

class ListOfSpecialtItemsWidget extends StatelessWidget {
  const ListOfSpecialtItemsWidget({super.key});

  final List<String> filters = const [
    "None",
    'Orthodontics',
    'Prosthodontics',
    'Radiology',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 20),
      child: BlocBuilder<SpecialCubit, int>(
        builder: (context, selectedIndex) {
          return SizedBox(
            height: 35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SpecialItemWidget(
                  title: filters[index],
                  isSelected: selectedIndex == index,
                  onTap: () => context.read<SpecialCubit>().selectFilter(index),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: filters.length,
            ),
          );
        },
      ),
    );
  }
}
