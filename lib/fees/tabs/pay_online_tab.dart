import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PayOnlineTab extends StatefulWidget {
  const PayOnlineTab({super.key});

  @override
  State<PayOnlineTab> createState() => _PayOnlineTabState();
}

class _PayOnlineTabState extends State<PayOnlineTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('pay online'),
    );
  }
}
