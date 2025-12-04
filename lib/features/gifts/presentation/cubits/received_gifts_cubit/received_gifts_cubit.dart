import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/gifts/data/models/received_gift_model.dart';
import 'package:zheeta/features/gifts/domain/usecases/received_gift_usecase.dart';

/// Cubit to fetch all received gifts with pagination
@prod
@injectable
class ReceivedGiftsCubit
    extends PaginationCubit<ReceivedGiftModel, PaginationParam> {
  final GetAllReceivedGifts _getAllReceivedGifts;

  ReceivedGiftsCubit({
    required GetAllReceivedGifts getAllReceivedGifts,
  })  : _getAllReceivedGifts = getAllReceivedGifts,
        super(
          fetchPage: ((params) async {
            final result = await getAllReceivedGifts.call(params);

            return result.fold(
              (error) {
                print("ReceivedGiftsCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print("ReceivedGiftsCubit fetched ${data.length} items");
                return data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 15),
        );

  Future<void> refreshReceivedGifts() async => reset();
}
