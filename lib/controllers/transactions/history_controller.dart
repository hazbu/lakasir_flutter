import 'package:get/get.dart';
import 'package:lakasir/api/requests/pagination_request.dart';
import 'package:lakasir/api/responses/payment_methods/payment_method_response.dart';
import 'package:lakasir/api/responses/transactions/history_response.dart';
import 'package:lakasir/services/history_service.dart';

class HistoryController extends GetxController {
  RxBool isLoading = false.obs;
  final _historyService = HistoryService();
  RxList<TransactionHistoryResponse> histories =
      <TransactionHistoryResponse>[].obs;
  Rx<TransactionHistoryResponse> transaction = TransactionHistoryResponse(
    id: 0,
    friendPrice: false,
    paymentMethodId: 0,
  ).obs;
  int perPage = 20;

  Future<List<TransactionHistoryResponse>> fetchTransaction(PaginationRequest request) async {
    isLoading.value = true;
    final response = await _historyService.get(request);
    final data = response.data ?? [];

    // Opsional: kamu masih bisa menyimpan ke histories kalau mau
    histories.value = data;

    isLoading.value = false;
    return data;
  }


// @override
  // void onInit() {
  //   fetchTransaction(PaginationRequest(page: 1, perPage: perPage));
  //   super.onInit();
  // }
}
