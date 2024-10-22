import 'package:flutter/material.dart';

import 'loading.dart';
Widget signupview(maxwidth){
  return Center( 
      child:  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint){
      return SizedBox(
      width: constraint.maxWidth > maxwidth ? maxwidth : constraint.maxWidth,
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: 
      Padding(padding: const EdgeInsets.fromLTRB(30, 30, 30, 20), child: 
  
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(
            width: constraint.maxWidth,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftarkan Akun Anda',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Bergabung dengan kami',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  )
              ],
            ),
          ),

          const SizedBox(height: 30,),

          SizedBox(
            width: constraint.maxWidth > maxwidth ? maxwidth : constraint.maxWidth,
            child: Column(
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nama Lengkap'),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),  
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email'),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),  
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Password'),
                    const SizedBox(height: 5),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),  
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Konfirmasi Password'),
                    const SizedBox(height: 5),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),  
                    ),
                  ],
                ),

              ]
            )
          ),

          const SizedBox(height: 60,),
          
          Column(
            children: [

              ElevatedButton(
                onPressed: ()async{
                  showLoadingDialog(context);
                  await Future.delayed(const Duration(seconds: 1));
                  hideLoadingDialog(context);
                  Navigator.pushReplacementNamed(context, 'signup_success');
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: constraint.maxWidth,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      'Buat Akun',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                        ),
                      ),
                    )
                ),
              ),

              const SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'sudah mempunyai akun?',
                    style: TextStyle(
                        fontSize: 10
                      ),
                    ),
                  TextButton(
                    onPressed: (){Navigator.pop(context);}, 
                    child: Text(
                      'Login disini',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 10
                      ),
                      )
                    ),
                ],
              )
            ],
          )
        ],
      ),
      
      ),

    )));
  }));
}