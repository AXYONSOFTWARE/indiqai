import '../database.dart';

class RewardsViewTable extends SupabaseTable<RewardsViewRow> {
  @override
  String get tableName => 'rewards_view';

  @override
  RewardsViewRow createRow(Map<String, dynamic> data) => RewardsViewRow(data);
}

class RewardsViewRow extends SupabaseDataRow {
  RewardsViewRow(super.data);

  @override
  SupabaseTable get table => RewardsViewTable();

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get cuponCode => getField<String>('cupon_code');
  set cuponCode(String? value) => setField<String>('cupon_code', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);
}
