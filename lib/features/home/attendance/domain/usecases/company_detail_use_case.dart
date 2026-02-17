import 'package:morpheme_http/morpheme_http.dart';

import '../entities/company_detail_entity.dart';
import '../repositories/company_detail_repository.dart';

class CompanyDetailUseCase implements UseCase<CompanyDetailEntity, int> {
  CompanyDetailUseCase({required this.repository});

  final CompanyDetailRepository repository;

  @override
  Future<Either<MorphemeFailure, CompanyDetailEntity>> call(
    int companyId, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) {
    return repository.companyDetail(
      companyId,
      headers: headers,
      cacheStrategy: cacheStrategy,
    );
  }
}
