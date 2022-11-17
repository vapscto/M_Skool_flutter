import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:m_skool_flutter/apis/institutional_code_api.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/institutional_code_model.dart';
import 'package:m_skool_flutter/screens/home.dart';
import 'package:m_skool_flutter/screens/institutional_login.dart';
import 'package:m_skool_flutter/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final MskoolController mskoolController = Get.put(MskoolController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //InstitutionalCodeApi.instance.loginWithInsCode("DEMOBGH");
    return Scaffold(
      body: FutureBuilder<Widget>(
          future: handleAuth(),
          builder: (context, snapshot) {
            // if (snapshot.hasData) {
            //   if (snapshot.data!.get("institutionalCode") == null) {
            //     return const InstitutionalLogin();
            //   }
            //   return LoginScreen();
            // }

            if (snapshot.hasData) {
              return snapshot.data!;
            }
            if (snapshot.hasError) {
              return Text("${snapshot.error.toString()}");
            }

            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 36,
                    child: const Icon(
                      Icons.school_outlined,
                      size: 46,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "M Skool",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .merge(const TextStyle(fontSize: 30.0)),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Future<Widget> handleAuth() async {
    try {
      if (institutionalCode!.get("institutionalCode") == null) {
        return Future.value(
          InstitutionalLogin(
            mskoolController: mskoolController,
          ),
        );
      }

      final InstitutionalCodeModel codeModel = await InstitutionalCodeApi
          .instance
          .loginWithInsCode(institutionalCode!.get("institutionalCode"), true);

      mskoolController.updateUniversalInsCodeModel(codeModel);
      if (institutionalCode!.get("isLoggedIn") == null ||
          !institutionalCode!.get("isLoggedIn")) {
        return Future.value(LoginScreen(
          mskoolController: mskoolController,
        ));
      }

      return Future.value(const Home());
    } on Exception catch (e) {
      debugPrint(e.toString());
      return Future.error("error");
    }
  }
}
