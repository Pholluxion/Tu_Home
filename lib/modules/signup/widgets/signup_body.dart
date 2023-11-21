import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:tu_home/app/ui/ui.dart';
import 'package:tu_home/data/data.dart' show DocType;

import '../cubit/cubit.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registro exitoso'),
                backgroundColor: Colors.green,
              ),
            );
            context.go('/login');
          }

          if (state is SignupFailure) {
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
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  if (state is! SignupLoading) ...[
                    const _SliverAppBar(),
                    const SliverToBoxAdapter(child: _SignupHeader()),
                    const SliverToBoxAdapter(child: _SignupBody()),
                  ],
                  if (state is SignupLoading)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: _SignUpLoading(),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SignUpLoading extends StatelessWidget {
  const _SignUpLoading();

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
              'Realizando registro...',
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

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: context.scaffoldBackgroundColor,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.arrow_back,
          color: context.primaryColor,
        ),
      ),
      pinned: true,
    );
  }
}

class _SignupHeader extends StatelessWidget {
  const _SignupHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.l),
      child: SizedBox(
        height: context.height * 0.2,
        child: Image.asset(
          Assets.images.tuHomeLogo.path,
        ),
      ),
    );
  }
}

class _SignupBody extends StatefulWidget {
  const _SignupBody();

  @override
  State<_SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<_SignupBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _documentController;
  late final TextEditingController _confirmPasswordController;

  late final ValueNotifier<bool> _isPasswordVisible;
  late final ValueNotifier<bool> _isConfirmPasswordVisible;
  late final ValueNotifier<bool> _validEmailNotifier;
  late final ValueNotifier<bool> _isNotEmptyNotifier;
  late final ValueNotifier<DocType> _docType;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _documentController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _isPasswordVisible = ValueNotifier(false);
    _isConfirmPasswordVisible = ValueNotifier(false);
    _docType = ValueNotifier(DocType.cC);
    _validEmailNotifier = ValueNotifier(true);
    _isNotEmptyNotifier = ValueNotifier(false);
  }

  @override
  dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _lastNameController.dispose();
    _documentController.dispose();
    _confirmPasswordController.dispose();
    _isConfirmPasswordVisible.dispose();
    _isNotEmptyNotifier.dispose();
    _validEmailNotifier.dispose();
    _isPasswordVisible.dispose();
    _docType.dispose();
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
    _isNotEmptyNotifier.value = _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _documentController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: EdgeInsets.all(context.xl),
        child: Column(
          children: [
            Text(
              'Registro',
              style: TextStyle(
                fontSize: 28,
                color: context.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.m),
            Text(
              'Unete a Tu Home',
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
            TextField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
              decoration: const InputDecoration(
                hintText: 'Nombre',
              ),
              onChanged: (value) => validIsNotEmpty(),
              onTapOutside: (event) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            ),
            SizedBox(height: context.m),
            TextField(
              controller: _lastNameController,
              keyboardType: TextInputType.name,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
              decoration: const InputDecoration(
                hintText: 'Apellido',
              ),
              onChanged: (value) => validIsNotEmpty(),
              onTapOutside: (event) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            ),
            SizedBox(height: context.m),
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
              valueListenable: _isPasswordVisible,
              builder: (context, value, child) {
                return TextField(
                  controller: _passwordController,
                  obscureText: !value,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.xs,
                      ),
                      child: IconButton(
                        onPressed: () => _isPasswordVisible.value = !value,
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
              valueListenable: _isConfirmPasswordVisible,
              builder: (context, value, child) {
                return TextField(
                  controller: _confirmPasswordController,
                  obscureText: !value,
                  decoration: InputDecoration(
                    hintText: 'Confirmar contraseña',
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.xs,
                      ),
                      child: IconButton(
                        onPressed: () =>
                            _isConfirmPasswordVisible.value = !value,
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
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: context.m,
                vertical: context.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(context.m),
              ),
              child: ValueListenableBuilder(
                valueListenable: _docType,
                builder: (context, value, child) => DropdownButtonHideUnderline(
                  child: DropdownButton(
                    autofocus: false,
                    elevation: 24,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    hint: Text(
                      'Tipo de documento',
                      style: AppStyles.labelMedium.copyWith(
                        color: context.tertiaryColor,
                      ),
                    ),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(context.m),
                    value: _docType.value,
                    items: DocType.values
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.value),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _docType.value = value as DocType;
                      validIsNotEmpty();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: context.m),
            TextField(
              controller: _documentController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              decoration: const InputDecoration(
                hintText: 'Numero de documento',
              ),
              onChanged: (value) => validIsNotEmpty(),
              onTapOutside: (event) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            ),
            SizedBox(height: context.m),
            ValueListenableBuilder(
              valueListenable: _isNotEmptyNotifier,
              builder: (context, value, child) => ElevatedButton(
                onPressed: value
                    ? () => context.read<SignupCubit>().signup(
                          email: _emailController.text,
                          name: _nameController.text,
                          surname: _lastNameController.text,
                          docType: _docType.value,
                          password: _passwordController.text,
                          documentNumber: _documentController.text,
                        )
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: context.m),
                      child: const Text('Registrarse'),
                    ),
                  ],
                ),
              ),
            ),
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
                  '¿Ya tienes una cuenta?',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () => context.pop(),
                  child: Text(
                    'Inicia sesión',
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
    ).animate().slide(
          begin: const Offset(0, 1),
          end: Offset.zero,
          duration: const Duration(milliseconds: 500),
        );
  }
}
