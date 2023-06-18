import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config.dart';
import '../../../models/user.dart';
import 'package:http/http.dart' as http;
part 'account_event.dart';
part 'account_state.dart';

late SharedPreferences prefs;
final usermodel = new User();
void initSharedPref() async {
  prefs = await SharedPreferences.getInstance();
}

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<AccountEvent>((event, emit) async {
      if (event is UploadImageEvent) {
        var respone = await http.patch(Uri.parse(imageurl),
            body: {'id': event.id.toString(), 'image': event.image});
      } else if (event is OnDrawerIemSelectedEvent) {
        emit(
            OnDrawerIemSelectedState(selectedPosition: event.selectedPosition));
        emit(DummyState());
      }
    });
  }
}
