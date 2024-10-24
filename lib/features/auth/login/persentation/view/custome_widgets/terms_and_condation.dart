import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/custome_check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditionsWidget> createState() => _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;

  @override
  void initState() {
    super.initState();
    _loadCheckboxState();
  }

  // Load saved checkbox state
  void _loadCheckboxState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isTermsAccepted = prefs.getBool('isTermsAccepted') ?? false;
      widget.onChanged(isTermsAccepted);
    });
  }

  // Save checkbox state when it's changed
  void _saveCheckboxState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTermsAccepted', value);
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
                _saveCheckboxState(value);  // Save state when checkbox is clicked
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
