import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void sendMail(String recipientEmail, String id) async {
  String username = DotEnv().env['mailer_username'];
  String password = DotEnv().env['mailer_password'];

  final smtpServer = gmail(username, password); // create gmail server

  final message = Message()
    ..from = Address(username)
    ..recipients.add('$recipientEmail') //recipent email
    ..bccRecipients
        .add(Address('xrolevalsido@gmail.com')) //bcc Recipents emails
    ..subject = 'Uzotex Windows blind' //subject of the email
    ..text =
        'Hi $recipientEmail,.\nThanks for patronizing us. Your window blind with the ID: $id will be ready in 3 hours from now. Thank you.'; //body of the email

  try {
    final sendReport = await send(message, smtpServer);
    print(
        'Message sent: ' + sendReport.toString()); //print if the email is sent
  } on MailerException catch (e) {
    print(
        'Message not sent. \n' + e.toString()); //print if the email is not sent
  }
}
