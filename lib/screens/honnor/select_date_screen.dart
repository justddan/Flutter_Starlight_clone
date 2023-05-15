import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_radius_button.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDateScreen extends StatefulWidget {
  final Function notifyParent;
  final Function setSelected;
  final DateTime startDate;
  final DateTime endDate;
  final int selectedIndex;

  const SelectDateScreen({
    super.key,
    required this.notifyParent,
    required this.setSelected,
    required this.startDate,
    required this.selectedIndex,
    required this.endDate,
  });

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final DateRangePickerController controller = DateRangePickerController();

    void selectionChanged(DateRangePickerSelectionChangedArgs args) {
      if (_selectedIndex == 0) {
        controller.selectedDate = args.value;
      } else if (_selectedIndex == 1) {
        int firstDayOfWeek = DateTime.sunday % 7;
        int endDayOfWeek = (firstDayOfWeek - 1) % 7;
        endDayOfWeek = endDayOfWeek < 0 ? 7 + endDayOfWeek : endDayOfWeek;
        PickerDateRange ranges = args.value;
        DateTime date1 = ranges.startDate!;
        DateTime date2 = (ranges.endDate ?? ranges.startDate)!;
        if (date1.isAfter(date2)) {
          var date = date1;
          date1 = date2;
          date2 = date;
        }
        int day1 = date1.weekday % 7;
        int day2 = date2.weekday % 7;

        DateTime dat1 = date1.add(Duration(days: (firstDayOfWeek - day1)));
        DateTime dat2 = date2.add(Duration(days: (endDayOfWeek - day2)));
        dat2 = dat2.isAfter(DateTime.now()) ? DateTime.now() : dat2;

        controller.selectedRange = PickerDateRange(dat1, dat2);
      } else if (_selectedIndex == 2) {
        PickerDateRange ranges = args.value;
        DateTime date1 = ranges.startDate!;
        DateTime date2 = (ranges.endDate ?? ranges.startDate)!;
        if (date1.isAfter(date2)) {
          var date = date1;
          date1 = date2;
          date2 = date;
        }

        DateTime firstDayOfMonth = DateTime(date1.year, date1.month, 1);
        DateTime endDayOfMonth = DateTime(date2.year, date2.month + 1, 0);
        endDayOfMonth = endDayOfMonth.isAfter(DateTime.now())
            ? DateTime.now()
            : endDayOfMonth;

        controller.selectedRange =
            PickerDateRange(firstDayOfMonth, endDayOfMonth);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Select the ${_selectedIndex == 1 ? "week" : _selectedIndex == 2 ? "month" : "date"}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonShortRadiusButton(
                    paddingVertical: 10,
                    paddingHorizontal: 15,
                    title: Text(
                      "Daily",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: _selectedIndex == 0
                                ? Colors.black
                                : Colors.white,
                          ),
                    ),
                    backgroundColor:
                        _selectedIndex == 0 ? Colors.white : Colors.black,
                    borderColor: Colors.white,
                    fun: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CommonShortRadiusButton(
                    paddingVertical: 10,
                    paddingHorizontal: 15,
                    title: Text(
                      "Weekly",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: _selectedIndex == 1
                                ? Colors.black
                                : Colors.white,
                          ),
                    ),
                    backgroundColor:
                        _selectedIndex == 1 ? Colors.white : Colors.black,
                    borderColor: Colors.white,
                    fun: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CommonShortRadiusButton(
                    paddingVertical: 10,
                    paddingHorizontal: 15,
                    title: Text(
                      "Monthly",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: _selectedIndex == 2
                                ? Colors.black
                                : Colors.white,
                          ),
                    ),
                    backgroundColor:
                        _selectedIndex == 2 ? Colors.white : Colors.black,
                    borderColor: Colors.white,
                    fun: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: screenWidth,
                color: Colors.black,
                child: SfDateRangePicker(
                  controller: controller,
                  initialDisplayDate: widget.startDate,
                  initialSelectedDate: widget.startDate,
                  initialSelectedRange:
                      PickerDateRange(widget.startDate, widget.endDate),
                  backgroundColor: Colors.black,
                  minDate: DateTime(2023),
                  maxDate: DateTime.now(),
                  view: DateRangePickerView.month,
                  onSelectionChanged: selectionChanged,
                  selectionMode: _selectedIndex == 0
                      ? DateRangePickerSelectionMode.single
                      : DateRangePickerSelectionMode.range,
                  monthViewSettings: DateRangePickerMonthViewSettings(
                    enableSwipeSelection: false,
                    showTrailingAndLeadingDates: true,
                    dayFormat: 'EEE',
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle:
                          Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontSize: 11,
                                color: Colors.white.withOpacity(0.4),
                              ),
                    ),
                  ),
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    todayTextStyle: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontSize: 11),
                    todayCellDecoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle,
                    ),
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontSize: 11),
                  ),
                  selectionTextStyle: const TextStyle(color: Colors.white),
                  selectionColor: Theme.of(context).colorScheme.secondary,
                  startRangeSelectionColor:
                      Theme.of(context).colorScheme.secondary,
                  endRangeSelectionColor:
                      Theme.of(context).colorScheme.secondary,
                  rangeSelectionColor:
                      Theme.of(context).colorScheme.onSecondary,
                  showNavigationArrow: true,
                  headerStyle: const DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15.0),
            child: CommonRadiusButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              borderColor: Colors.transparent,
              buttonText: "Confirm",
              buttonTextColor: Colors.black,
              fun: () {
                widget.notifyParent(
                  _selectedIndex == 0
                      ? controller.selectedDate!
                      : controller.selectedRange!.startDate!,
                  _selectedIndex == 0
                      ? controller.selectedDate!
                      : controller.selectedRange!.endDate!,
                );
                widget.setSelected(_selectedIndex);
                Get.back();
              },
            ),
          )
        ],
      ),
    );
  }
}
