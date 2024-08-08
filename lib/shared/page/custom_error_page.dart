import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomErrorPage {
  static Widget initialize(FlutterErrorDetails error) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Erro'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline_outlined,
                  color: Colors.red,
                  size: 70,
                ),
                Text(
                  error.exceptionAsString(),
                  textAlign: TextAlign.center,
                ),
                // Text(
                //   kDebugMode
                //       ? error.exceptionAsString()
                //       : 'Oops... ocorreu um erro inesperado, entre em contato se precisar de ajuda',
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
