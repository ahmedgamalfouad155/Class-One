import 'package:flutter/material.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/add_institutions_dialog.dart';

class InstitutionsScreenBody extends StatelessWidget {
  const InstitutionsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Institutions", style: AppStyles.textStyle24W600(context)),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: CustomsBoxDecoration().profileDecoration(context),
            child: CustomOptionWidget(
              title: "Create Institution",
              onTap: () => showDialog(
                context: context,
                builder: (_) => const AddInstitutionsDialog(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('Institutions', style: AppStyles.textStyle16W600Grey(context)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
