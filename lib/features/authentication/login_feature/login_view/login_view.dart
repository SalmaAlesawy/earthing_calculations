import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/CustemTextformField.dart';
import 'package:earthing_calc/core/widgets/CustomElevatedButton.dart';
import 'package:earthing_calc/core/widgets/CustomeTextButton.dart';
import 'package:earthing_calc/features/authentication/login_feature/login_view_model/login_cubit/login_cubit.dart';
import 'package:earthing_calc/features/authentication/login_feature/login_view_model/password_visibility_cubit/password_visibility_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: Assets.images.logo.provider(),
            ),
            SizedBox(height: 15),
            Text(
              "SOIL RESISTIVITY &",
              style: textTheme.titleLarge?.copyWith(color: ColorsPalette.white),
            ),
            Text(
              "EARTHING CALCULATOR",
              style: textTheme.titleLarge?.copyWith(
                color: ColorsPalette.mainOrange,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 10,
              ),
              child: Align(
                alignment: AlignmentGeometry.centerStart,
                child: BlocProvider(
                  create: (context) => PasswordVisibilityCubit(),
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      LoginCubit loginCubit = context.read<LoginCubit>();
                      return Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Welcome Back", style: textTheme.titleLarge),
                            Text(
                              "Sign in to Continue",
                              style: textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: ColorsPalette.grayText,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 10),
                            Custemtextformfield(
                              controller: loginCubit.emailController,
                              hintText: "Email",
                              obscureText: false,
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                            SizedBox(height: 10),
                            BlocBuilder<
                              PasswordVisibilityCubit,
                              PasswordVisibilityState
                            >(
                              builder: (context, state) {
                                PasswordVisibilityCubit passwordCubit = context
                                    .read<PasswordVisibilityCubit>();
                                return Custemtextformfield(
                                  controller: loginCubit.passwordController,
                                  hintText: "Password",
                                  obscureText:
                                      passwordCubit.loginPasswordVisibility,
                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    onPressed: passwordCubit.visibilityPassword,
                                    icon: passwordCubit.loginPasswordVisibility
                                        ? Icon(Icons.visibility_outlined)
                                        : Icon(Icons.visibility_off_outlined),
                                  ),
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentGeometry.centerEnd,
                              child: CustomTextButton(
                                textButton: "Forget Password",
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 20),
                            Customelevatedbutton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  PageRouteNames.navigationScreen,
                                );
                              },
                              buttonText: "Sign In",
                              backGroundColor: WidgetStatePropertyAll(
                                ColorsPalette.buttonsOrange,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: textTheme.titleSmall?.copyWith(
                                    color: ColorsPalette.grayText,
                                  ),
                                ),
                                CustomTextButton(
                                  textButton: "Sign Up",
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      PageRouteNames.registerScreen,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
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
