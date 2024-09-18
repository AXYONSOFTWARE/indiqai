import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(super.data);

  @override
  SupabaseTable get table => ProductsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageURL => getField<String>('imageURL');
  set imageURL(String? value) => setField<String>('imageURL', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  double? get salePrice => getField<double>('sale_price');
  set salePrice(double? value) => setField<double>('sale_price', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  int? get idNumber => getField<int>('id_number');
  set idNumber(int? value) => setField<int>('id_number', value);

  String? get blurHash => getField<String>('blur_hash');
  set blurHash(String? value) => setField<String>('blur_hash', value);

  String? get productIcon => getField<String>('product_icon');
  set productIcon(String? value) => setField<String>('product_icon', value);

  int? get clientId => getField<int>('client_id');
  set clientId(int? value) => setField<int>('client_id', value);

  double? get probability => getField<double>('probability');
  set probability(double? value) => setField<double>('probability', value);

  String? get blurhashIcon => getField<String>('blurhash_icon');
  set blurhashIcon(String? value) => setField<String>('blurhash_icon', value);

  String? get regrasUsoCupom => getField<String>('regras_uso_cupom');
  set regrasUsoCupom(String? value) =>
      setField<String>('regras_uso_cupom', value);

  int? get pontosEquivalentes => getField<int>('pontos_equivalentes');
  set pontosEquivalentes(int? value) =>
      setField<int>('pontos_equivalentes', value);
}
