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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: 100,
              ),
              Text(
                kDebugMode
                    ? error.exception.toString()
                    : 'Oops... ocorreu um erro inesperado, entre em contato se precisar de ajuda\n${error.exception.toString()}',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
