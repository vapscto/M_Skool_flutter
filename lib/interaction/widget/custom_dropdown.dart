import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_container.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final int? initial;
  final List<String> items;
  final ValueChanged<int?> onChange;
  const CustomDropdown(
      {this.initial,
      required this.label,
      required this.items,
      required this.onChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    final indexNotifier = ValueNotifier<int?>(initial);
    return CustomContainer(
      child: ValueListenableBuilder<int?>(
          valueListenable: indexNotifier,
          builder: (context, value, _) {
            return DropdownButtonFormField2<int?>(
              value: value,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                labelText: label,
                labelStyle: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w200,
                    backgroundColor: Colors.white,
                    color: Color(0xff898989)),
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 30,
              ),
              iconSize: 30,
              items: List.generate(
                items.length,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(
                    items[index],
                    style: Theme.of(context).textTheme.labelSmall!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            letterSpacing: 0.3)),
                  ),
                ),
              ),
              onChanged: onChange,
            );
          }),
    );
  }
}
