import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_synapsis/services/local_auth_face.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool auth = false;
  String code = '';
  String getCode = '';

  Future scanBarcode() async {
    getCode = await FlutterBarcodeScanner.scanBarcode("#01AA4F", 'BATAL', true, ScanMode.DEFAULT);
    setState(() {
      code = getCode;
    });
    Navigator.pushNamedAndRemoveUntil(context, '/home',(route) => false);
  }

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Center(
        child: Text(
          'Sign Up For The Event By\nScanning Your Face Or Barcode',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.blue
          ),
        ),
      );
    }

    Widget imgAuth() {
      return Image.asset(
                'assets/ic_auth.png',
                fit: BoxFit.cover,
              );
    }

    Widget btnLoginFace() {
      return ElevatedButton(
        onPressed: () async {
          final authFace = await LocalAuthFace.authenticate();
          setState(() {
            auth = authFace;
          });
          auth ? Navigator.pushNamedAndRemoveUntil(context, '/home',(route) => false) : const AuthPage(); 
        },
        style: ButtonStyle(
          maximumSize:  MaterialStateProperty.all(
              const Size(double.infinity, 50),
        ),
        minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 50),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
        ),
        child: Text('Scan My Face',
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),),
      );
    }

    Widget btnLoginBarcode() {
      return TextButton(
        onPressed: () {
          scanBarcode();
        },
        child: Text('Generate QR Code',
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.grey[600]
          ),),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
          child: Column(
            children: <Widget>[
              header(),
              const SizedBox(
                height: 70,
              ),
              imgAuth(),
              const Spacer(),
              btnLoginFace(),
              const SizedBox(
                height: 12,
              ),
              btnLoginBarcode(),
            ],
          ),
        ),
      ),
    );
  }
}