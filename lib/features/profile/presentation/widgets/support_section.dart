import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( LocaleKeys.support.tr(), style: AppStyles.textStyle16w400Grey(context)),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: CustomOptionWidget(title: LocaleKeys.support.tr(), onTap: _openWhatsApp),
        ),
      ],
    );
  }
}

Future<void> _openWhatsApp() async {
  final url = Uri.parse(
    "https://wa.me/${201552569256}?text=${Uri.encodeComponent("test")}",
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not launch $url";
  }
}
