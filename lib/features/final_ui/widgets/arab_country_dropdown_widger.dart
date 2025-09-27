import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class ArabCountryDropdown extends StatefulWidget {
  final Function(Country) onCountrySelected;

  const ArabCountryDropdown({super.key, required this.onCountrySelected});

  @override
  // ignore: library_private_types_in_public_api
  _ArabCountryDropdownState createState() => _ArabCountryDropdownState();
}

class _ArabCountryDropdownState extends State<ArabCountryDropdown> {
  Country? selectedCountry;

  // نحدد الدول العربية اللي عايزينها بس
  final List<String> allowedCountries = [
    'EG', // مصر
    'SA', // السعودية
    'LY', // ليبيا
    'AE', // الإمارات
    'KW', // الكويت
    'QA', // قطر
    'OM', // عمان
    'BH', // البحرين
    'JO', // الأردن
    'DZ', // الجزائر
    'MA', // المغرب
    'TN', // تونس
    'LB', // لبنان
    'SD', // السودان
    'IQ', // العراق
    'YE', // اليمن
  ];

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 500,
        borderRadius: BorderRadius.circular(16),
        inputDecoration: InputDecoration(
          hintText: "Search for a country",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      onSelect: (Country country) {
        if (allowedCountries.contains(country.countryCode)) {
          setState(() {
            selectedCountry = country;
          });
          widget.onCountrySelected(country);
        }
      },
      countryFilter: allowedCountries,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showCountryPicker,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              selectedCountry?.flagEmoji ?? "🌍",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                selectedCountry?.name ?? "Select Country",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
