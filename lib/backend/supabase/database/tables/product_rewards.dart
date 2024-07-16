import '../database.dart';

class ProductRewardsTable extends SupabaseTable<ProductRewardsRow> {
  @override
  String get tableName => 'product_rewards';

  @override
  ProductRewardsRow createRow(Map<String, dynamic> data) =>
      ProductRewardsRow(data);
}

class ProductRewardsRow extends SupabaseDataRow {
  ProductRewardsRow(super.data);

  @override
  SupabaseTable get table => ProductRewardsTable();

  String get rewardId => getField<String>('reward_id')!;
  set rewardId(String value) => setField<String>('reward_id', value);

  String get productId => getField<String>('product_id')!;
  set productId(String value) => setField<String>('product_id', value);
}
