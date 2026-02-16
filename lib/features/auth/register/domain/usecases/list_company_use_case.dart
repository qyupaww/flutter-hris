import 'package:morpheme_http/morpheme_http.dart';

import '../../data/models/body/list_company_body.dart';
import '../entities/list_company_entity.dart';
import '../repositories/register_repository.dart';

class ListCompanyUseCase
    implements UseCase<ListCompanyEntity, ListCompanyBody> {
  ListCompanyUseCase({required this.repository});

  final RegisterRepository repository;

  @override
  Future<Either<MorphemeFailure, ListCompanyEntity>> call(
    ListCompanyBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) {
    return repository.listCompany(
      body,
      headers: headers,
      cacheStrategy: cacheStrategy,
    );
  }
}
