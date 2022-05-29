import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:mano_sodas_final/constants/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/event.dart';

// ignore: use_key_in_widget_constructors
class CalendarScreen extends StatefulWidget {
  
 

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
 late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

// //sustabdo kontrolleri ir isval oduomenis kai iseini is lango
  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalendorius'),
        // leading: GestureDetector(
        //   onTap: () {
        //     context.goNamed(homeRouteName);
        //   },
        //   child: const Icon(Icons.backspace),
        // ),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              // testavimas print(focusedDay);
            },
            //paryskina pasirinkta diena
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.lightGreen,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              //defaultDecoration ir weekendDecoration, kad nemestu klaidos
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              //rodo koks formatas bus paspaudus menesis, savaite ..
              //o ne kuris yra dabar, jei true
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          //iskleidzia visus event i kalendoriu
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => ListTile(
              title: Text(
                event.title,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        //showDialog isokantis langas
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Pridėti priminimą"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: Text("Atšaukti"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Patvirtinti"),
                //Kas buna jei renkasi patvirtinti
                onPressed: () {
                  //jei laukas tuscias
                  if (_eventController.text.isEmpty) {

                  } else {
                    //jei ta diena jau yra sukurtas eventas
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]!.add(
                        Event(title: _eventController.text),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(title: _eventController.text)
                      ];
                    }

                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState((){});
                  return;
                },
              ),
            ], //Column children
          ),
        ),
        label: Text("Pridėti priminimą"),
        icon: Icon(Icons.add),
      ),
    );
  }
}