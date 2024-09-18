import '../database.dart';

class EmpresasTable extends SupabaseTable<EmpresasRow> {
  @override
  String get tableName => 'empresas';

  @override
  EmpresasRow createRow(Map<String, dynamic> data) => EmpresasRow(data);
}

class EmpresasRow extends SupabaseDataRow {
  EmpresasRow(super.data);

  @override
  SupabaseTable get table => EmpresasTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get cuponsUsed => getField<int>('cupons_used');
  set cuponsUsed(int? value) => setField<int>('cupons_used', value);

  int? get numberClients => getField<int>('number_clients');
  set numberClients(int? value) => setField<int>('number_clients', value);

  String? get profilePicture => getField<String>('profile_picture');
  set profilePicture(String? value) =>
      setField<String>('profile_picture', value);

  String? get entrancePicture => getField<String>('entrance_picture');
  set entrancePicture(String? value) =>
      setField<String>('entrance_picture', value);

  int get qrcodeId => getField<int>('qrcode_id')!;
  set qrcodeId(int value) => setField<int>('qrcode_id', value);

  bool? get isOpen => getField<bool>('is_open');
  set isOpen(bool? value) => setField<bool>('is_open', value);

  String? get openTime => getField<String>('open_time');
  set openTime(String? value) => setField<String>('open_time', value);

  int? get cuponsGived => getField<int>('cupons_gived');
  set cuponsGived(int? value) => setField<int>('cupons_gived', value);
}
