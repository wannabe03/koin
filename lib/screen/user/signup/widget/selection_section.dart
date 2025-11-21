import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class SelectionSection extends StatelessWidget {
  final String title;
  final List<String> options;
  final Set<String> selectedOptions;
  final ValueChanged<String> onToggle;

  const SelectionSection({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOptions,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          Wrap(
            spacing: 8,
            children:
                options.map((option) {
                  final bool isSelected = selectedOptions.contains(option);
                  return ChoiceChip(
                    label: Text(option),
                    selected: isSelected,
                    showCheckmark: false,
                    onSelected: (selected) => onToggle(option),
                    selectedColor: PRIMARY_COLOR,
                    labelStyle:
                        isSelected
                            ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: GrayScale.white,
                              fontWeight: FontWeight.w600,
                            )
                            : Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: PRIMARY_COLOR,
                              fontWeight: FontWeight.w600,
                            ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: PRIMARY_COLOR),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
