import 'package:flutter/material.dart';
import 'package:notice_app/models/post_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;

    return Scaffold(
        appBar: AppBar(title: const Text('Details Page')),
        body: Container(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              args.title,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 25),
            Text(
              args.body,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),
            Text(
              'Noticia: ${args.id}, Autor:${args.userId}',
              style: const TextStyle(fontSize: 16),
            ),
          ]),
        ));
  }
}
