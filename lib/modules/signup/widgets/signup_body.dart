import 'package:flutter/material.dart';

import 'package:tu_home/gen/assets.gen.dart';
import 'package:tu_home/ui/ui.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(context.s),
              child: SizedBox(
                height: context.height * 0.2,
                child: Image.asset(
                  Assets.images.tuHomeLogo.path,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.height * 0.7,
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
                child: Padding(
                  padding: EdgeInsets.all(context.xl),
                  child: Column(
                    children: [
                      SizedBox(height: context.m),
                      const Text(
                        'Registro',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.m),
                      const Text(
                        'Unete a Tu Home',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.primary,
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
                        decoration: InputDecoration(
                          hintText: 'Nombre',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.m),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Apellido',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.m),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Correo electrónico',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                        ),
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
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                        ),
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
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.m),
                      DropdownButton(
                        hint: const Text('Tipo de documento'),
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
                      SizedBox(height: context.m),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Numero de documento',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.m),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.m),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(context.m),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: context.m,
                              ),
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
                            '¿Primera vez en Tu Home?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Registrate',
                              style: TextStyle(
                                color: AppColors.primary,
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
            ),
          ),
        ],
      ),
    );
  }
}
