import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppProgressBar.dart';
import '../../../../config/AppButton.dart';
import '../../../../config/AppColors.dart';
import '../../../../config/AppRoutes.dart';
import '../../../../config/AppTextField.dart';
import '../../../../config/AppTextStyle.dart';
import '../../../../config/CommonState.dart';
import '../../../../domain/get_user_usecase.dart';
import '../../../../gen/assets.gen.dart';
import '../state/registration_cubit.dart';

class RegistrationView extends StatefulWidget {
  RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.app_background,
      body: Center(
        child: BlocProvider(
          create: (context) => RegistrationCubit(context.read<GetUserUseCase>()),
          child: BlocConsumer<RegistrationCubit, CommonState<void>>(
            listener: (context, state) {
              state.when(
                initial: () {
                },
                loading: () {
                  AppProgressBarWrapper.of(context)?.showLoading();
                },
                success: (_) {
                  AppProgressBarWrapper.of(context)?.hideLoading();
                  context.go(AppRoutes.homePath);
                },
                error: (message) {
                  AppProgressBarWrapper.of(context)?.hideLoading();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                },
              );
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Привет! Меня зовут Степи. Я буду твоим помощником.",
                    style: AppTextStyle.text_16_color_6E6E6E_400,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  RepaintBoundary(
                    child: SvgPicture.asset(
                      Assets.images.onboard1.path,
                      width: double.infinity,
                      height: 260,
                      fit: BoxFit.contain,
                      cacheColorFilter: true,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Для начала давай зарегистрируемся.",
                    style: AppTextStyle.text_16_color_6E6E6E_400,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  AppTextfield(
                    label: 'Введите ваше имя',
                    controller: _nameController,
                    inputType: TextInputType.text,
                    obscureText: false,
                    hintText: 'Имя',
                    onChanged: (text) {
                      print('Текст изменен: $text');
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Имя не может быть пустым';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    buttonText: "инициализация",
                    onClick: () {
                      final username = _nameController.text;
                      if (username.isNotEmpty) {
                        context.read<RegistrationCubit>().registerUser(username);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Введите имя')),
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
