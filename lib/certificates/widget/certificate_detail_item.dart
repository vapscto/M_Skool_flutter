import 'package:flutter/material.dart';
import 'package:m_skool_flutter/certificates/model/stud_list.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class CertificateDetailItem extends StatelessWidget {
  final StudListValues values;
  const CertificateDetailItem({
    super.key,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 18.0,
                  color: values.ascAStatus!.toLowerCase() == "pending"
                      ? Colors.grey.shade600
                      : Colors.green,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  values.ascAStatus!,
                  style: Theme.of(context).textTheme.labelMedium!.merge(
                        TextStyle(
                          fontSize: 17.0,
                          color: values.ascAStatus!.toLowerCase() == "pending"
                              ? Colors.grey.shade600
                              : Colors.green,
                        ),
                      ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  values.acertapPCertificateName!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text("Reason will go here"),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                    "Applied Date  : ${getFormatedDate(DateTime.parse(values.ascAApplyDate!))}")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
