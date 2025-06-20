// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 140),
//               Center(
//                 child: Image.asset(
//                   'assets/images/logo.png',
//                   height: 170,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Sign up',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 25),

//               // Username field
//               TextField(
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: 'Username',
//                   hintStyle: TextStyle(
//                     fontSize: 15,

//                     color: Colors.grey,
//                   ),
//                   prefixIcon: Icon(Icons.person),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                   contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: Colors.blue, width: 2),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Email field
//               TextField(
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   hintStyle: TextStyle(
//                     fontSize: 15,

//                     color: Colors.grey,
//                   ),
//                   prefixIcon: Icon(Icons.email),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                   contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: Colors.blue, width: 2),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Password field
//               TextField(
//                 obscureText: true,
//                 style: TextStyle(
//                   fontSize: 16,

//                   color: Colors.black87,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   hintStyle: TextStyle(
//                     fontSize: 15,

//                     color: Colors.grey,
//                   ),
//                   prefixIcon: Icon(Icons.lock),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                   contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: BorderSide(color: Colors.blue, width: 2),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Sign up button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   // style: ElevatedButton.styleFrom(
//                   //   backgroundColor: Colors.blue,
//                   //   shape: RoundedRectangleBorder(
//                   //     borderRadius: BorderRadius.circular(12),
//                   //   ),
//                   // ),
//                   onPressed: () {
//                     // Handle sign up
//                   },
//                   child: const Text(
//                     'Sign up',
//                     style: TextStyle(fontSize: 18, color: Colors.black),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),

//               // Navigation to Sign in
//               Center(
//                 child: RichText(
//                   text: TextSpan(
//                     text: 'Already have an account? ',
//                     style: const TextStyle(color: Colors.black, fontSize: 18),
//                     children: [
//                       TextSpan(
//                         text: 'Sign in',
//                         style: const TextStyle(
//                           color: Colors.red, fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.pop(context); // Go back to login
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bagaicha_florashop/app/service_locator/service_locator.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view/loginpage.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view_model/register_view_model/register_event.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view_model/register_view_model/register_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<RegisterViewModel>(
      create: (context) => serviceLocator<RegisterViewModel>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 140),

                  const SizedBox(height: 20),
                  const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),

                  _buildField(
                    controller: _userNameController,
                    hint: 'Username',
                    icon: Icons.person,
                    validator:
                        (val) =>
                            val == null || val.isEmpty
                                ? 'Username is required'
                                : null,
                  ),
                  const SizedBox(height: 20),

                  _buildField(
                    controller: _emailController,
                    hint: 'Email',
                    icon: Icons.email,
                    validator: (val) {
                      if (val == null || val.isEmpty)
                        return 'Email is required';
                      if (!val.contains('@')) return 'Enter a valid email';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  _buildField(
                    controller: _passwordController,
                    hint: 'Password',
                    icon: Icons.lock,
                    obscure: true,
                    validator:
                        (val) =>
                            val == null || val.length < 6
                                ? 'Password must be at least 6 characters'
                                : null,
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<RegisterViewModel>().add(
                            RegisterUserEvent(
                              context: context,
                              username: _userNameController.text,
                              email: _emailController.text,

                              password: _passwordController.text,
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}
