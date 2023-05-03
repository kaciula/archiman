import 'package:archiman/app/app_styles.dart';
import 'package:archiman/features/common/widgets/generic/atoms/material_ink_well.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RadioBox<T> extends StatelessWidget {
  const RadioBox({
    super.key,
    required this.label,
    this.height = 80,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String label;
  final double height;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return MaterialInkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.black),
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Gap(16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Gap(16),
            Radio(value: value, groupValue: groupValue, onChanged: onChanged),
            Gap(8),
          ],
        ),
      ),
    );
  }
}
