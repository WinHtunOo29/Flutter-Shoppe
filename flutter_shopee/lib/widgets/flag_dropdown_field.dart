import 'package:flutter/material.dart';
import 'package:flutter_shopee/theme/dimensions.dart';

class FlagDropdownField extends StatefulWidget {
  final void Function(String countryCode)? onChanged;
  final String initialCountryCode;

  const FlagDropdownField({
    super.key,
    this.onChanged,
    this.initialCountryCode = 'TH',
  });

  @override
  State<FlagDropdownField> createState() => _FlagDropdownFieldState();
}

class _FlagDropdownFieldState extends State<FlagDropdownField> {
  late String selectedCountryCode;

  final List<String> countryCodes = [
    'US', 'GB', 'FR', 'DE', 'IN', 'TH', 'MM', 'JP', 'SG', 'CN', 'KR',
  ];

  @override
  void initState() {
    super.initState();
    selectedCountryCode = widget.initialCountryCode;
  }

  String countryCodeToEmoji(String countryCode) {
    return countryCode.toUpperCase().codeUnits.map((unit) {
      return String.fromCharCode(unit + 127397);
    }).join();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          _showCountryPicker(context);
        },
        child: Container(
          padding: const EdgeInsets.only(left: kPaddingSmall),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                countryCodeToEmoji(selectedCountryCode),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  void _showCountryPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Country'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: countryCodes.length,
            itemBuilder: (context, index) {
              final code = countryCodes[index];
              return ListTile(
                leading: Text(
                  countryCodeToEmoji(code),
                  style: const TextStyle(fontSize: 24),
                ),
                title: Text(code),
                onTap: () {
                  setState(() {
                    selectedCountryCode = code;
                  });
                  widget.onChanged?.call(code);
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
