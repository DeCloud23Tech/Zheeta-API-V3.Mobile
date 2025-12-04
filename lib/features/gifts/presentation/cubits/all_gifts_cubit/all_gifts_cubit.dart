import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/gifts/data/models/gift_model.dart';
import 'package:zheeta/features/gifts/domain/usecases/get_gifts_usecase.dart';

/// Cubit to fetch all gifts with pagination
@prod
@injectable
class AllGiftsCubit extends PaginationCubit<GiftModel, PaginationParam> {
  final GetAllGifts _getAllGifts;

  AllGiftsCubit({
    required GetAllGifts getAllGifts,
  })  : _getAllGifts = getAllGifts,
        super(
          fetchPage: ((params) async {
            final result = await getAllGifts.call(params);

            return result.fold(
              (error) {
                print("AllGiftsCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print("AllGiftsCubit fetched ${data.length} items");
                return data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshGifts() async => reset();
}
