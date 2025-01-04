import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/person.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/textField/text_input.dart';
import 'package:mushroom_go/utils/firebase/firebase_auth_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountUpdateFirstnameNameSettingPage extends StatefulWidget {
  const AccountUpdateFirstnameNameSettingPage({super.key});

  @override
  State<AccountUpdateFirstnameNameSettingPage> createState() => _AccountUpdateFirstnameNameSettingPageState();
}

class _AccountUpdateFirstnameNameSettingPageState extends State<AccountUpdateFirstnameNameSettingPage> {
  late final TextEditingController _controllerFirstname;
  late final TextEditingController _controllerName;
  late Person _person;
  late bool _isSame;

  Future<void> _loadData() async {
    _person = await FirebaseAuthUtils.getFullNameAccount(context) as Person;
    _controllerFirstname.text = _person.firstname;
    _controllerName.text = _person.name;
  }

  @override
  void initState() {
    super.initState();
    _controllerFirstname = TextEditingController();
    _controllerName = TextEditingController();
    _person = Person(firstname: "firstname", name: "name");
    _controllerFirstname.addListener(() {
      setState(() {
        _isSame = _controllerFirstname.text == _person.firstname && _controllerName.text == _person.name || _controllerFirstname.text.isEmpty || _controllerName.text.isEmpty;
      });
    });
    _controllerName.addListener(() {
      setState(() {
        _isSame = _controllerFirstname.text == _person.firstname && _controllerName.text == _person.name || _controllerFirstname.text.isEmpty || _controllerName.text.isEmpty;
      });
    });
    _isSame = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.accountUpdateFirstnameNameSettingTitle)
      ),
      body: Container(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(DimensionConstant.radiusAccountSetting))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextInput(
                controller: _controllerFirstname,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                placeHolder: _person.firstname,
                clearText: true,
                title: AppLocalizations.of(context)!.accountUpdateFirstnameNameSettingTitleFirstname,
              ),
              const SizedBox(height: DimensionConstant.spaceAccountSetting,),
              TextInput(
                controller: _controllerName,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                placeHolder: _person.name,
                clearText: true,
                title: AppLocalizations.of(context)!.accountUpdateFirstnameNameSettingTitleName,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: ButtonStandard(
          title: AppLocalizations.of(context)!.accountUpdateFirstnameNameSettingButton,
          enabled: !_isSame,
          onTap: () async {
            await FirebaseAuthUtils.updateFullNameAccount(context, _controllerFirstname.text, _controllerName.text, (){
              _loadData();
            });
          }
        ),
      )
    );
  }
}