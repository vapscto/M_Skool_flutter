import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/apis/institutional_code_api.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/institutional_code_model.dart';
import 'package:m_skool_flutter/screens/login_screen.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';
import 'package:m_skool_flutter/widget/pgr_widget.dart';

class InstitutionalLogin extends StatefulWidget {
  final MskoolController mskoolController;
  const InstitutionalLogin({super.key, required this.mskoolController});

  @override
  State<InstitutionalLogin> createState() => _InstitutionalLoginState();
}

class _InstitutionalLoginState extends State<InstitutionalLogin> {
  final TextEditingController insCode = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    insCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: insCode,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text("Institutional Code"),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                MSkollBtn(
                    title: "Submit",
                    onPress: () {
                      if (insCode.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please provide an institutional code".tr);
                        return;
                      }

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: FutureBuilder<InstitutionalCodeModel>(
                                future: InstitutionalCodeApi.instance
                                    .loginWithInsCode(insCode.text, false),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    widget.mskoolController
                                        .updateUniversalInsCodeModel(
                                            snapshot.data!);
                                    return Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            radius: 36.0,
                                            backgroundImage: NetworkImage(
                                                snapshot.data!.institutioNLOGO),
                                          ),
                                          const SizedBox(
                                            height: 16.0,
                                          ),
                                          Text(
                                            snapshot.data!.institutioNNAME,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .merge(
                                                  const TextStyle(
                                                      fontSize: 20.0),
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            "We successfully found institution with this code, you can now continue with next step",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!,
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
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                            onPressed: () async {
                                              await importantIds!.put(URLS.miId,
                                                  snapshot.data!.miId);
                                              await importantIds!.put(
                                                  URLS.userId,
                                                  snapshot.data!.userId);

                                              await importantIds!.put(
                                                  URLS.asmayId,
                                                  snapshot.data!.asmaYId);
                                              await importantIds!
                                                  .put(URLS.ivrmrtId, 0);
                                              await importantIds!.put(
                                                  URLS.amstId,
                                                  snapshot.data!.amstId);
                                              // await importantIds!.put(URLS.hrmeId, snapshot.data)

                                              // await importantIds!
                                              //     .put(URLS.ivrmrtRole, "N/A");

                                              institutionalCode!
                                                  .put(
                                                "institutionalCode",
                                                snapshot.data!.institutecode,
                                              )
                                                  .then(
                                                (value) {
                                                  Navigator.pop(context);
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (_) {
                                                        return LoginScreen(
                                                          mskoolController: widget
                                                              .mskoolController,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );

                                              // Navigator.pop(context);

                                              // debugPrint(
                                              //     snapshot.data!.institutecode);
                                            },
                                            child: Text(
                                              "Continue",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .merge(
                                                    const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                  if (snapshot.hasError) {
                                    Map<String, dynamic> err =
                                        snapshot.error as Map<String, dynamic>;
                                    return ErrWidget(err: err);
                                  }

                                  return const ProgressWidget();
                                }),
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
