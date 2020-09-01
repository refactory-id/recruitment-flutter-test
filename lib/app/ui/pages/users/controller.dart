import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:refactory_flutter_test/app/ui/pages/users/presenter.dart';
import 'package:refactory_flutter_test/app/ui/widgets/list_item.dart';
import 'package:refactory_flutter_test/app/ui/widgets/user_item.dart';
import 'package:refactory_flutter_test/domains/entities/user.dart';

class UsersController extends Controller {
  UsersPresenter _presenter;
  List<User> _users;
  List<ListItem> _items = List.empty();

  List<User> get users => _users;
  List<ListItem> get items => _items;

  UsersController(this._presenter) : super() {
    _users = List<User>();
    initListeners();
    load();
  }

  @override
  void initListeners() {
    _presenter.getUsersOnNext = (List<User> users) {
      refreshUI();
    };

    _presenter.getUsersOnComplete = () {
      
    };

    _presenter.getUsersOnError = (e) {
      
    };
  }

  void load() {
    _presenter.getUserList();
  }
}