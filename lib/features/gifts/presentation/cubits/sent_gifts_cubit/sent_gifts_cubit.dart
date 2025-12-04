import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/gifts/data/models/sent_gift_model.dart';
import 'package:zheeta/features/gifts/domain/usecases/sent_gift_usecase.dart';

/// Cubit to fetch all sent gifts with pagination
@prod
@injectable
class SentGiftsCubit extends PaginationCubit<SentGiftModel, PaginationParam> {
  final GetAllSentGifts _getAllSentGifts;

  SentGiftsCubit({
    required GetAllSentGifts getAllSentGifts,
  })  : _getAllSentGifts = getAllSentGifts,
        super(
          fetchPage: ((params) async {
            final result = await getAllSentGifts.call(params);

            return result.fold(
              (error) {
                print("SentGiftsCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print("SentGiftsCubit fetched ${data.length} items");
                return data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshSentGifts() async => reset();
}
