import 'package:flutter/material.dart';
import 'package:m_skool_flutter/manager/student_details/controller/custom_search_handler.dart';
import 'package:m_skool_flutter/manager/student_details/model/search_types.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class SearchTypeHandler extends StatefulWidget {
  final CustomSearchHandler handler;
  const SearchTypeHandler({super.key, required this.handler});

  @override
  State<SearchTypeHandler> createState() => _SearchTypeHandlerState();
}

class _SearchTypeHandlerState extends State<SearchTypeHandler> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> selectedType = SearchTypes.instance.getTypes.first;
    Map<String, dynamic> selectedOperator =
        SearchTypes.instance.operators.first;

    Map<String, dynamic> condition = SearchTypes.instance.conditions.first;

    return Column(
      children: [
        widget.handler.options.length > 1
            ? CustomContainer(
                child: DropdownButtonFormField<Map<String, dynamic>>(
                    value: condition,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(fontSize: 16.0),
                        ),
                    decoration: InputDecoration(
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
                      label: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFDFFBFE),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/images/cap.png",
                              height: 24.0,
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              " Conditions ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .merge(
                                    const TextStyle(
                                        backgroundColor: Color(0xFFDFFBFE),
                                        fontSize: 20.0,
                                        color: Color(0xFF28B6C8)),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.only(top: 4.5),
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 30,
                      ),
                    ),
                    items: SearchTypes.instance.conditions
                        .map((e) => DropdownMenuItem<Map<String, dynamic>>(
                            value: e,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, left: 5),
                              child: Text(e['name']!),
                            )))
                        .toList(),
                    onChanged: (e) async {}),
              )
            : const SizedBox(),
        CustomContainer(
          child: DropdownButtonFormField<Map<String, dynamic>>(
              value: selectedType,
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(fontSize: 16.0),
                  ),
              decoration: InputDecoration(
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
                label: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFDFFBFE),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/cap.png",
                        height: 24.0,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        " Type ",
                        style: Theme.of(context).textTheme.labelMedium!.merge(
                              const TextStyle(
                                  backgroundColor: Color(0xFFDFFBFE),
                                  fontSize: 20.0,
                                  color: Color(0xFF28B6C8)),
                            ),
                      ),
                    ],
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
              icon: const Padding(
                padding: EdgeInsets.only(top: 4.5),
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
              ),
              items: SearchTypes.instance.getTypes
                  .map((e) => DropdownMenuItem<Map<String, dynamic>>(
                      value: e,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 5),
                        child: Text(e['name']!),
                      )))
                  .toList(),
              onChanged: (e) async {
                selectedType = e!;
                setState(() {});
              }),
        ),
        const SizedBox(
          height: 32.0,
        ),
        CustomContainer(
          child: DropdownButtonFormField<Map<String, dynamic>>(
              value: selectedOperator,
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(fontSize: 16.0),
                  ),
              decoration: InputDecoration(
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
                label: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFDFFBFE),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/cap.png",
                        height: 24.0,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        " Operators ",
                        style: Theme.of(context).textTheme.labelMedium!.merge(
                              const TextStyle(
                                  backgroundColor: Color(0xFFDFFBFE),
                                  fontSize: 20.0,
                                  color: Color(0xFF28B6C8)),
                            ),
                      ),
                    ],
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
              icon: const Padding(
                padding: EdgeInsets.only(top: 4.5),
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
              ),
              items: SearchTypes.instance.operators
                  .map((e) => DropdownMenuItem<Map<String, dynamic>>(
                      value: e,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 5),
                        child: Text(e['name']!),
                      )))
                  .toList(),
              onChanged: (e) async {}),
        ),
        const SizedBox(
          height: 32.0,
        ),
        CustomContainer(
            child: TextField(
          keyboardType: selectedType['keyboardType'] as TextInputType,
          decoration: InputDecoration(
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
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDFFBFE),
                borderRadius: BorderRadius.circular(24.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/cap.png",
                    height: 24.0,
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    " Value ",
                    style: Theme.of(context).textTheme.labelMedium!.merge(
                          const TextStyle(
                              backgroundColor: Color(0xFFDFFBFE),
                              fontSize: 20.0,
                              color: Color(0xFF28B6C8)),
                        ),
                  ),
                ],
              ),
            ),
            border: const OutlineInputBorder(),
          ),
        )),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
