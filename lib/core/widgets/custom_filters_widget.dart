import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/special_cubit/filter_cubit.dart';
import 'package:sinna/core/widgets/custom_filter_item_widget.dart';

enum SpecialLayoutType { wrap, equal }

class CustomFiltersWidget extends StatelessWidget {
  const CustomFiltersWidget({
    super.key,
    required this.filters,
    this.padding = EdgeInsets.zero,
    this.layoutType = SpecialLayoutType.wrap,
  });

  final EdgeInsetsGeometry padding;
  final List<String> filters;
  final SpecialLayoutType layoutType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: BlocBuilder<FilterCubit, int>(
        builder: (context, selectedIndex) {
          if (layoutType == SpecialLayoutType.wrap) {
            // ✅ العناصر تاخد حجمها الطبيعي
            return SizedBox(
              height: 35,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomFilterItemWidget(
                    title: filters[index],
                    isSelected: selectedIndex == index,
                    onTap: () =>
                        context.read<FilterCubit>().selectFilter(index),
                    layoutType: layoutType,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: filters.length,
              ),
            );
          } else {
            // ✅ العناصر تتقسم بالتساوي
            return Row(
              children: List.generate(filters.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CustomFilterItemWidget(
                      title: filters[index],
                      isSelected: selectedIndex == index,
                      onTap: () =>
                          context.read<FilterCubit>().selectFilter(index),
                      layoutType: layoutType,
                    ),
                  ),
                );
              }),
            );
          }
        },
      ),
    );
  }
}
