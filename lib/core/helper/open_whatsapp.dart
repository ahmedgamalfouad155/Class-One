import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp() async {
  final url = Uri.parse(
    "https://wa.me/${201552569256}?text=${Uri.encodeComponent("")}",
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not launch $url";
  }
}
