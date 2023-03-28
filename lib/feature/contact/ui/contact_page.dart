import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week_6_bloc/feature/contact/bloc/contact_bloc.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Bloc"),
      ),
      body: Column(
        children: [
          BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
            if (state is OnLoadingAddContact) {
              return const CircularProgressIndicator();
            } else if (state is OnSuccessAddContact) {
              return ListView.builder(
                itemCount: state.result.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.result[index].name),
                    subtitle: Text(state.result[index].phoneNumber),
                  );
                },
              );
            } else if (state is OnFailedAddContact) {
              return const Text(
                'Oops... Failed Add Contact',
                style: TextStyle(color: Colors.red),
              );
            } else if (state is ContactInitial) {
              return const Text('Inital Event');
            } else {
              return Container();
            }
          }),
          ElevatedButton(
            child: const Text('Add Contact'),
            onPressed: () {
              context.read<ContactBloc>().add(AddContact());
            },
          )
        ],
      ),
    );
  }
}
