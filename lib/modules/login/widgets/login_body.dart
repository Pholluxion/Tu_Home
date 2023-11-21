import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tu_home/app/app.dart';
import 'package:tu_home/app/ui/ui.dart';

import '../cubit/cubit.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Bienvenido ${state.userResponse.name}',
                ),
                backgroundColor: Colors.green,
              ),
            );

            const HomeRoute().push(context);
          }

          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              if (state is! LoginLoading) ...[
                const _LoginHeader(),
                const _LoginBody(),
              ],
              if (state is LoginLoading) const _LoginLoading(),
            ],
          );
        },
      ),
    );
  }
}

class _LoginLoading extends StatelessWidget {
  const _LoginLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Iniciando sesión...',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20.0),
            CircularProgressIndicator(
              color: context.primaryColor,
            ),
          ],
        ),
      ),
    ).animate().fade(
          begin: 0,
          end: 1,
          duration: const Duration(milliseconds: 500),
        );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(context.xl),
            topRight: Radius.circular(context.xl),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(context.xl),
            child: Column(
              children: [
                SizedBox(height: context.m),
                Text(
                  'Inicio de Sesión',
                  style: TextStyle(
                    fontSize: 28,
                    color: context.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: context.m),
                Text(
                  '¡Bienvenido a Tu Home!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: context.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Por favor ingresa tus datos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: context.m),
                const _EmailAndPasswordTextField(),
                SizedBox(height: context.m),
                Divider(
                  color: Colors.grey,
                  indent: context.xl,
                  endIndent: context.xl,
                ),
                SizedBox(height: context.m),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿Primera vez en Tu Home?',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () => const SignUpRoute().push(context),
                      child: Text(
                        'Registrate',
                        style: TextStyle(
                          color: context.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ).animate().slide(
            begin: const Offset(0, 1),
            end: Offset.zero,
            duration: const Duration(milliseconds: 500),
          ),
    );
  }
}

class _EmailAndPasswordTextField extends StatefulWidget {
  const _EmailAndPasswordTextField();

  @override
  State<_EmailAndPasswordTextField> createState() =>
      _EmailAndPasswordTextFieldState();
}

class _EmailAndPasswordTextFieldState
    extends State<_EmailAndPasswordTextField> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final ValueNotifier<bool> _obscureTextNotifier;
  late final ValueNotifier<bool> _validEmailNotifier;
  late final ValueNotifier<bool> _isNotEmptyNotifier;

  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _obscureTextNotifier = ValueNotifier<bool>(true);
    _validEmailNotifier = ValueNotifier<bool>(true);
    _isNotEmptyNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obscureTextNotifier.dispose();
    _validEmailNotifier.dispose();
    _isNotEmptyNotifier.dispose();
    super.dispose();
  }

  void validEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
    );

    if (email.isEmpty) {
      _validEmailNotifier.value = true;
      return;
    }

    _validEmailNotifier.value = emailRegex.hasMatch(email);
  }

  void validIsNotEmpty() {
    _isNotEmptyNotifier.value = (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: _validEmailNotifier,
          builder: (context, value, child) => TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            decoration: InputDecoration(
              hintText: 'Correo Electrónico',
              errorText: value ? null : 'Correo electrónico inválido',
            ),
            onChanged: (_) {
              validEmail(_emailController.text);
              validIsNotEmpty();
            },
            onTapOutside: (event) =>
                FocusScope.of(context).requestFocus(FocusNode()),
          ),
        ),
        SizedBox(height: context.m),
        ValueListenableBuilder(
          valueListenable: _obscureTextNotifier,
          builder: (context, value, child) {
            return TextField(
              controller: _passwordController,
              obscureText: value,
              keyboardType: TextInputType.visiblePassword,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              decoration: InputDecoration(
                hintText: 'Contraseña',
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.xs,
                  ),
                  child: IconButton(
                    onPressed: () => _obscureTextNotifier.value =
                        !_obscureTextNotifier.value,
                    icon: Icon(
                      value ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              onChanged: (value) => validIsNotEmpty(),
              onTapOutside: (event) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            );
          },
        ),
        SizedBox(height: context.m),
        ValueListenableBuilder(
          valueListenable: _isNotEmptyNotifier,
          builder: (context, value, child) => ElevatedButton(
            onPressed: value
                ? () => context.read<LoginCubit>().login(
                      _emailController.text,
                      _passwordController.text,
                    )
                : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: context.m),
                  child: const Text('Inicio de Sesión'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.all(context.s),
        child: SizedBox(
          height: context.height * 0.3,
          child: Image.asset(
            Assets.images.tuHomeLogo.path,
          ),
        ).animate().slide(
              begin: const Offset(0, -1),
              end: Offset.zero,
              duration: const Duration(milliseconds: 500),
            ),
      ),
    );
  }
}
