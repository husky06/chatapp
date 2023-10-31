import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectContactScreen extends ConsumerWidget {
  static const String routeName = '/select-contact';
  const SelectContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Contact'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search),
            ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.more_vert),
            ),
        ],
      ),
    );
  }
}