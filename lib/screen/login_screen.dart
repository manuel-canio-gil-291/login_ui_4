import 'package:flutter/material.dart';
import 'package:login_ui_4/screen/forgot_password_screen.dart';
import 'package:login_ui_4/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  void _toogle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  void displayDialog(BuildContext context)
  {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: const Text('Error'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Introduce el nombre de usuario y contraseña'),
              SizedBox(height: 10)
            ],
          ),
          actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK')
            )
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          const FlutterLogo(
            size: 100
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Flutter Login',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
                fontSize: 30
              )
            )
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Iniciar sesión',
              style: TextStyle(
                fontSize: 20
              )
            )
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre de usuario'
              )
            )
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: _obscureText,
              controller: passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                    onPressed: _toogle,
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off)
                )
              )
            )
          ),
          TextButton(
            //TODO: Hacer un screen para el olvido de la contraseña
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
              },
              child: const Text(
                'Olvidó la contraseña',
                style: TextStyle(
                  color: Colors.indigo
                ),
              )
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              child: const Text('Iniciar sesión'),
              onPressed: () {
                if(usernameController.text.isNotEmpty || passwordController.text.isNotEmpty)
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen())
                    );
                  }
                else {
                  displayDialog(context);
                }
              }
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('¿No tienes una cuenta?'),
              TextButton(
                onPressed: () {
                  //TODO: Pantalla para registrar
                },
                child: const Text(
                  'Registrar',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.indigo
                  )
                )
              )
            ]
          )
        ]
      )
    );
  }
}
