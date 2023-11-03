import 'package:chatapplication/common/widgets/error.dart';
import 'package:chatapplication/common/widgets/loader.dart';
import 'package:chatapplication/features/select-contacts/controller/select_contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectContactScreen extends ConsumerWidget {
  static const String routeName = '/select-contact';
  const SelectContactScreen({super.key});

void selectContact(WidgetRef ref, Contact selectContact, BuildContext context){
  ref.read(selectContactControllerProvider).selectContact(selectContact, context);
}
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
      body: ref.watch(getContactsProvider).when(data: (contactList) => ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index){
          final contact = contactList[index];
          return InkWell(
            onTap: () => selectContact(ref, contact, context),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text(contact.displayName,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  ),
                leading: contact.photo == null ? null : CircleAvatar(
                  backgroundImage: MemoryImage(contact.photo!),
                  radius: 30,
                ),
              ),
            ),
          );
        },
      ), error: (err, trace) => ErrorScreen(error: err.toString()), loading: () => const Loader()),
    );
  }
}