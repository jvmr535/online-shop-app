// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStore, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_RegisterStore.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_RegisterStore.isPasswordValid'))
          .value;
  Computed<bool>? _$isConfirmPasswordValidComputed;

  @override
  bool get isConfirmPasswordValid => (_$isConfirmPasswordValidComputed ??=
          Computed<bool>(() => super.isConfirmPasswordValid,
              name: '_RegisterStore.isConfirmPasswordValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_RegisterStore.isFormValid'))
          .value;

  late final _$emailAtom = Atom(name: '_RegisterStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RegisterStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_RegisterStore.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$displayNameAtom =
      Atom(name: '_RegisterStore.displayName', context: context);

  @override
  String get displayName {
    _$displayNameAtom.reportRead();
    return super.displayName;
  }

  @override
  set displayName(String value) {
    _$displayNameAtom.reportWrite(value, super.displayName, () {
      super.displayName = value;
    });
  }

  late final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDisplayName(String value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.setDisplayName');
    try {
      return super.setDisplayName(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
displayName: ${displayName},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isConfirmPasswordValid: ${isConfirmPasswordValid},
isFormValid: ${isFormValid}
    ''';
  }
}
