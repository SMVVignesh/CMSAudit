import 'package:cms_audit/core/constants/constants.dart';
import 'package:cms_audit/core/utils/utils.dart';
import 'package:cms_audit/presentation/base/custom_state.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/localizations/localizations.dart';

import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:tool_kit/tool_kit.dart';
import '../../../../core/constants/language_constants.dart';
import '../../../../core/utils/custom_color.dart';
import '../../../../core/utils/loading_button.dart';
import '../../../../data/login/new_login_response.dart';
import '../../../../domain/api/api_repository.dart';
import '../../../../domain/local_data_base/data_base_repository.dart';
import '../../../../domain/share_preference/shared_preference_repository.dart';
import '../model/login_response.dart';

/*
* This is Login Page
* */
class LoginPage extends StatefulWidget {
  bool isLoading = false;
  TextEditingController? emailController = TextEditingController();
  TextEditingController? tenantController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends CustomState<LoginPage> {
  bool _passwordVisible = false;
  Paint linePaint = Paint()
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke
    ..color = Colors.white;

  @override
  void initState() {
    super.initState();
  }

  @override
  String setScreen() {
    return LOGIN_SCREEN;
  }

  @override
  Widget myBuild(BuildContext context) {
    closeRemainingScreens();

    double topPadding = 53;
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: topPadding,
                ),
                Image.asset(
                  "assets/image/app_icon.png",
                  height: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "CMS Audit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                getLoginComponent(
                    AppLocalizations.of(context)!.trans(EMAIL),
                    AppLocalizations.of(context)!.trans(EMAIL_HINT),
                    widget.emailController),
                getPasswordComponent(
                    AppLocalizations.of(context)!.trans(PASSWORD),
                    AppLocalizations.of(context)!.trans(PASSWORD_HINT),
                    widget.passwordController),
                getLoginComponent(
                    AppLocalizations.of(context)!.trans(TENANT),
                    AppLocalizations.of(context)!.trans(TENANT_HINT),
                    widget.tenantController),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: LoadingButton(
                      btnName: AppLocalizations.of(context)!.trans(SIGN_IN),
                      isLoading: widget.isLoading,
                      callback: () {
                        validateFields(context);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*This method will return the Email Component with header*/
  Widget getLoginComponent(String header, String hint,
      TextEditingController? textEditingController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
              color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 56,
          child: TextField(
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  /*This method will return the Password Component with header and Forgot Password option
  */
  Widget getPasswordComponent(String header, String hint,
      TextEditingController? textEditingController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                header,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //
            //   },
            //   child: Text(
            //     AppLocalizations.of(context)!.trans(FORGOT_PASSWORD),
            //     style: const TextStyle(
            //         color: CustomColor.white,
            //         fontSize: 13,
            //         fontWeight: FontWeight.normal),
            //   ),
            // )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 56,
          child: TextField(
            textInputAction: TextInputAction.next,
            obscureText: !_passwordVisible,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            controller: textEditingController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.only(
                    left: 10, right: 10, top: 2, bottom: 2),
                hintText: hint,
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: CustomColor.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )),
          ),
        )
      ],
    );
  }

/*
This method is used to validate the email, password and tenant
if all fields are validated this is going to call  Login api
 */
  void validateFields(BuildContext context) async {
    String? email = widget.emailController?.text.trim();
    String? password = widget.passwordController?.text.trim();
    String? tenant = widget.tenantController?.text.trim();
    if (email?.isEmpty ?? true) {
      SnackBarUtils.showError(
          context, AppLocalizations.of(context)?.trans(PLEASE_ENTER_EMAIL));
    } else if (password?.isEmpty ?? true) {
      SnackBarUtils.showError(
          context, AppLocalizations.of(context)?.trans(PLEASE_ENTER_PASSWORD));
    } else if (tenant?.isEmpty ?? true) {
      SnackBarUtils.showError(
          context, AppLocalizations.of(context)?.trans(PLEASE_ENTER_TENANT));
    } else if (!Utils.isValidEmail(email)) {
      SnackBarUtils.showError(context,
          AppLocalizations.of(context)?.trans(PLEASE_ENTER_VALID_EMAIL));
    } else {
      bool result = await InternetInfoUtils.hasConnection();
      if (result == true) {
        setState(() {
          widget.isLoading = true;
        });
        try  {
          LoginResponse newLoginResponse =
              await ApiRepository().loginApi(email ?? "", password ?? "",tenant??"");

          await SharedPreferenceRepository()
              .setAccessToken(newLoginResponse.token ?? "");
          await SharedPreferenceRepository().setEmail(email);
          await SharedPreferenceRepository().saveLoginData(newLoginResponse);

          SnackBarUtils.showSuccess(context,
              AppLocalizations.of(context)!.trans(LOGGED_IN_SUCCESSFULLY));
          Navigator.pushReplacementNamed(context, AppRoute.getScreenRoute(HOME_SCREEN));
        } on UnauthorisedException {
          SnackBarUtils.showError(context,
              AppLocalizations.of(context)!.trans(INVALID_CREDENTIALS));
        } on ApiException catch (e) {
          SnackBarUtils.showError(context, e.message);
        } catch (e) {
          SnackBarUtils.showError(context, e.toString());
        }
        setState(() {
          widget.isLoading = false;
        });
      } else {
        if (context.mounted) {
          SnackBarUtils.showError(
              context,
              AppLocalizations.of(context)!
                  .trans(NO_INTERNET_CONNECTION_MESSAGE));
        }
      }
    }
  }
}
