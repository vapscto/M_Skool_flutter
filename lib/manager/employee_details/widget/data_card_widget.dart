import 'package:flutter/material.dart';

class DataCardWidget extends StatefulWidget {
  final String name;
  Function(int)? addfunction;
  Function(int)? removefunction;
  int? id;

  DataCardWidget({
    super.key,
    required this.name,
    this.id,
    this.addfunction,
    this.removefunction,
  });

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
          widget.name,
          style: Theme.of(context).textTheme.labelSmall!.merge(const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 13.0, letterSpacing: 0.3)),
        ),
        value: ee,
        onChanged: (value) {
          setState(() {
            ee = value!;
          });
          if (value!) {
            widget.addfunction!(widget.id!);
            return;
          }
          widget.removefunction!(widget.id!);
        },
      ),
    );
  }
}
