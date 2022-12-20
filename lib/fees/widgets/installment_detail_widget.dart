import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m_skool_flutter/main.dart';

import 'custom_analysis_container.dart';

class InstallmentDetailWidget extends StatefulWidget {
  String leadText;
  final String instalText;
  final double netAmount;
  final double concessionAmount;
  final double paidAmount;
  final double balanceAmount;

  InstallmentDetailWidget({
    super.key,
    required this.leadText,
    required this.instalText,
    required this.netAmount,
    required this.concessionAmount,
    required this.paidAmount,
    required this.balanceAmount,
  });

  @override
  State<InstallmentDetailWidget> createState() =>
      _InstallmentDetailWidgetState();
}

class _InstallmentDetailWidgetState extends State<InstallmentDetailWidget> {
  @override
  Widget build(BuildContext context) {
    logger.d(widget.leadText);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: widget.leadText == 'Tution Fees'
              ? const Color.fromRGBO(255, 235, 212, 0.4)
              : widget.leadText == 'Term Fees'
                  ? const Color.fromRGBO(238, 232, 255, 0.4)
                  : const Color.fromRGBO(25, 2552, 255, 1),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 8, top: 12, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.leadText,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                            letterSpacing: 0.2,
                          ),
                        ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    height: 30,
                    decoration: BoxDecoration(
                      color: widget.leadText == 'Tution Fees'
                          ? const Color.fromRGBO(251, 213, 170, 1)
                          : widget.leadText == 'Term Fees'
                              ? const Color.fromRGBO(209, 193, 255, 1)
                              : const Color.fromRGBO(25, 2552, 25, 1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.instalText,
                        style: Theme.of(context).textTheme.titleSmall!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(26, 26, 26, 1)),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              thickness: 1,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 6, right: 10, top: 8, bottom: 8),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '₹${widget.netAmount}',
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.0,
                                      ),
                                    ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            '  Total\nCharges',
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      thickness: 1,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '₹${widget.paidAmount}',
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.0,
                                      ),
                                    ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            " \nTotal Paid",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      thickness: 1,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '₹${widget.concessionAmount}',
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.0,
                                      ),
                                    ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '      Total\nConcession',
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      thickness: 1,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '₹${widget.balanceAmount}',
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.0,
                                      ),
                                    ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '   Now\nPayable',
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
