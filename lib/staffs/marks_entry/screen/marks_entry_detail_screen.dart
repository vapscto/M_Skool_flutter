import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/save_button.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';

class MarksEntryDetailScreen extends StatefulWidget {
  const MarksEntryDetailScreen({super.key});

  @override
  State<MarksEntryDetailScreen> createState() => _MarksEntryDetailScreenState();
}

class _MarksEntryDetailScreenState extends State<MarksEntryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 25,
        title: const Text('Marks Entry'),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: SaveBtn(
              title: 'Save',
              onPress: () {},
            ),
          ),
        ],
      ),
      floatingActionButton: const HomeFab(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFDFD6),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 160,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Maximum Marks : ',
                    style: Theme.of(context).textTheme.labelMedium!.merge(
                          const TextStyle(
                            fontSize: 14.0,
                            color: Color(0xffF24E1E),
                          ),
                        ),
                  ),
                  Text(
                    '20',
                    style: Theme.of(context).textTheme.labelMedium!.merge(
                          const TextStyle(
                            fontSize: 14.0,
                            color: Color(0xffE13C3C),
                          ),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: DataTable(
                  dataTextStyle: const TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(0, 0, 0, 0.95),
                      fontWeight: FontWeight.w500),
                  dataRowHeight: 35,
                  headingRowHeight: 40,
                  horizontalMargin: 10,
                  columnSpacing: 40,
                  dividerThickness: 1,
                  headingTextStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                  border: TableBorder.all(
                      borderRadius: BorderRadius.circular(15), width: 0.5),
                  // showBottomBorder: true,
                  headingRowColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  columns: const [
                    DataColumn(
                      numeric: true,
                      label: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'S.No',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Name',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Adm.No',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Enter Marks',
                          style: TextStyle(
                              fontSize: 14, overflow: TextOverflow.clip),
                        ),
                      ),
                    ),
                  ],

                  rows: List.generate(3, (index) {
                    var i = index + 1;
                    return DataRow(
                      cells: [
                        DataCell(Align(
                            alignment: Alignment.center, child: Text('$i'))),
                        const DataCell(Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Ankush'))),
                        const DataCell(Align(
                            alignment: Alignment.center,
                            child: Text('2013-410'))),
                        DataCell(
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
