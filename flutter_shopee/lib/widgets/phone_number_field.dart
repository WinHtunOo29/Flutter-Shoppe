import 'package:flutter/material.dart';
import 'package:flutter_shopee/theme/dimensions.dart';
import 'flag_dropdown_field.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number is required';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlagDropdownField(
                onChanged: (code) {
                  print('Selected country: $code');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: kPaddingSmall, top: kPaddingSmall, bottom: kPaddingSmall),
                child: const VerticalDivider(width: 1),
              ),
            ],
          ),
        ),
        hintText: 'Your number',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.outline,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
