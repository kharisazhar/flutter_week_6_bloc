import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week_6_bloc/feature/contact/bloc/contact_bloc.dart';
import 'package:flutter_week_6_bloc/feature/contact/ui/contact_page.dart';

class ContactMain extends StatelessWidget {
  const ContactMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (_) => ContactBloc(),
      child: const ContactPage(),
    );
  }
}
