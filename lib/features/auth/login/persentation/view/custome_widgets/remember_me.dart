import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/helper/preferences_helper.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/custome_check_box.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool isTermsAccepted = false;

  @override
  void initState() {
    super.initState();
    _loadCheckboxState();
  }

  // Load saved checkbox state
  void _loadCheckboxState() async {
    bool isAccepted = await PreferencesHelper.getTermsAccepted();
    setState(() {
      isTermsAccepted = isAccepted;
      widget.onChanged(isTermsAccepted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 10),
      child: Row(
        children: [
          CustomCheckBox(
            onChecked: (value) {
              setState(() {
                isTermsAccepted = value;
                widget.onChanged(value);
                PreferencesHelper.setTermsAccepted(value); 
              });
            },
            isChecked: isTermsAccepted,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              "Remember me and keep me logged in",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
