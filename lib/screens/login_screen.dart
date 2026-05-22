import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: GetBuilder<AuthController>(builder: (controller) {
        return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                TextField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: controller.login,
                    child: controller.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'))
              ],
            ));
      }),
    );
  }
}
