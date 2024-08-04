import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final Map<String, dynamic> event;
  final DateTime selectedDay;

  EventDetailScreen({required this.event, required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
        title: Text(event['titulo'],  style: Theme.of(context).textTheme.bodyMedium,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: '${event['titulo']}-${selectedDay.toString()}',
              child: Material(
                type: MaterialType.transparency,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text("Descrição: ${event['descricao']}"),
                    SizedBox(height: 16),
                    Text("Início: ${event['inicio']}"),
                    SizedBox(height: 16),
                    Text("Fim: ${event['final']}"),
                    SizedBox(height: 16),
                    Text("Profissionais: ${event['profissionais'].map((user) => user.name).join(', ')}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
