import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/CustemTextformField.dart';
import 'package:earthing_calc/core/widgets/CustomElevatedButton.dart';
import 'package:earthing_calc/core/widgets/CustomeTextButton.dart';
import 'package:earthing_calc/features/authentication/register_feature/register_view_model/password_confirm_visibility_cubit/register_password_confirm_cubit.dart';
import 'package:earthing_calc/features/authentication/register_feature/register_view_model/password_visibility_cubit/register_password_visibilty_cubit.dart';
import 'package:earthing_calc/features/authentication/register_feature/register_view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
              backgroundImage: Assets.images.bahraLogo.provider(),
            ),
            SizedBox(height: 15),
            Text(
              "Create Account",
              style: textTheme.titleLarge?.copyWith(
                color: ColorsPalette.white,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => RegisterPasswordVisibilityCubit(),
                  ),
                  BlocProvider(
                    create: (context) =>
                        RegisterPasswordConfirmVisibilityConfirmCubit(),
                  ),
                ],
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    RegisterCubit registerCubit = context.read<RegisterCubit>();
                    return Form(
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Custemtextformfield(
                            controller: registerCubit.fullNameController,
                            hintText: "Full Name",
                            obscureText: false,
                            prefixIcon: Icon(Icons.person_2_outlined),
                          ),
                          Custemtextformfield(
                            controller: registerCubit.emailController,
                            hintText: "Email",
                            obscureText: false,
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          BlocBuilder<
                            RegisterPasswordVisibilityCubit,
                            RegisterPasswordVisibilityState
                          >(
                            builder: (context, state) {
                              RegisterPasswordVisibilityCubit
                              passwordVisibilityCubit = context
                                  .read<RegisterPasswordVisibilityCubit>();
                              return Custemtextformfield(
                                controller: registerCubit.passwordController,
                                hintText: "Password",
                                obscureText: passwordVisibilityCubit
                                    .registerPasswordVisibility,
                                prefixIcon: Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    passwordVisibilityCubit
                                        .registerVisibilityPassword();
                                  },
                                  icon:
                                      passwordVisibilityCubit
                                          .registerPasswordVisibility
                                      ? Icon(Icons.visibility_outlined)
                                      : Icon(Icons.visibility_off_outlined),
                                ),
                              );
                            },
                          ),
                          BlocBuilder<
                            RegisterPasswordConfirmVisibilityConfirmCubit,
                            RegisterPasswordConfirmState
                          >(
                            builder: (context, state) {
                              RegisterPasswordConfirmVisibilityConfirmCubit
                              passwordConfirmVisibilityCubit = context
                                  .read<
                                    RegisterPasswordConfirmVisibilityConfirmCubit
                                  >();
                              return Custemtextformfield(
                                controller:
                                    registerCubit.passwordConfirmController,
                                hintText: "Confirm Password",
                                obscureText: passwordConfirmVisibilityCubit
                                    .confirmVisibility,
                                prefixIcon: Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    passwordConfirmVisibilityCubit
                                        .visibilityPasswordConfirm();
                                  },
                                  icon:
                                      passwordConfirmVisibilityCubit
                                          .confirmVisibility
                                      ? Icon(Icons.visibility_outlined)
                                      : Icon(Icons.visibility_off_outlined),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 25),
                          Customelevatedbutton(
                            buttonText: "Create Account",
                            backGroundColor: WidgetStatePropertyAll(
                              ColorsPalette.buttonsOrange,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: textTheme.titleSmall?.copyWith(
                                  color: ColorsPalette.grayText,
                                ),
                              ),
                              CustomTextButton(
                                textButton: "Sign In",
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    PageRouteNames.loginScreen,
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
          ],
        ),
      ),
    );
  }
}
