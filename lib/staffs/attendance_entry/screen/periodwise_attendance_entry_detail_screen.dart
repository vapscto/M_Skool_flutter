import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/save_button.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';

class PeriodWiseAttendanceEntryDetailScreen extends StatefulWidget {
  const PeriodWiseAttendanceEntryDetailScreen({super.key});

  @override
  State<PeriodWiseAttendanceEntryDetailScreen> createState() =>
      _PeriodWiseAttendanceEntryDetailScreenState();
}

class _PeriodWiseAttendanceEntryDetailScreenState
    extends State<PeriodWiseAttendanceEntryDetailScreen> {
  bool selectAll = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 25,
        title: const Text('Attendance Entry'),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16.0),
            child: SaveBtn(
              title: 'Save',
              onPress: () {},
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 70),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: InkWell(
              child: Container(
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      Colors.white, //Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text("Search",
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.grey.withOpacity(0.6),
                                )),
                      ),
                      const SizedBox(
                        width: 220,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
      ),
      floatingActionButton: const HomeFab(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 33,
                child: CheckboxListTile(
                  dense: true,
                  activeColor: Theme.of(context).primaryColor,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  visualDensity: const VisualDensity(horizontal: -4.0),
                  title: Text(
                    "Select All",
                    style: Theme.of(context).textTheme.labelSmall!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            letterSpacing: 0.3)),
                  ),
                  value: selectAll,
                  onChanged: (value) {
                    setState(() {
                      selectAll = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: DataTable(
                    dataTextStyle: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, 0.95),
                        fontWeight: FontWeight.w500),
                    dataRowHeight: 37,
                    headingRowHeight: 40,
                    horizontalMargin: 8,
                    columnSpacing: 10,
                    dividerThickness: 1,
                    headingTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                    border: TableBorder.all(
                        borderRadius: BorderRadius.circular(12), width: 0.5),
                    // showBottomBorder: true,
                    headingRowColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
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
                            '  Name',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '  Roll No',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '  Adm. No',
                            style: TextStyle(
                                fontSize: 14, overflow: TextOverflow.clip),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '  Attendance',
                            style: TextStyle(
                                fontSize: 14, overflow: TextOverflow.clip),
                          ),
                        ),
                      ),
                    ],

                    rows: List.generate(10, (index) {
                      var i = index + 1;
                      return DataRow(
                        cells: [
                          DataCell(Align(
                              alignment: Alignment.center, child: Text('$i'))),
                          const DataCell(
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('  Ankush'),
                            ),
                          ),
                          DataCell(
                            Align(
                              alignment: Alignment.center,
                              child: Text(' $i'),
                            ),
                          ),
                          const DataCell(
                            Align(
                              alignment: Alignment.center,
                              child: Text('  2013-410'),
                            ),
                          ),
                          DataCell(
                            Align(
                              alignment: Alignment.center,
                              child: Checkbox(value: false, onChanged: (_) {}),
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
        ),
      ),
    );
  }
}
