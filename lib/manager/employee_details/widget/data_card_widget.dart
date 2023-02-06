import 'package:flutter/material.dart';

class DataCardWidget extends StatefulWidget {
  final String header;
  const DataCardWidget({super.key, required this.header});

  @override
  State<DataCardWidget> createState() => _DataCardWidgetState();
}

class _DataCardWidgetState extends State<DataCardWidget> {
  bool ee = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        checkboxShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        dense: true,
        activeColor: Theme.of(context).primaryColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        visualDensity: const VisualDensity(horizontal: -4.0),
        title: Text(
          widget.header,
          style: Theme.of(context).textTheme.labelSmall!.merge(const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14.0, letterSpacing: 0.3)),
        ),
        value: ee,
        onChanged: (value) {
          setState(() {
            ee = value!;
          });
        },
      ),
    );
  }
}
