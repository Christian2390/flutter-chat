import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chat/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  List<ChatMessage> _messages = [
    /*ChatMessage(texto: 'Hola a todos', uid: '123'),
    ChatMessage(texto: 'Hola a todos', uid: '123456'),
    ChatMessage(texto: 'Hola a todos', uid: '123'),
    ChatMessage(texto: 'Hola a todos', uid: '123456'),
    ChatMessage(texto: 'Hola a todos', uid: '123'),
    ChatMessage(texto: 'Hola a todos', uid: '123456'),*/
  ];
  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade200,
        title: Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                child: Text('Me', style: TextStyle(fontSize: 12)),
                backgroundColor: Colors.brown.shade100,
                maxRadius: 14,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Mechas Locas',
              style: TextStyle(
                color: Colors.brown.shade800,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 6,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              ),
            ),
            Divider(height: 6),

            //TODO: caja de texto
            Container(color: Colors.grey.shade200, child: _inputChat()),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (texto) {
                  setState(() {
                    if (texto.trim().length > 0) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar Mensaje',
                ),
                focusNode: _focusNode,
              ),
            ),
            //Boton de enviar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              child:
                  Platform.isIOS
                      ? CupertinoButton(
                        child: Text('Enviar'),
                        onPressed:
                            _estaEscribiendo
                                ? () =>
                                    _handleSubmit(_textController.text.trim())
                                : null,
                      )
                      : IconTheme(
                        data: IconThemeData(
                          color: Colors.deepOrangeAccent.shade200,
                        ),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.send_outlined,
                            color: Colors.deepOrangeAccent.shade200,
                          ),
                          onPressed:
                              _estaEscribiendo
                                  ? () =>
                                      _handleSubmit(_textController.text.trim())
                                  : null,
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto) {
    if (texto.isEmpty) return;
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      texto: texto,
      uid: '123',
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000),
      ),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    //TODO: off del secket

    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
