import 'package:classify_app/providers/auth_provider.dart';
import 'package:classify_app/screens/my_screen.dart';
import 'package:classify_app/styles/custom_color_style.dart';
import 'package:classify_app/styles/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    var id = authProvider.id;
    var password = authProvider.password;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Text('로그인',
                  style: CustomTextStyle.displayLarge
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 60),
            CustomTextFormField(
              title: '학번',
              labelText: '학번을 입력해주세요.',
              onSaved: (val) {
                setState(() {
                  authProvider.setId(val);
                });
              },
              validator: (val) {
                if (val.length < 1) {
                  return "학번을 입력해주세요.";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              title: '비밀번호',
              labelText: '학교에서 발급받은 비밀번호를 입력해주세요.',
              isPassword: true,
              onSaved: (val) {
                setState(() {
                  authProvider.setPassword(val);
                });
              },
              validator: (val) {
                if (val.length < 1) {
                  return "비밀번호를 입력해주세요.";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 35,
            ),
            LoginButton(formKey: _formKey, id: id, password: password),
            const Expanded(child: SizedBox()),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Divider(
                  thickness: 2,
                )),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              child: Container(
                  width: (double.infinity),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: 60,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return MyScreen(
                          title: id,
                        );
                      }));
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'assets/logos/google_logo.svg',
                          width: 24,
                          height: 24,
                        ),
                        Text('Google 학교 계정으로 로그인',
                            style: CustomTextStyle.callout
                                .copyWith(color: CustomColor.subtext))
                      ],
                    ),
                  )),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {

                      },
                      style: const ButtonStyle(
                        side: MaterialStatePropertyAll<BorderSide>(
                            BorderSide.none),
                      ),
                      child: Text(
                        "구글 계정 사용 가능 학교 보기",
                        style: CustomTextStyle.footnote
                            .copyWith(color: CustomColor.subtext),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required String id,
    required String password,
  })  : _formKey = formKey,
        _id = id,
        _password = password;

  final GlobalKey<FormState> _formKey;
  final String _id;
  final String _password;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: (double.infinity),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 60,
        child: OutlinedButton(
          onPressed: () async {
            final formKeyState = _formKey.currentState!;
            if (formKeyState.validate()) {
              formKeyState.save();
              FocusScope.of(context).unfocus();

              //현재 버튼 클릭 이후 값이 저장되는 문제가 발생함.
              print(_id + _password);
              if (_id == "10823" && _password == "0000") {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyScreen(
                    title: _id,
                  );
                }));
              } else {
                const snackBar =
                    SnackBar(content: Text('ID OR PASSWORD IS WRONG'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.white)),
          child: Text('로그인',
              style: CustomTextStyle.callout.copyWith(
                  fontWeight: FontWeight.w800, color: CustomColor.midNight)),
        ));
  }
}

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String labelText;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final bool isPassword;

  const CustomTextFormField({
    required this.title,
    required this.labelText,
    required this.onSaved,
    required this.validator,
    this.isPassword = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: (double.infinity),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: CustomTextStyle.titleSmall,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 80,
          child: TextFormField(
            obscureText: isPassword,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: const Color(0xFFF7F8FA),
                labelText: labelText,
                labelStyle: CustomTextStyle.callout
                    .copyWith(color: CustomColor.subtext),
                border: InputBorder.none,
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Color(0xFFD9D9D9))),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: CustomColor.midNight),
                ),
                focusColor: const Color(0xFFFFFFFF),
                contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 12)),
            onSaved: onSaved,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
