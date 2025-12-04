import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/discover/data/models/nearby_model.dart';
import 'package:zheeta/features/discover/domain/usecases/nearby_profiles_usecase.dart';

/// Cubit to fetch nearby profiles with pagination
@prod
@injectable
class NearbyProfilesCubit
    extends PaginationCubit<NearbyDataModel, PaginationParam> {
  final GetNearbyProfiles _getNearbyProfiles;

  bool _isFetching = false;

  NearbyProfilesCubit({
    required GetNearbyProfiles getNearbyProfiles,
  })  : _getNearbyProfiles = getNearbyProfiles,
        super(
          fetchPage: ((params) async {
            final result = await getNearbyProfiles.call(params);
            return result.fold(
              (error) {
                print("NearbyProfilesCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print("NearbyProfilesCubit fetched ${data.data.length} items");
                return data.data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  @override
  Future<void> loadNextPage() async {
    if (_isFetching) return; // guard against duplicate calls
    _isFetching = true;
    await super.loadNextPage();
    _isFetching = false;
  }

  Future<void> refreshProfiles() async => reset();
}
