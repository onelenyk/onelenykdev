import "dart:convert";

import "package:bloc/bloc.dart";
import "package:http/http.dart" as http;
import "package:onelenykco/app/features/passwords/password.dart";
import "package:onelenykco/app/features/passwords/state/password_state.dart";


class PasswordsCubit extends Cubit<MyPasswordsState> {

  PasswordsCubit() : super(MyPasswordsState(passwords: [], searchQuery: "")) {
    initialize();
  }
  static const String baseUrl = "192.168.1.158";

  Future<void> initialize() async {
    try {
      final itemsId = await fetchItemIds();
      final passwordItems = await fetchItemsDetails(itemsId);

      emit(state.copyWith(passwords: passwordItems));
    } catch (e) {
      print(e);
    }
  }

  Future<List<String>> fetchItemIds() async {
    const path = "item/list";
    final response = await http.get(Uri.http(baseUrl, path));
    if (response.statusCode == 200) {
      final List<dynamic> idList = json.decode(response.body);
      return idList.cast<String>();
    } else {
      throw Exception("Failed to load item IDs");
    }
  }

  Future<List<PasswordItem>> fetchItemsDetails(final List<String> itemIds) async {
    final items = <PasswordItem>[];

    for (final id in itemIds) {
      final path = Uri.http(baseUrl, "/item/read", {"id": id});
      final response = await http.get(path);

      if (response.statusCode == 200) {
        items.add(PasswordItem.fromJson(json.decode(response.body)));
      } else if (response.statusCode == 404) {
        // Handle the case where the item was not found
        print("Item not found: $id");
      } else {
        // Handle other potential errors
        throw Exception("Failed to load item details for ID: $id");
      }
    }

    return items;
  }

  void searchQuery(final String query) {
    emit(state.copyWith(searchQuery: query));
  }
  void clearSearchQuery(){
    emit(state.copyWith(searchQuery: ""));
  }

}
