import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  void displayDialogSucess(BuildContext context)
  {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            title: const Text('Enviado'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Hemos enviado un correo con las instrucciones para recuperar la contraseña'),
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
  void displayDialogError(BuildContext context)
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
                Text('Introduce el correo'),
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
                  'Recuperar contraseña',
                  style: TextStyle(
                      fontSize: 20
                  )
              )
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo electronico'
                  )
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
                    if(emailController.text.isNotEmpty)
                    {
                      displayDialogSucess(context);
                    }
                    else {
                      displayDialogError(context);
                    }
                  }
              )
          ),
        ],
      )
    );
  }
}
