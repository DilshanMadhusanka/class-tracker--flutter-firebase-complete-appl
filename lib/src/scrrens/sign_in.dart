import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          body: LoginBody(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  SizedBox(height: 14.0),
                  Text(
                    'Welcome to Class Tracker',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            _buildUsernameTextField(),
            _buildPasswordTextField(),
            _buildRoleDropdown(),
            _buildSignInButton(),
            _buildBackButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Username',
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildRoleDropdown() {
    List<String> roles = ['Teacher', 'Student', 'Admin', 'Parent'];
    String selectedRole = roles[0];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DropdownButton<String>(
        value: selectedRole,
        onChanged: (String? newValue) {
          // Handle role selection
        },
        items: roles.map((String role) {
          return DropdownMenuItem<String>(
            value: role,
            child: Text(role),
          );
        }).toList(),
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle sign-in button press
        },
        child: const Text('Sign In'),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        // Handle back button press
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
      label: const Text('Back'),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
    );
  }
}
