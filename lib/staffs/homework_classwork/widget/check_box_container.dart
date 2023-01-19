import 'package:flutter/material.dart';

class CheckBoxContainer extends StatefulWidget {
  final bool isChecked;
  const CheckBoxContainer({
    Key? key,
    required this.sectionName,
    required this.func,
    required this.isChecked,
  }) : super(key: key);

  final String sectionName;
  final Function(bool) func;

  @override
  State<CheckBoxContainer> createState() => _CheckBoxContainerState();
}

class _CheckBoxContainerState extends State<CheckBoxContainer> {
  bool selected = false;

  @override
  void initState() {
    selected = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      dense: true,
      activeColor: Theme.of(context).primaryColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      visualDensity: const VisualDensity(horizontal: -4.0),
      title: Text(
        widget.sectionName,
        style: Theme.of(context).textTheme.labelSmall!.merge(const TextStyle(
            fontWeight: FontWeight.w400, fontSize: 16.0, letterSpacing: 0.3)),
      ),
      value: selected,
      onChanged: (value) {
        selected = value!;
        setState(() {});
        widget.func(value);
      },
    );
  }
}
