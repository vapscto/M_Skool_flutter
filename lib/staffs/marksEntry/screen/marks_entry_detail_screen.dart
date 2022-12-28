import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/marksEntry/widget/save_button.dart';
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
            
          ],
        ),
      )),
    );
  }
}
