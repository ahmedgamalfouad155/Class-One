import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/widgets/custom_filter_item_widget.dart';

class CustomFiltersWidget<T extends Cubit<int>> extends StatelessWidget {
  const CustomFiltersWidget({
    super.key,
    required this.filters,
    this.padding = EdgeInsets.zero,
  });

  final EdgeInsetsGeometry padding;
  final List<String> filters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: BlocBuilder<T, int>(
        builder: (context, selectedIndex) {
          return Row(
            children: List.generate(filters.length, (index) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CustomFilterItemWidget(
                    title: filters[index],
                    isSelected: selectedIndex == index,
                    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                    onTap: () => context.read<T>().emit(index),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
