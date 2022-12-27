import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/marksEntry/widget/dropdown_label.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

import '../../../widget/custom_back_btn.dart';

class MarksEntryHome extends StatefulWidget {
  const MarksEntryHome({super.key});

  @override
  State<MarksEntryHome> createState() => _MarksEntryHomeState();
}

class _MarksEntryHomeState extends State<MarksEntryHome> {
  List<String> demoList = [
    'Demo',
    'Demo1',
    'Demo3',
    'Demo5',
  ];
  String slected = 'Demo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 25,
        title: const Text('Marks Entry'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 8,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  value: slected,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    isDense: true,
                    label: DropDownLabel(
                      icon: 'assets/images/hat.png',
                      containerColor: Color.fromRGBO(223, 251, 254, 1),
                      text: 'Academic Year',
                      textColor: Color.fromRGBO(40, 182, 200, 1),
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30,
                    ),
                  ),
                  iconSize: 30,
                  items: List.generate(demoList.length, (index) {
                    return DropdownMenuItem(
                      value: demoList[index],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13, left: 5),
                        child: Text(
                          demoList[index],
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 0.3)),
                        ),
                      ),
                    );
                  }),
                  onChanged: (s) {
                    // selectedStaff = s!;
                    // logger.d(s.hrmEId.toString());
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 8,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  value: slected,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    isDense: true,
                    label: DropDownLabel(
                      icon: 'assets/images/hat.png',
                      containerColor: Color.fromRGBO(255, 235, 234, 1),
                      text: 'Class',
                      textColor: Color.fromRGBO(255, 111, 103, 1),
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30,
                    ),
                  ),
                  iconSize: 30,
                  items: List.generate(demoList.length, (index) {
                    return DropdownMenuItem(
                      value: demoList[index],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13, left: 5),
                        child: Text(
                          demoList[index],
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 0.3)),
                        ),
                      ),
                    );
                  }),
                  onChanged: (s) {
                    // selectedStaff = s!;
                    // logger.d(s.hrmEId.toString());
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 8,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  value: slected,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    isDense: true,
                    label: DropDownLabel(
                      icon: 'assets/images/hat.png',
                      containerColor: Color.fromRGBO(219, 253, 245, 1),
                      text: 'Section',
                      textColor: Color.fromRGBO(71, 186, 158, 1),
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30,
                    ),
                  ),
                  iconSize: 30,
                  items: List.generate(demoList.length, (index) {
                    return DropdownMenuItem(
                      value: demoList[index],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13, left: 5),
                        child: Text(
                          demoList[index],
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 0.3)),
                        ),
                      ),
                    );
                  }),
                  onChanged: (s) {
                    // selectedStaff = s!;
                    // logger.d(s.hrmEId.toString());
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 8,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  value: slected,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    isDense: true,
                    label: DropDownLabel(
                      icon: 'assets/images/hat.png',
                      containerColor: Color.fromRGBO(229, 243, 255, 1),
                      text: 'Exam',
                      textColor: Color.fromRGBO(62, 120, 170, 1),
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30,
                    ),
                  ),
                  iconSize: 30,
                  items: List.generate(demoList.length, (index) {
                    return DropdownMenuItem(
                      value: demoList[index],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13, left: 5),
                        child: Text(
                          demoList[index],
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 0.3)),
                        ),
                      ),
                    );
                  }),
                  onChanged: (s) {
                    // selectedStaff = s!;
                    // logger.d(s.hrmEId.toString());
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 8,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  value: slected,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    isDense: true,
                    label: DropDownLabel(
                      icon: 'assets/images/hat.png',
                      containerColor: Color.fromRGBO(238, 232, 255, 1),
                      text: 'Subject Name',
                      textColor: Color.fromRGBO(111, 88, 180, 1),
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30,
                    ),
                  ),
                  iconSize: 30,
                  items: List.generate(demoList.length, (index) {
                    return DropdownMenuItem(
                      value: demoList[index],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13, left: 5),
                        child: Text(
                          demoList[index],
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 0.3)),
                        ),
                      ),
                    );
                  }),
                  onChanged: (s) {
                    // selectedStaff = s!;
                    // logger.d(s.hrmEId.toString());
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 8,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  value: slected,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    isDense: true,
                    label: DropDownLabel(
                      icon: 'assets/images/hat.png',
                      containerColor: Color.fromRGBO(252, 244, 222, 1),
                      text: 'Sub Subject',
                      textColor: Color.fromRGBO(206, 167, 61, 1),
                    ),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30,
                    ),
                  ),
                  iconSize: 30,
                  items: List.generate(demoList.length, (index) {
                    return DropdownMenuItem(
                      value: demoList[index],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13, left: 5),
                        child: Text(
                          demoList[index],
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 0.3)),
                        ),
                      ),
                    );
                  }),
                  onChanged: (s) {
                    // selectedStaff = s!;
                    // logger.d(s.hrmEId.toString());
                  },
                ),
              ),
              const SizedBox(height: 20),
              MSkollBtn(title: 'View Details', onPress: () {}),
              // Image.asset('assets/images/.png')
            ],
          ),
        ),
      ),
    );
  }
}
