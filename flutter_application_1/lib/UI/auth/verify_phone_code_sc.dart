import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/posts/posts.dart';
import 'package:flutter_application_1/UI/utils/utils.dart';
import 'package:flutter_application_1/widgets/round_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationid;

  const VerifyCodeScreen({super.key, required this.verificationid});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final verifycontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Code'),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: verifycontroller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined),
                  hintText: 'Enter 6 digit code here',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.deepPurple))),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Verify',
                loading: loading,
                ontap: () async {
                  setState(() {
                    loading = true;
                  });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationid,
                      smsCode: verifycontroller.text.toString());
                  try {
                    await auth.signInWithCredential(credential);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const PostScreen())));
                  } catch (e) {
                    setState(() {
                      loading = false;
                    });
                    Utils().utilsmsg(e.toString());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
