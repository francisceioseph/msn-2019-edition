import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/atoms/outline_form_text_field.dart';
import 'package:messanger/src/widgets/atoms/send_icon_button.dart';

class MessageForm extends StatefulWidget {
  @override
  _MessageFormState createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  final _formKey = GlobalKey<FormState>();

  String _content = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 8,
        left: 8,
      ),
      child: Form(
        key: _formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: OutlineFormTextField(
                maxLines: null,
                onChanged: _setContent,
              ),
            ),
            SendIconButton(
              onPressed: _content == ''
                  ? null
                  : () {
                      print(_content);
                      _setContent('');
                    },
            )
          ],
        ),
      ),
    );
  }

  _setContent(v) {
    setState(() => _content = v);
  }
}
