import 'package:flutter/material.dart';
import 'package:vnpay_flutter/vnpay_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}
class _ExampleState extends State<Example> {
  String responseCode = '';

  void onPayment() async {
    /*final paymentUrl = VNPAYFlutter.instance.generatePaymentUrl(
      url:
      'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html', //vnpay url, default is https://sandbox.vnpayment.vn/paymentv2/vpcpay.html
      version: '2.0.1',
      tmnCode: 'XXX', //vnpay tmn code, get from vnpay
      txnRef: DateTime.now().millisecondsSinceEpoch.toString(),
      orderInfo: 'Pay 30.000 VND', //order info, default is Pay Order
      amount: 30000,
      returnUrl:
      'https://abc.com/return', //https://sandbox.vnpayment.vn/apis/docs/huong-dan-tich-hop/#code-returnurl
      ipAdress: '192.168.10.10',
      vnpayHashKey: 'XXX', //vnpay hash key, get from vnpay
      vnPayHashType: VNPayHashType
          .HMACSHA512, //hash type. Default is HmacSHA512, you can chang it in: https://sandbox.vnpayment.vn/merchantv2
    );*/
    VNPAYFlutter.instance.show(
      paymentUrl: "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=4000000&vnp_Command=pay&vnp_CreateDate=20230618140636&vnp_CurrCode=VND&vnp_IpAddr=172.29.80.1&vnp_Locale=vn&vnp_OrderInfo=2+string+40000&vnp_ReturnUrl=https%3A%2F%2Flocalhost%3A44301%2Fapi%2FVNPay&vnp_TmnCode=03ZSGGGG&vnp_TxnRef=638226939963485485&vnp_Version=2.1.0&vnp_SecureHash=fea5fc3cb98ed7b27ead54400f0220046611deed98d5ce5f4fdc09299cc10e0cfb0f5f2b21b14c9f108d4bba28d014beadab19eeb1ab9b69c471376dcb76a66b",
      onPaymentSuccess: (params) {
        setState(() {
          responseCode = params['vnp_ResponseCode'];
        });
      },
      onPaymentError: (params) {
        setState(() {
          responseCode = 'Error';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Response Code: $responseCode'),
            TextButton(
              onPressed: onPayment,
              child: const Text('10.000VND'),
            ),
          ],
        ),
      ),
    );
  }
}