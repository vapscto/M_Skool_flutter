import 'package:flutter/material.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class ComposeTabStaff extends StatefulWidget {
  const ComposeTabStaff({super.key});

  @override
  State<ComposeTabStaff> createState() => _ComposeTabStaffState();
}

class _ComposeTabStaffState extends State<ComposeTabStaff> {
  final TextEditingController about = TextEditingController();
  final TextEditingController subject = TextEditingController();
  String? selectedradio;

  List<String> demoList = [
    'Demo',
    'Demo1',
  ];
  String selectedClass = 'Demo';
  String selectedSection = 'Demo';
  String selectedStudent = 'Demo';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: CustomContainer(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall,
                controller: subject,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 6.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: const Color(0xFFFFEBEA)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/subjectfielicon.png",
                          height: 24.0,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " Subject ",
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                    fontSize: 20.0, color: Color(0xFFFF6F67)),
                              ),
                        ),
                      ],
                    ),
                  ),
                  hintText: 'Enter here.',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomContainer(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall,
                controller: about,
                maxLines: 3,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: const Color(0xFFDBFDF5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 30.0,
                          child: Image.asset(
                            "assets/images/abouticon.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " About ",
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFF47BA9E),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                  hintText: 'Enter here.',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 33,
            child: RadioListTile(
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(horizontal: -4.0),
              title: Text(
                "Student",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.3)),
              ),
              value: "Student",
              groupValue: selectedradio,
              onChanged: (value) {
                setState(() {
                  selectedradio = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 33,
            child: RadioListTile(
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(horizontal: -4.0),
              title: Text(
                "Teachers",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.3)),
              ),
              value: "Teachers",
              groupValue: selectedradio,
              onChanged: (value) {
                setState(() {
                  selectedradio = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 33,
            child: RadioListTile(
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(horizontal: -4.0),
              title: Text(
                "HOD",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.3)),
              ),
              value: "HOD",
              groupValue: selectedradio,
              onChanged: (value) {
                setState(() {
                  selectedradio = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 33,
            child: RadioListTile(
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(horizontal: -4.0),
              title: Text(
                "Principal",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.3)),
              ),
              value: "Principal",
              groupValue: selectedradio,
              onChanged: (value) {
                setState(() {
                  selectedradio = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 33,
            child: RadioListTile(
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(horizontal: -4.0),
              title: Text(
                "Academic Supervisor",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.3)),
              ),
              value: "AS",
              groupValue: selectedradio,
              onChanged: (value) {
                setState(() {
                  selectedradio = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 30,
            child: RadioListTile(
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(horizontal: -4.0),
              title: Text(
                "Exam Co-ordinator",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.3)),
              ),
              value: "EC",
              groupValue: selectedradio,
              onChanged: (value) {
                setState(() {
                  selectedradio = value;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
              value: selectedClass,
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
                  isDense: true,
                  label: Text(
                    'Class',
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Color.fromRGBO(137, 137, 137, 1),
                          ),
                        ),
                  )
                  // label: Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  //   decoration: const BoxDecoration(
                  //     color: Color.fromRGBO(229, 243, 255, 1),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(24),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       SizedBox(
                  //         height: 33,
                  //         child: Image.asset(
                  //           'assets/images/selectteachericon.png',
                  //         ),
                  //       ),
                  //       const SizedBox(width: 10),
                  //       Text(
                  //         'Class',
                  //         style: Theme.of(context).textTheme.titleSmall!.merge(
                  //               const TextStyle(
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 20.0,
                  //                 color: Color.fromRGBO(60, 120, 170, 1),
                  //               ),
                  //             ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                  value: demoList.elementAt(index),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13, left: 5),
                    child: Text(
                      demoList.elementAt(index),
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
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
              value: selectedClass,
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
                  isDense: true,
                  label: Text(
                    'Section',
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Color.fromRGBO(60, 120, 170, 1),
                          ),
                        ),
                  )
                  // label: Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  //   decoration: const BoxDecoration(
                  //     color: Color.fromRGBO(229, 243, 255, 1),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(24),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       SizedBox(
                  //         height: 33,
                  //         child: Image.asset(
                  //           'assets/images/selectteachericon.png',
                  //         ),
                  //       ),
                  //       const SizedBox(width: 10),
                  //       Text(
                  //         'Section',
                  //         style: Theme.of(context).textTheme.titleSmall!.merge(
                  //               const TextStyle(
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 20.0,
                  //                 color: Color.fromRGBO(60, 120, 170, 1),
                  //               ),
                  //             ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                  value: demoList.elementAt(index),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13, left: 5),
                    child: Text(
                      demoList.elementAt(index),
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
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
              value: selectedClass,
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
                  isDense: true,
                  label: Text(
                    'Select Students',
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Color.fromRGBO(137, 137, 137, 1),
                          ),
                        ),
                  )
                  // label: Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  //   decoration: const BoxDecoration(
                  //     color: Color.fromRGBO(229, 243, 255, 1),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(24),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       SizedBox(
                  //         height: 33,
                  //         child: Image.asset(
                  //           'assets/images/selectteachericon.png',
                  //         ),
                  //       ),
                  //       const SizedBox(width: 10),
                  //       Text(
                  //         'Select Students',
                  //         style: Theme.of(context).textTheme.titleSmall!.merge(
                  //               const TextStyle(
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 20.0,
                  //                 color: Color.fromRGBO(60, 120, 170, 1),
                  //               ),
                  //             ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                  value: demoList.elementAt(index),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13, left: 5),
                    child: Text(
                      demoList.elementAt(index),
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
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {},
              child:
                  // const SizedBox(
                  //           height: 18,
                  //           width: 18,
                  //           child: CircularProgressIndicator(
                  //             color: Colors.white,
                  //             strokeWidth: 3,
                  //           ),
                  //         )
                  Text(
                'Send',
                style: Theme.of(context).textTheme.labelSmall!.merge(
                      const TextStyle(
                        color: Colors.white,
                        letterSpacing: 0.3,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
