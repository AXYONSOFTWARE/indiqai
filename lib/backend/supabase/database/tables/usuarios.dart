import '../database.dart';

class UsuariosTable extends SupabaseTable<UsuariosRow> {
  @override
  String get tableName => 'usuarios';

  @override
  UsuariosRow createRow(Map<String, dynamic> data) => UsuariosRow(data);
}

class UsuariosRow extends SupabaseDataRow {
  UsuariosRow(super.data);

  @override
  SupabaseTable get table => UsuariosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get indicationToken => getField<String>('indication_token');
  set indicationToken(String? value) =>
      setField<String>('indication_token', value);

  String? get isIndication => getField<String>('is_indication');
  set isIndication(String? value) => setField<String>('is_indication', value);

  String? get locationAdress => getField<String>('location_adress');
  set locationAdress(String? value) =>
      setField<String>('location_adress', value);

  int? get points => getField<int>('points');
  set points(int? value) => setField<int>('points', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  int? get rewardsReceived => getField<int>('rewards_received');
  set rewardsReceived(int? value) => setField<int>('rewards_received', value);

  int? get rewardsUsed => getField<int>('rewards_used');
  set rewardsUsed(int? value) => setField<int>('rewards_used', value);

  int? get priceSaved => getField<int>('price_saved');
  set priceSaved(int? value) => setField<int>('price_saved', value);

  int? get countIndications => getField<int>('count_indications');
  set countIndications(int? value) => setField<int>('count_indications', value);
}
