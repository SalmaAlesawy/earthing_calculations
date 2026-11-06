import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
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
                child: BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)),
                      );
                    }
                    if (state is RegisterSuccess) {
                      Navigator.pushReplacementNamed(
                        context,
                        PageRouteNames.navigationScreen,
                      );
                    }
                  },
                  builder: (context, state) {
                    RegisterCubit registerCubit = context.read<RegisterCubit>();
                    return Form(
                      key: registerCubit.formKey,
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Custemtextformfield(
                            controller: registerCubit.fullNameController,
                            hintText: "Full Name",
                            validator: (value) {
                              return Validators.validateName(value);
                            },
                            obscureText: false,
                            prefixIcon: Icon(Icons.person_2_outlined),
                          ),
                          Custemtextformfield(
                            controller: registerCubit.emailController,
                            validator: (value) {
                              return Validators.validateEmail(value);
                            },
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
                                validator: (value) {
                                  return Validators.validatePassword(value);
                                },
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
                                validator: (value) {
                                  return Validators.validateConfirmPassword(
                                    value,
                                    registerCubit.passwordController.text,
                                  );
                                },
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
                          state is RegisterLoading
                              ? CircularProgressIndicator()
                              : Customelevatedbutton(
                                  buttonText: "Create Account",
                                  backGroundColor: WidgetStatePropertyAll(
                                    ColorsPalette.buttonsOrange,
                                  ),
                                  onPressed: () {
                                    if (registerCubit.formKey.currentState!
                                        .validate()) {
                                      registerCubit.signupWithEmailAndPassword(
                                        registerCubit.emailController.text,
                                        registerCubit.passwordController.text,
                                      );
                                    }
                                  },
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
