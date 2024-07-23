import 'package:contacts_app/data/contacts.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class ContactsListPage extends StatefulWidget {
  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  // List to hold the contact data
  List<Contact> _contacts = [];

  // The initState method is called when this object is inserted into the widget tree.
  // This is where you can initialize data, subscribe to streams, or any other setup that 
  // needs to be done before the widget is built.
  @override
  void initState() {
    super.initState();

    // Initializing the contacts list using Faker to generate fake data
    final faker = Faker();
    _contacts = List.generate(50, (index) {
      return Contact(
        // Generating a first name and last name using faker
        name: '${faker.person.firstName()} ${faker.person.lastName()}',
        // Generating a fake email address
        email: faker.internet.email(),
        // Generating a fake phone number
        phoneNumber: faker.randomGenerator.integer(1000000).toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Setting the title of the AppBar
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        // Setting the number of items in the ListView
        itemCount: _contacts.length,
        // Building each item in the ListView
        itemBuilder: (context, index) {
          // Retrieving a contact from the list
          final contact = _contacts[index];
          return ListTile(
            // Displaying the contact's name
            title: Text(contact.name),
            // Displaying the contact's email
            subtitle: Text(contact.email),
            // Displaying the contact's phone number
            // trailing: Text(contact.phoneNumber),
          );
        },
      ),
    );
  }
}
