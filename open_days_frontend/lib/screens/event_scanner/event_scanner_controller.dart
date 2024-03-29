import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/responses/base_response.dart';
import '../../repositories/event_scanner_repository.dart';

class EventScannerController {
  Barcode? _barcode;
  QRViewController? _qrViewController;

  final ProviderRef _ref;
  final EventScannerRepository _eventScannerRepository;
  final _isApplyingSuccessful = StateProvider<bool>((ref) => false);

  FutureProvider<BaseResponse> _eventParticipationProvider = FutureProvider((ref) async {
    return BaseResponse();
  });

  EventScannerController(this._ref, this._eventScannerRepository);

  Barcode? getBarcode() {
    return _barcode;
  }

  QRViewController? getQRViewController() {
    return _qrViewController;
  }

  StateProvider<bool> getIsApplyingSuccessful() {
    return _isApplyingSuccessful;
  }

  FutureProvider<BaseResponse> getEventParticipationProvider() {
    return _eventParticipationProvider;
  }

  void setBarcode(Barcode barcode) {
    _barcode = barcode;
  }

  void setQRViewController(QRViewController? qrViewController) {
    _qrViewController = qrViewController;
  }

  void disposeQRViewController() {
    _qrViewController?.dispose();
  }

  void saveUserParticipation() {
    _ref.invalidate(_eventParticipationProvider);

    _eventParticipationProvider = FutureProvider(((ref) async {
      final response = await _eventScannerRepository.saveUserParticipationRepo(_barcode?.code);

      if (response.isOperationSuccessful == true) {
        _ref.read(_isApplyingSuccessful.notifier).state = true;
      }

      return response;
    }));
  }
}

final eventScannerControllerProvider = Provider((ref) {
  final eventScannerRepository = ref.watch(eventScannerRepositoyProvider);
  return EventScannerController(ref, eventScannerRepository);
});
