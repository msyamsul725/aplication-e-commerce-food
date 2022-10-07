import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/input/input.dart';
import '../abstract/input_control/input_control.dart';

class ExRadioWithCustomOptions extends StatefulWidget {
  final String id;
  final String? label;
  final String? value;
  final List<Map<String, dynamic>>? items;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  const ExRadioWithCustomOptions({
    Key? key,
    required this.id,
    required this.items,
    this.label = "",
    this.value,
    this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  @override
  _ExRadioWithCustomOptionsState createState() =>
      _ExRadioWithCustomOptionsState();
}

class _ExRadioWithCustomOptionsState extends State<ExRadioWithCustomOptions>
    implements InputControlState {
  String? selectedValue;
  List<Map<String, dynamic>> items = [];
  String newOption = "";

  @override
  void initState() {
    super.initState();
    items = List.from(widget.items!);
    if (widget.value == null) {
      selectedValue = items[0]["label"];
      Input.set(widget.id, items[0]["value"]);
    } else {
      selectedValue = widget.value!;
    }

    if (widget.value == null) {
      selectedValue = items[0]["value"];
    }
    Input.inputController[widget.id] = this;
  }

  @override
  setValue(value) {
    var selectedComboItem = items.where((i) => i["value"] == value).toList();

    if (selectedComboItem.isEmpty) {
      Input.set(widget.id, items[0]["value"]);
      selectedValue = items[0]["label"];
    } else {
      var selectedIndex = items.indexOf(selectedComboItem[0]);
      Input.set(widget.id, items[selectedIndex]["value"]);
      selectedValue = items[selectedIndex]["label"];
    }

    setState(() {});
  }

  @override
  resetValue() {
    setState(() {
      Input.set(widget.id, items[0]["value"]);
      selectedValue = items[0]["label"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: widget.label!.isNotEmpty ? 80.0 : 60.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.label!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
                top: 4.0,
                bottom: 4.0,
              ),
              child: Text("${widget.label}"),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = items[index];
                bool selected = selectedValue == item["value"];

                return Row(
                  children: [
                    if (index == 0)
                      IconButton(
                        onPressed: () async {
                          await Get.defaultDialog(
                            title: "Add Custom Options",
                            content: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.only(),
                                  child: TextFormField(
                                    initialValue: 'John Doe',
                                    maxLength: 20,
                                    decoration: const InputDecoration(
                                      labelText: 'Name',
                                      labelStyle: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      helperText: "What's your name?",
                                    ),
                                    onChanged: (value) {
                                      newOption = value;
                                    },
                                  ),
                                ),
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.add),
                                  label: const Text("Add"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    items.add({
                                      "label": newOption,
                                      "value": newOption,
                                    });
                                    setState(() {});
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 24.0,
                        ),
                      ),
                    InkWell(
                      onTap: () {
                        selectedValue = item["value"];
                        setState(() {});
                        if (widget.onChanged != null) {
                          widget.onChanged!(selectedValue!);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selected
                              ? Theme.of(context).primaryColor
                              : Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Center(
                            child: Text(
                          "${item["value"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selected ? Colors.white : Colors.grey[400],
                          ),
                        )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
