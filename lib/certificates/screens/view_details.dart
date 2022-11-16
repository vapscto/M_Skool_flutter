import 'package:flutter/material.dart';
import 'package:m_skool_flutter/certificates/widget/certificate_detail_item.dart';

class ViewDetails extends StatelessWidget {
  const ViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: ScrollController(),
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (_, index) {
        return CertificateDetailItem(isPending: index % 2 == 0 ? true : false);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 16.0,
        );
      },
      itemCount: 5,
    );
  }
}
