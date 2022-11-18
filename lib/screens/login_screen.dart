import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:m_skool_flutter/apis/authenticate_user_api.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/categories_api_item.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/screens/home.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:m_skool_flutter/widget/pgr_widget.dart';

class LoginScreen extends StatefulWidget {
  final MskoolController mskoolController;
  const LoginScreen({super.key, required this.mskoolController});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userName,
              decoration: const InputDecoration(
                filled: true,
                label: Text(
                  "Username",
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                filled: true,
                label: Text(
                  "Password",
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                if (userName.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Please provide a valid username");
                  return;
                }
                if (password.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Please provide a valid password");
                }

                // AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
                // logger.d(info.toMap());

                String loginBaseUrl = "";
                for (int i = 0;
                    i <
                        widget.mskoolController.universalInsCodeModel!.value
                            .apiarray.values.length;
                    i++) {
                  final CategoriesApiItem apiItem = widget.mskoolController
                      .universalInsCodeModel!.value.apiarray.values
                      .elementAt(i);
                  if (apiItem.iivrscurLAPIName.toLowerCase() == "login") {
                    loginBaseUrl = apiItem.iivrscurLAPIURL;
                  }
                }
                await Future.delayed(const Duration(milliseconds: 200));
                showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: FutureBuilder<LoginSuccessModel>(
                            future:
                                AuthenticateUserApi.instance.authenticateNow(
                              userName.text,
                              password.text,
                              widget.mskoolController.universalInsCodeModel!
                                  .value.miId,
                              loginBaseUrl,
                            ),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey.shade100,
                                        radius: 36.0,
                                        backgroundImage: NetworkImage(
                                            snapshot.data!.userImagePath!),
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                      Text(
                                        snapshot.data!.userName!,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .merge(
                                              const TextStyle(fontSize: 20.0),
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        "Welcom back ${snapshot.data!.userName}, you can now continue to home screen",
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
                                          Navigator.pop(context);

                                          logInBox!.put("isLoggedIn", true);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) {
                                                return Home(
                                                  loginSuccessModel:
                                                      snapshot.data!,
                                                  mskoolController:
                                                      widget.mskoolController,
                                                );
                                              },
                                            ),
                                          );
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
                                final Map<String, dynamic> err =
                                    snapshot.error as Map<String, dynamic>;
                                return ErrWidget(
                                  err: err,
                                );
                              }
                              return const ProgressWidget();
                            }),
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55)),
              child: Text(
                "Continue",
                style: Theme.of(context).textTheme.titleMedium!.merge(
                      const TextStyle(
                        color: Colors.white,
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
