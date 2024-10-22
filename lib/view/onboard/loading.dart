import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Future<void> showLoadingDialog(BuildContext context,) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(
        child: LoadingAnimationWidget.bouncingBall(
          color: Colors.white, 
          size: 100,
        ),
      );
    },
  );
}

Future<void> statusBox(BuildContext context, bool status) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(
        child:  Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            width: 300,
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child:  
              Column(
                children: [
                  if(status)
                    Text("Successfully sign up"),
                  if(!status)
                    Text("Email has been taken"),
                  if(status)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, 'login');
                        }, 
                        child: const Text("Go to login page")),
                    ),
                  if(!status)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        child: const Text("Try Again")),
                    ),
                ],
              )
            )
          ),
        )
      );
    },
  );
}

// to hide our current dialog
void hideLoadingDialog(BuildContext context) {
  Navigator.of(context).pop();
}
