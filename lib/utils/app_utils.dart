import 'package:flutter/material.dart';

class AppUtils {
  static void openFull(BuildContext context, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Stack(
            children: [
              Center(
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () => Navigator.of(context).maybePop(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
