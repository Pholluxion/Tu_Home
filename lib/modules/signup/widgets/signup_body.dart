import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import 'package:tu_home/ui/ui.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: context.scaffoldBackgroundColor,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                Icons.arrow_back,
                color: context.primaryColor,
              ),
            ),
            pinned: true,
          ),
          const SliverToBoxAdapter(child: _SignupHeader()),
          const SliverToBoxAdapter(child: _SignupBody()),
        ],
      ),
    );
  }
}

class _SignupBody extends StatelessWidget {
  const _SignupBody();

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
              decoration: const InputDecoration(
                hintText: 'Nombre',
              ),
              onTapOutside: (event) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            ),
            SizedBox(height: context.m),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Apellido',
              ),
              onTapOutside: (event) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            ),
            SizedBox(height: context.m),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Correo electrónico',
              ),
              onTapOutside: (event) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            ),
            SizedBox(height: context.m),
            TextField(
              decoration: InputDecoration(
                hintText: 'Contraseña',
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.xs,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              onTapOutside: (event) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            ),
            SizedBox(height: context.m),
            TextField(
              decoration: InputDecoration(
                hintText: 'Confirmar contraseña',
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.xs,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              onTapOutside: (event) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
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
              child: DropdownButton(
                autofocus: false,
                elevation: 24,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                underline: const SizedBox(),
                hint: Text(
                  'Tipo de documento',
                  style: AppStyles.labelMedium.copyWith(
                    color: context.tertiaryColor,
                  ),
                ),
                isExpanded: true,
                borderRadius: BorderRadius.circular(context.m),
                items: const [
                  DropdownMenuItem(
                    value: 'Cédula de ciudadanía',
                    child: Text('Cédula de ciudadanía'),
                  ),
                  DropdownMenuItem(
                    value: 'Cédula de extranjería',
                    child: Text('Cédula de extranjería'),
                  ),
                  DropdownMenuItem(
                    value: 'Pasaporte',
                    child: Text('Pasaporte'),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: context.m),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Numero de documento',
              ),
              onTapOutside: (event) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            ),
            SizedBox(height: context.m),
            ElevatedButton(
              onPressed: () {},
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
