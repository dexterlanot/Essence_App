import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'homepage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return DesktopLoginLayout();
          } else {
            return MobileLoginLayout();
          }
        },
      ),
    );
  }
}

class DesktopLoginLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Container(
                width: 400, // Reduced width for desktop
                child: LoginForm(),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Image.asset(
                '../assets/image.png',
                fit: BoxFit.contain,
              ).animate().fadeIn(duration: 600.ms).scale(
                  begin: Offset(0.8, 0.8), end: Offset(1, 1), duration: 600.ms),
            ),
          ),
        ),
      ],
    );
  }
}

class MobileLoginLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    '../assets/image.png',
                    fit: BoxFit.cover,
                  ).animate().fadeIn(duration: 600.ms).scale(
                      begin: Offset(0.8, 0.8),
                      end: Offset(1, 1),
                      duration: 600.ms),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(24.0),
              child: Center(
                // Center the LoginForm widget
                child: LoginForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == '@dich_' &&
          _passwordController.text == 'myapp') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.2, end: 0, duration: 600.ms),
          SizedBox(height: 30),
          TextFormField(
            controller: _usernameController,
            style:
                TextStyle(color: Colors.white), // Set the text color to white
            decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[900],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.person, color: Colors.grey[400]),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 600.ms)
              .slideX(begin: 0.2, end: 0, delay: 200.ms, duration: 600.ms),
          SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            style:
                TextStyle(color: Colors.white), // Set the text color to white
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[900],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.lock, color: Colors.grey[400]),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          )
              .animate()
              .fadeIn(delay: 400.ms, duration: 600.ms)
              .slideX(begin: 0.2, end: 0, delay: 400.ms, duration: 600.ms),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: _login,
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
              .animate()
              .fadeIn(delay: 600.ms, duration: 600.ms)
              .scale(delay: 600.ms, duration: 600.ms),
        ],
      ),
    );
  }
}
