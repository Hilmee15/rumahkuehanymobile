import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumahkuehany/controller/auth_controller.dart';
import 'package:rumahkuehany/pages/loginpage.dart';
import 'package:rumahkuehany/utils/constant.dart';
import 'package:flutter/gestures.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullnameController = TextEditingController();

  // final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/logo_rkh.png'),
                    const SizedBox(
                      height: 27,
                    ),
                    Text(
                      'Selamat Datang di Rumah Kue Hany',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      'Sebelum lanjut, silahkan buat profile terlebih dahulu yaa',
                      style: whiteTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _fullnameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill the form';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Fullname'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: white,
                            ),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill the form';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Email'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: white,
                            ),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill the form';
                              } else if (value.length < 8) {
                                return 'Sandi terlalu pendek Minimal 8 karakter';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: white,
                            ),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _confirmPasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill the form';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text('Confirm Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 41,
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Sudah memiliki akun? ',
                            style: whiteTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: navigationText.copyWith(
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.register(
                                fullname: _fullnameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                confirm_password:
                                    _confirmPasswordController.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            backgroundColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                          child: Text(
                            'Register',
                            style: whiteTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
