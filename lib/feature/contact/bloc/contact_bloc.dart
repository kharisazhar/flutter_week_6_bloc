import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/contact_model.dart';

part 'contact_event.dart';

part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  List<ContactModel> contactData = [
    ContactModel(name: 'John Wick', phoneNumber: '0812'),
    ContactModel(name: 'John Doe', phoneNumber: '0888')
  ];

  ContactBloc() : super(ContactInitial()) {
    on<AddContact>(_onAddedContact);
  }

  Future<void> _onAddedContact(
      AddContact event, Emitter<ContactState> emit) async {
    emit(OnLoadingAddContact());

    await Future.delayed(const Duration(seconds: 2));

    emit(OnSuccessAddContact(contactData));

    emit(OnFailedAddContact());
  }
}
