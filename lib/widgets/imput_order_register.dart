import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usuario/constants/constants.dart';
import 'package:usuario/providers/login_form_validar.dart';
import 'package:usuario/widgets/btn_reusable.dart';

class ImputOrderRegister extends StatefulWidget {
  const ImputOrderRegister({super.key});

  @override
  State<ImputOrderRegister> createState() => _ImputOrderRegisterState();
}

class _ImputOrderRegisterState extends State<ImputOrderRegister> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginFormValidar = Provider.of<LoginFormValidar>(context);
    

    final screenHeight = MediaQuery.of(context).size.height;
    

    return Form(
      key: loginFormValidar.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(children: [
        Container(
          width: 372,
          height: screenHeight <= 640 ? 50 : 55,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      const Color.fromARGB(255, 251, 250, 252).withValues(),
                  width: 1.4),
              color: const Color.fromARGB(255, 2, 2, 2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 38, minHeight: 36),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(188, 126, 124, 250).withValues(),
                      const Color.fromARGB(188, 126, 124, 250),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: Icon(
                      Icons.account_box,
                      color: Colors.white,
                      size: screenHeight <= 380 ? 18 : 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Align(
                alignment: const Alignment(0.0, 0.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 277, maxHeight: 24),
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        controller: nameCtrl,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Nombre Completo',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: screenHeight <= 346 ? 10 : 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: screenHeight <= 641 ? 6 : 10),       
        Container(
          width: 372,
          height: screenHeight <= 640 ? 50 : 55,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      const Color.fromARGB(255, 250, 248, 248).withValues(),
                  width: 1.4),
              color: const Color.fromARGB(255, 2, 2, 2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Container(
                  width: 38,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(188, 126, 124, 250).withValues(),
                      const Color.fromARGB(188, 126, 124, 250),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: screenHeight <= 380 ? 18 : 30,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenHeight <= 347 ? 2 : 4),
              Align(
                alignment: const Alignment(0.0, 0.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 272, maxHeight: 24),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: TextFormField(
                        controller: passCtrl,
                        cursorColor: Colors.white,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'direccion',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: screenHeight <= 346 ? 10 : 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => loginFormValidar.password,
                        validator: (value) {
                          return (value != null && value.length >= 8)
                              ? null
                              : 'La contraseña debe de ser de 8 caracteres';
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
         SizedBox(height: screenHeight <= 641 ? 6 : 10),
        Container(
          width: 372,
          height: screenHeight <= 640 ? 50 : 55,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      const Color.fromARGB(255, 251, 250, 252).withValues(),
                  width: 1.4),
              color: const Color.fromARGB(255, 2, 2, 2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 38, minHeight: 36),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(188, 126, 124, 250).withValues(),
                      const Color.fromARGB(188, 126, 124, 250),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: Icon(
                      Icons.local_shipping,
                      color: Colors.white,
                      size: screenHeight <= 380 ? 18 : 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Align(
                alignment: const Alignment(0.0, 0.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 277, maxHeight: 24),
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        controller: nameCtrl,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Tipo de carga',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: screenHeight <= 346 ? 10 : 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

         SizedBox(height: screenHeight <= 641 ? 6 : 10),
        Container(
          width: 372,
          height: screenHeight <= 640 ? 50 : 55,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      const Color.fromARGB(255, 251, 250, 252).withValues(),
                  width: 1.4),
              color: const Color.fromARGB(255, 2, 2, 2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 38, minHeight: 36),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(188, 126, 124, 250).withValues(),
                      const Color.fromARGB(188, 126, 124, 250),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: Icon(
                      Icons.scale,
                      color: Colors.white,
                      size: screenHeight <= 380 ? 18 : 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Align(
                alignment: const Alignment(0.0, 0.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 277, maxHeight: 24),
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        controller: nameCtrl,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Peso de la carga',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: screenHeight <= 346 ? 10 : 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

         SizedBox(height: screenHeight <= 641 ? 6 : 10),
        Container(
          width: 372,
          height: screenHeight <= 640 ? 50 : 55,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      const Color.fromARGB(255, 251, 250, 252).withValues(),
                  width: 1.4),
              color: const Color.fromARGB(255, 2, 2, 2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 38, minHeight: 36),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(188, 126, 124, 250).withValues(),
                      const Color.fromARGB(188, 126, 124, 250),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    child: Icon(
                      Icons.straighten,
                      color: Colors.white,
                      size: screenHeight <= 380 ? 18 : 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Align(
                alignment: const Alignment(0.0, 0.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 277, maxHeight: 24),
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        controller: nameCtrl,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Ancho-alto-profundidad',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: screenHeight <= 346 ? 10 : 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ), 

        SizedBox(height: screenHeight < 650 ? 15 : 35),

        ButtonReusable(
            text: 'Enviar',
            onPressed: () async {

               // guardar en DB
               //screen exitoso
               // redireccionar a home page
                             
              
            },
          ),
        
                Container(
                  constraints:
                      const BoxConstraints(maxHeight: 1, maxWidth: 95),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(188, 126, 124, 250).withAlpha(2),
                          AppConstants.blur.withValues(),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )),
                ),
              ],
            ),
          );
              
    
  }
}
