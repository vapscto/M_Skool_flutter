import 'package:flutter/material.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class CertificateDetailItem extends StatelessWidget {
  final bool isPending;
  const CertificateDetailItem({super.key, required this.isPending});

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
                  color: isPending ? Colors.grey.shade600 : Colors.green,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  isPending ? "Pending" : "Completed",
                  style: Theme.of(context).textTheme.labelMedium!.merge(
                        TextStyle(
                          fontSize: 17.0,
                          color:
                              isPending ? Colors.grey.shade600 : Colors.green,
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
                  "Transfer Certificate",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text("Reason will go here"),
                const SizedBox(
                  height: 8.0,
                ),
                Text("Applied Date  :  11 Nov 2022")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
