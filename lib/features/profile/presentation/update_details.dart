import 'package:taro_leaf_blight/core/services/local_data/local_data.dart';
import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/core/utils/validators.dart';
import 'package:taro_leaf_blight/features/auth/presentation/login.dart';
import 'package:taro_leaf_blight/features/profile/providers/user_provider.dart';
import 'package:taro_leaf_blight/features/profile/services/user_service.dart';
import 'package:taro_leaf_blight/packages/packages.dart';

class UpdateDetailsScreen extends ConsumerStatefulWidget {
  const UpdateDetailsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      UpdateDetailsScreenState();
}

class UpdateDetailsScreenState extends ConsumerState<UpdateDetailsScreen> {
  final _emailAddressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? countryValue;
  String? stateValue;
  String? emailError;

  @override
  void initState() {
    super.initState();
    _emailAddressController.text = LocalData.email ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    _emailAddressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: backButton(context),
        elevation: 10,
        backgroundColor: AppColors.primary,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.gap,
              AppInput(
                controller: _emailAddressController,
                labelText: AppStrings.email,
                hintText: AppStrings.enteryouremail,
                validator: Validator().isEmail().isNotEmpty().validate,
                errorText: emailError,
                keyboardType: TextInputType.emailAddress,
              ),
              20.gap,
              CSCPicker(
                layout: Layout.vertical,
                flagState: CountryFlag.ENABLE,
                dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),
                countrySearchPlaceholder: "Country",
                stateSearchPlaceholder: "State",
                countryDropdownLabel: "Country",
                stateDropdownLabel: "State",
                selectedItemStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                dropdownHeadingStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
                dropdownItemStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                dropdownDialogRadius: 10.0,
                searchBarRadius: 10.0,
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value;
                  });
                },
              ),
              24.gap,
              AppButton(
                onPressed: emailError == null &&
                        countryValue != null &&
                        stateValue != null
                    ? () async {
                        if (_emailAddressController.text != LocalData.email) {
                          await userService.updateUser(
                              email: _emailAddressController.text,
                              country: countryValue,
                              countryState: stateValue);
                        } else {
                          await userService
                              .updateUser(
                                  email: _emailAddressController.text,
                                  country: countryValue,
                                  countryState: stateValue)
                              .then((value) => ref.invalidate(userProvider));
                        }
                      }
                    : null,
                label: AppStrings.updateDetails,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// in update details - if the emailController.txt changes , then make sure we Push the Login screen , push and clear stack
