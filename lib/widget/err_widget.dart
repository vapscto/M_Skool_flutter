import 'package:flutter/material.dart';

class ErrWidget extends StatelessWidget {
  const ErrWidget({
    Key? key,
    required this.err,
  }) : super(key: key);

  final Map<String, dynamic> err;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.red,
            radius: 36.0,
            child: Icon(
              Icons.close_rounded,
              color: Colors.white,
              size: 36.0,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            err['errorTitle'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.merge(
                  const TextStyle(fontSize: 20.0),
                ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            err['errorMsg'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!,
          ),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                50,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Close",
              style: Theme.of(context).textTheme.labelMedium!.merge(
                    const TextStyle(color: Colors.white),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
