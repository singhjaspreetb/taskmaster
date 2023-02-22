import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskmaster/common/theme_helper.dart';

class MyForm extends StatefulWidget {
  final Function(String) onSubmitted;

  const MyForm({super.key, required this.onSubmitted});
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String name = "";
  String courseInterest = "";
  String wakeUpTime = "";
  String collegeTime = "";
  String homeReachedTime = "";
  String numberOfHoursOfSleep = "";
  String numberOfDaysToLearn = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Name",
              hintText: "Enter your name",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
            onSaved: (value) {
              name = value!;
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Course Interest",
              hintText: "Enter your course interest",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your course interest";
              }
              return null;
            },
            onSaved: (value) {
              courseInterest = value!;
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Wake Up Time",
              hintText: "Enter your wake up time",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your wake up time";
              }
              return null;
            },
            onSaved: (value) {
              wakeUpTime = value!;
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "College Time (From - To)",
              hintText: "Enter your college time (from - to)",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your college time";
              }
              return null;
            },
            onSaved: (value) {
              collegeTime = value!;
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Home Reached Time",
              hintText: "Enter your home reached time",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your home reached time";
              }
              return null;
            },
            onSaved: (value) {
              homeReachedTime = value!;
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Number of Hours of Sleep",
              hintText: "Enter the number of hours you want to sleep",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the number of hours you want to sleep";
              }
              return null;
            },
            onSaved: (value) {
              numberOfHoursOfSleep = value!;
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Number of Days to Learn",
              hintText: "Enter the number of days you want to learn",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the number of days you want to learn";
              }
              return null;
            },
            onSaved: (value) {
              numberOfDaysToLearn = value!;
            },
          ),
          const SizedBox(
            height: 32.0,
          ),
          Container(
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: ElevatedButton(
              style: ThemeHelper().buttonStyle(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  'Submit'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  String promt =
                      "hey my name is $name i want to learn $courseInterest, i can give $numberOfDaysToLearn days per week, I have completed intermediate and pressuring engineering, my daily routine follows I wake up at $wakeUpTime am, then went collage from $collegeTime , then come back home $homeReachedTime pm, I want to sleep $numberOfHoursOfSleep hours, write me a time table for $numberOfDaysToLearn days in a week and complete learning timeline with roadmap and also suggest me paid and free learning recourse links for $courseInterest with topics";

                  // print(promt);
                  widget.onSubmitted(promt);
                  _formKey.currentState!.save();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
