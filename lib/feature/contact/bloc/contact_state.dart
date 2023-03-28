part of 'contact_bloc.dart';

@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {}

class OnLoadingAddContact extends ContactState {}

class OnSuccessAddContact extends ContactState {
  final List<ContactModel> result;

  OnSuccessAddContact(this.result);
}

class OnFailedAddContact extends ContactState {}
