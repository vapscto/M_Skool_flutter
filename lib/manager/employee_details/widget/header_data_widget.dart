import 'package:flutter/material.dart';

class HeaderDataWidget extends StatefulWidget {
  final String name;
  Function(Map<String, dynamic>)? addfunction;
  Function(String)? removefunction;
  String? id;
  HeaderDataWidget({
    super.key,
    required this.name,
    this.id,
    this.addfunction,
    this.removefunction,
  });

  @override
  State<HeaderDataWidget> createState() => _HeaderDataWidgetState();
}

class _HeaderDataWidgetState extends State<HeaderDataWidget> {
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
              fontWeight: FontWeight.w400, fontSize: 14.0, letterSpacing: 0.3)),
        ),
        value: ee,
        onChanged: (value) {
          setState(() {
            ee = value!;
          });
          if (value!) {
            widget.addfunction!(
                {"columnID": widget.id, "columnName": widget.name});
            return;
          }
          widget.removefunction!(widget.id!);
        },
      ),
    );
  }
}
