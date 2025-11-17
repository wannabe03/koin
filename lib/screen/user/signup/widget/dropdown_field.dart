import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class DropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const DropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: PRIMARY_COLOR,
          ),
        ),
        DropdownButtonFormField<String>(
          initialValue: value,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          isExpanded: true,
          hint: Text(
            'Select $label',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: GrayScale.gray400,
            ),
          ),
          items:
              items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
          onChanged: onChanged,
          selectedItemBuilder: (BuildContext context) {
            return items.map<Widget>((String item) {
              return Text(
                item,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}
