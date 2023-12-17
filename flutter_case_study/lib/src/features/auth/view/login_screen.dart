import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_case_study/src/core/widgets/button.dart';
import 'package:flutter_case_study/src/core/widgets/text_form_fields.dart';
import 'package:flutter_case_study/src/localization/locale_keys.g.dart';
import 'package:flutter_case_study/src/riverpods.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(child: Text(LocaleKeys.login_screen.tr())),
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) {
              final authNotifier = ref.watch(authProvider.notifier);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextFormField(
                      controller: emailController,
                      label: LocaleKeys.email_text_field.tr(),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return LocaleKeys.email_isEmpty_text.tr();
                        } else if (!p0.contains('@')) {
                          return LocaleKeys.email_isValid_text.tr();
                        }
                        return null;
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  AppTextFormField(
                    controller: passwordController,
                    label: LocaleKeys.pass_text_field.tr(),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: false,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return LocaleKeys.password_isEmpty_text.tr();
                      } else if (p0.length < 6) {
                        return LocaleKeys.password_isValid_text.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  OrangeButton(
                      onPressed: () {
                        authNotifier.login(emailController.text,
                            passwordController.text, context);
                      },
                      text: LocaleKeys.login_btn.tr())
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
/*

   return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextFormField(
                          controller: emailController,
                          label: LocaleKeys.email_text_field.tr(),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return LocaleKeys.email_isEmpty_text.tr();
                            } else if (!p0.contains('@')) {
                              return LocaleKeys.email_isValid_text.tr();
                            }
                            return null;
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      AppTextFormField(
                        controller: passwordController,
                        label: LocaleKeys.pass_text_field.tr(),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: false,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return LocaleKeys.password_isEmpty_text.tr();
                          } else if (p0.length < 6) {
                            return LocaleKeys.password_isValid_text.tr();
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      OrangeButton(
                          onPressed: () {}, text: LocaleKeys.login_btn.tr())
                    ],
                  );


*/