import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/atoms/send_icon_button.dart';

class MessageForm extends StatefulWidget {
  @override
  _MessageFormState createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  final _formKey = GlobalKey<FormState>();

  String _content = '';
  TextEditingController _controller = TextEditingController(text: '');

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
              child: _renderTextField(),
            ),
            SendIconButton(
              onPressed: _content == ''
                  ? null
                  : () {
                      _onSendButtonClick();
                    },
            )
          ],
        ),
      ),
    );
  }

  _renderTextField() {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: TextFormField(
        controller: _controller,
        maxLines: null,
        onChanged: _onTexFieldValueChange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          focusedBorder: _borderDecoration(Colors.blue),
          enabledBorder: _borderDecoration(Colors.grey),
          errorBorder: _borderDecoration(Colors.red),
          focusedErrorBorder: _borderDecoration(Colors.red),
        ),
      ),
    );
  }

  _borderDecoration(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: color),
    );
  }

  _onTexFieldValueChange(v) {
    setState(() {
      _content = v;
    });
  }

  _onSendButtonClick() {
    setState(() {
      _content = '';
      _controller.clear();
    });
  }
}
