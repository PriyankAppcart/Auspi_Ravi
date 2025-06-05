import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/timezone.dart' as tz;

class planets_rashi_nakshatra {

  List rashi = ["Mesh","Mesh","Vrushabh","Mithun","Karka",
    "Sinha","Kanya","Tula","Vrushchik","Dhanu","Makar","Kumbha","Meen"];
  var day=DateTime.now().weekday;
  var  today=DateTime.now();
  var nextDay=DateTime.now().add(Duration(days: 1));
  var prevDay=DateTime.now().subtract(Duration(days: 1));
  var CurrentTimeDayhora=0;
  var Hora_start="";
  var Hora_end="";
  var Hora_duration="";
  var graha="";
  var notificationSet=false;

  var equalTime= 0.00;
  var equalNightTime= 0.00;
  var dayNight="day";
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  List<String> getPlanetdata(var Planet_deg, String SunRise,String SunSet,String NextSunRise,String NextSunSet,String PrevSunRise,String PrevSunSet,MoonAge,Solar_deg, Hora_map) {
    var CurrentDate=today;
    var cday=0.0;
    var CRashi="";
    var rgood=false;
    var rbad=false;
    var app=false;
    var CNkh="";
    var ngood=false;
    var nbad=false;
    var CurrentTime=(DateTime.now().microsecondsSinceEpoch/1000000).round();
    var TodaySunRiseSplit=SunRise.split(":");
    var NextSunRiseSplit=NextSunRise.split(":");
    var PrevSunRiseSplit=PrevSunRise.split(":");


    var SetTodaySunriseTime=((DateTime(today.year,today.month,today.day,int.parse(TodaySunRiseSplit[0]),int.parse(TodaySunRiseSplit[1]),int.parse(TodaySunRiseSplit[2]))).microsecondsSinceEpoch/1000000).round();
    var SetNextSunriseTime=((DateTime(nextDay.year,nextDay.month,nextDay.day,int.parse(NextSunRiseSplit[0]),int.parse(NextSunRiseSplit[1]),int.parse(NextSunRiseSplit[2]))).microsecondsSinceEpoch/1000000).round();
    var SetPrevSunriseTime=((DateTime(prevDay.year,prevDay.month,prevDay.day,int.parse(PrevSunRiseSplit[0]),int.parse(PrevSunRiseSplit[1]),int.parse(PrevSunRiseSplit[2]))).microsecondsSinceEpoch/1000000).round();

    var SetTodaySunriseDate=DateTime(today.year,today.month,today.day,int.parse(TodaySunRiseSplit[0]),int.parse(TodaySunRiseSplit[1]),int.parse(TodaySunRiseSplit[2]));
    var SetNextSunriseDate=DateTime(nextDay.year,nextDay.month,nextDay.day,int.parse(NextSunRiseSplit[0]),int.parse(NextSunRiseSplit[1]),int.parse(NextSunRiseSplit[2]));
    var SetPrevSunriseDate=DateTime(prevDay.year,prevDay.month,prevDay.day,int.parse(PrevSunRiseSplit[0]),int.parse(PrevSunRiseSplit[1]),int.parse(PrevSunRiseSplit[2]));

    var TodaySunSetSplit=SunSet.split(":");
    var NextSunSetSplit=NextSunSet.split(":");
    var PrevSunSetSplit=PrevSunSet.split(":");

    var SetTodaySunsetTime=((DateTime(today.year,today.month,today.day,int.parse(TodaySunSetSplit[0]),int.parse(TodaySunSetSplit[1]),int.parse(TodaySunSetSplit[2]))).microsecondsSinceEpoch/1000000).round();
    var SetNextSunsetTime=((DateTime(nextDay.year,nextDay.month,nextDay.day,int.parse(NextSunSetSplit[0]),int.parse(NextSunSetSplit[1]),int.parse(NextSunSetSplit[2]))).microsecondsSinceEpoch/1000000).round();
    var SetPrevSunsetTime=((DateTime(prevDay.year,prevDay.month,prevDay.day,int.parse(PrevSunSetSplit[0]),int.parse(PrevSunSetSplit[1]),int.parse(PrevSunSetSplit[2]))).microsecondsSinceEpoch/1000000).round();

    var SetTodaySunsetDate=DateTime(today.year,today.month,today.day,int.parse(TodaySunSetSplit[0]),int.parse(TodaySunSetSplit[1]),int.parse(TodaySunSetSplit[2]));
    var SetNextSunsetDate=DateTime(nextDay.year,nextDay.month,nextDay.day,int.parse(NextSunSetSplit[0]),int.parse(NextSunSetSplit[1]),int.parse(NextSunSetSplit[2]));
    var SetPrevSunsetDate=DateTime(prevDay.year,prevDay.month,prevDay.day,int.parse(PrevSunSetSplit[0]),int.parse(PrevSunSetSplit[1]),int.parse(PrevSunSetSplit[2]));
    var days="";

    cday=Planet_deg;

    if(CurrentTime >= SetTodaySunriseTime ) {
      print("herinif");

      if(CurrentTime >= SetTodaySunsetTime)
      {
        print("herinifelseif");

        var NightTime = SetNextSunriseDate
            .difference(SetTodaySunsetDate)
            .inMinutes;
        var NighttimeNow = CurrentDate
            .difference(SetTodaySunsetDate)
            .inMinutes;
        var NighttimeEqual = NightTime / 12;
        dayNight="night";
        equalNightTime=NighttimeEqual;
        CurrentTimeDayhora = (NighttimeNow / NighttimeEqual).floor();
        var calc=(CurrentTimeDayhora*NighttimeEqual).floor();
        var horastartTime=SetTodaySunsetDate.add(Duration(minutes: calc));
        var horaendTime=SetTodaySunsetDate.add(Duration(minutes: (calc+NighttimeEqual).floor()));

        Hora_start="${horastartTime.hour} : ${horastartTime.minute} : ${horastartTime.second}";
        print("$Hora_start");
        Hora_end="${horaendTime.hour} : ${horaendTime.minute} : ${horaendTime.second}";
        Hora_duration="${NighttimeEqual.floor()}";

        CurrentTimeDayhora = CurrentTimeDayhora + 18;
        if (CurrentTimeDayhora >= 24) {
          CurrentTimeDayhora = CurrentTimeDayhora - 24;
        }

        print("CurrentTimeNighthora$CurrentTimeDayhora");
      }
      else {
        var Daytime = SetTodaySunsetDate
            .difference(SetTodaySunriseDate)
            .inMinutes;


        var DaytimeNow = CurrentDate
            .difference(SetTodaySunriseDate)
            .inMinutes;
        var DaytimeEqual = Daytime / 12;
        dayNight="day";
        equalTime=DaytimeEqual;
        CurrentTimeDayhora = (DaytimeNow / DaytimeEqual).floor();
        // CurrentTimeDayhora=(CurrentTimeDayhora/60).floor();
        var calc=(CurrentTimeDayhora*DaytimeEqual).floor();
        var horastartTime=SetTodaySunriseDate.add(Duration(minutes: calc));
        var horaendTime=SetTodaySunriseDate.add(Duration(minutes: (calc+DaytimeEqual).floor()));
        Hora_start="${horastartTime.hour} : ${horastartTime.minute} : ${horastartTime.second}";
        Hora_end="${horaendTime.hour} : ${horaendTime.minute} : ${horaendTime.second}";
        Hora_duration="${DaytimeEqual.floor()}";
        CurrentTimeDayhora = CurrentTimeDayhora + 6;
        if (CurrentTimeDayhora >= 18) {
          CurrentTimeDayhora = CurrentTimeDayhora - 18;
        }

        print("CurrentTimeDayhora$CurrentTimeDayhora");
      }
    }

    else if(CurrentTime < SetTodaySunriseTime)
    {
      print("herinelseif");
      var NightTime = SetTodaySunriseDate
          .difference(SetPrevSunsetDate)
          .inMinutes;
      var NighttimeNow = CurrentDate
          .difference(SetPrevSunsetDate)
          .inMinutes;
      var NighttimeEqual = NightTime / 12;
      dayNight="night";
      equalNightTime=NighttimeEqual;
      CurrentTimeDayhora = (NighttimeNow / NighttimeEqual).floor();
      var calc=(CurrentTimeDayhora*NighttimeEqual).floor();
      var horastartTime=SetPrevSunsetDate.add(Duration(minutes: calc));
      var horaendTime=SetPrevSunsetDate.add(Duration(minutes: (calc+NighttimeEqual).floor()));
      Hora_start="${horastartTime.hour} : ${horastartTime.minute} : ${horastartTime.second}";
      Hora_end="${horaendTime.hour} : ${horaendTime.minute} : ${horaendTime.second}";
      Hora_duration="${NighttimeEqual.floor()}";
      CurrentTimeDayhora = CurrentTimeDayhora + 18;
      if (CurrentTimeDayhora >= 24) {
        CurrentTimeDayhora = CurrentTimeDayhora - 24;
      }

      print("CurrentTimeDayhora$CurrentTimeDayhora");
    }
    else
    {
      print("herinelse");
      var Daytime = SetTodaySunsetDate
          .difference(SetTodaySunriseDate)
          .inMinutes;


      var DaytimeNow = CurrentDate
          .difference(SetTodaySunriseDate)
          .inMinutes;
      var DaytimeEqual = Daytime / 12;
      dayNight="day";
      equalTime=DaytimeEqual;
      CurrentTimeDayhora = (DaytimeNow / DaytimeEqual).floor();
      var calc=(CurrentTimeDayhora*DaytimeEqual).floor();
      var horastartTime=SetTodaySunriseDate.add(Duration(minutes: calc));
      var horaendTime=SetTodaySunriseDate.add(Duration(minutes: (calc+DaytimeEqual).floor()));
      Hora_start="${horastartTime.hour} : ${horastartTime.minute} : ${horastartTime.second}";
      Hora_end="${horaendTime.hour} : ${horaendTime.minute} : ${horaendTime.second}";
      Hora_duration="${DaytimeEqual.floor()}";
      CurrentTimeDayhora = CurrentTimeDayhora + 6;
      if (CurrentTimeDayhora >= 18) {
        CurrentTimeDayhora = CurrentTimeDayhora - 18;
      }

      print("CurrentTimeDayhora$CurrentTimeDayhora");
    }
    //print(DateTime.fromMillisecondsSinceEpoch(CurrentTimeDayhora));
    //var DateSec=DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,7,12,0);
    /***** Notification Logic start ******/

    // var RahutimeNow = SetTodaySunsetDate
    //     .difference(SetTodaySunriseDate)
    //     .inMinutes;
    // var RahutimeEqual = RahutimeNow / 8;
    // Map RahuTimeDaywise ={0:7,1:1,2:6,3:4,4:5,5:3,6:2,7:7};
    //
    // var rahuCalc= RahuTimeDaywise[day]*RahutimeEqual;
    // var rahukaalstartTime=SetTodaySunriseDate.add(Duration(minutes: rahuCalc.floor()));
    // var rahukaalendTime=SetTodaySunriseDate.add(Duration(minutes: (rahuCalc+RahutimeEqual).floor()));
    // rahukaal_start="${rahukaalstartTime.hour} : ${rahukaalstartTime.minute} : ${rahukaalstartTime.second}";
    // // rahukaal_end="${rahukaalendTime.hour} : ${rahukaalendTime.minute} : ${rahukaalendTime.second}";
    // // var rahukaalstartEarlyNotify=rahukaalstartTime.subtract(Duration(minutes: 60));
    // print("Today  $day");
    // print("rahukaalstartTime  $rahukaalstartTime");
    // print("rahukaalendTime  $rahukaalendTime");
    // print("Day or Night  $dayNight");
    // print("Equaltime  $equalTime");
    // print("Equaltime  $equalNightTime");
    if(!notificationSet) {
      final tz.TZDateTime now2 = tz.TZDateTime.now(tz.local);
      // if(rahukaalstartEarlyNotify.isAfter(now2)) {
      //   scheduleDailyTenAMNotification(98, "Rahu Kaal will start in an Hour.",
      //       "Rahu Kaal ${rahukaalstartTime}", rahukaalstartEarlyNotify);
      // }
      // if(rahukaalstartTime.isAfter(now2)) {
      //   scheduleDailyTenAMNotification(97, "Rahu Kaal Started",
      //       "Rahu Kaal \n(Starts:${rahukaalstartTime}) \n(Ends:${rahukaalendTime})",
      //       rahukaalstartTime);
      // }
      // if(rahukaalendTime.isAfter(now2)) {
      //   scheduleDailyTenAMNotification(
      //       96, "Rahu Kaal Ended", "Rahu Kaal Ends.", rahukaalendTime);
      // }
      //
      equalTime=0.00;
      for (var i = 0; i < 24; i++) {
        if (i < 12) {
          var calc = (i * equalTime).floor();

          var NotifystartTime = SetTodaySunriseDate.add(
              Duration(minutes: calc));
          var CurrentTime=(NotifystartTime.microsecondsSinceEpoch/1000000).round();
          if(CurrentTime >= SetTodaySunriseTime ) {
             print("1-if-else");
            var Daytime = SetTodaySunsetDate
                .difference(SetTodaySunriseDate)
                .inMinutes;
            var DaytimeNow = CurrentDate
                .difference(SetTodaySunriseDate)
                .inMinutes;
            var DaytimeEqual = Daytime / 12;
            dayNight="day";
            equalTime=DaytimeEqual;
          }

          var horahours = i + 6;
          if (horahours > 24)
            horahours = horahours - 24;
          var NotifyHora = Hora_map![day][horahours];

          print(
              "NotifystartTime:  $NotifystartTime -- NotifyHora:  $NotifyHora");
          //  final tz.TZDateTime now2 = tz.TZDateTime.now(tz.local);
          if(NotifystartTime.isAfter(now2)) {
            if(NotifyHora!="-") {
              scheduleDailyTenAMNotification(
                  i, "New Hora Started", "$NotifyHora", NotifystartTime);
            }
          }
        }
        else{

          var calc = ((i-12) * equalNightTime).floor();

          var NotifystartTime = SetTodaySunsetDate.add(
              Duration(minutes: calc));
          //print("NotifystartTime: $NotifystartTime");
          var CurrentTime=(NotifystartTime.microsecondsSinceEpoch/1000000).round();
          if(CurrentTime >= SetTodaySunriseTime ) {
            //print("2-if");
            if(CurrentTime >= SetTodaySunsetTime)
            {
              // print("2-if-if");
              var NightTime = SetNextSunriseDate
                  .difference(SetTodaySunsetDate)
                  .inMinutes;
              var NighttimeNow = CurrentDate
                  .difference(SetTodaySunsetDate)
                  .inMinutes;
              var NighttimeEqual = NightTime / 12;
              dayNight="night";
              equalNightTime=NighttimeEqual;
            }
            else {
              // print("2-if-else");
              var Daytime = SetTodaySunsetDate
                  .difference(SetTodaySunriseDate)
                  .inMinutes;
              var DaytimeNow = CurrentDate
                  .difference(SetTodaySunriseDate)
                  .inMinutes;
              var DaytimeEqual = Daytime / 12;
              dayNight="day";
              equalTime=DaytimeEqual;
            }
          }
          else if(CurrentTime < SetTodaySunriseTime)
          {
            // print("2-elseif");

            var NightTime = SetTodaySunriseDate
                .difference(SetPrevSunsetDate)
                .inMinutes;
            var NighttimeNow = CurrentDate
                .difference(SetPrevSunsetDate)
                .inMinutes;
            var NighttimeEqual = NightTime / 12;
            dayNight="night";
            equalNightTime=NighttimeEqual;
          }
          else
          {
            //print("2-else");
            var Daytime = SetTodaySunsetDate
                .difference(SetTodaySunriseDate)
                .inMinutes;
            var DaytimeNow = CurrentDate
                .difference(SetTodaySunriseDate)
                .inMinutes;
            var DaytimeEqual = Daytime / 12;
            dayNight="day";
            equalTime=DaytimeEqual;
          }
          var horahours = i + 6;
          if (horahours > 24)
            horahours = horahours - 24;
          var NotifyHora = Hora_map![day][horahours];
          if((i+6)<22) {
            print(
                "NotifystartTime:  $NotifystartTime -- NotifyHora:  $NotifyHora");
            // final tz.TZDateTime now2 = tz.TZDateTime.now(tz.local);
            if(NotifyHora !="") {
              if (NotifystartTime.isAfter(now2)) {
                if(NotifyHora!="-") {
                  scheduleDailyTenAMNotification(
                      i, "New Hora Started", "$NotifyHora", NotifystartTime);
                }
              }
            }
          }
        }
      }

      scheduleDailyTenAMNotification(
          99, "Good Morning!!!", "Open AuspiWatch once to get today's Hora Notifications.",SetNextSunriseDate );
      scheduleDailynewTempNotification();
    }
    notificationSet=true;
    /* Notification Logic end */

    if(day == 7 && CurrentTime >= SetTodaySunriseTime || day == 7 && SetTodaySunsetTime<CurrentTime || day == 1 && CurrentTime < SetTodaySunriseTime)
    {
      days = "Sunday";
    }
    else if(day == 1 && CurrentTime >= SetTodaySunriseTime || day == 1 && SetTodaySunsetTime<CurrentTime || day == 2 && CurrentTime < SetTodaySunriseTime)
      {
        days = "Monday";
      }
    else
    if(day == 2 && CurrentTime >= SetTodaySunriseTime || day == 2 && SetTodaySunsetTime<CurrentTime || day == 3 && CurrentTime < SetTodaySunriseTime)
    {
      days = "Tuesday";
    }
    else
    if(day == 3 && CurrentTime >= SetTodaySunriseTime || day == 3 && SetTodaySunsetTime<CurrentTime || day == 4 && CurrentTime < SetTodaySunriseTime)
    {
      days = "Wednesday";
    }
    else
    if(day == 4 && CurrentTime >= SetTodaySunriseTime || day == 4 && SetTodaySunsetTime<CurrentTime || day == 5 && CurrentTime < SetTodaySunriseTime)
    {
      days = "Thursday";
    }
    else
    if(day == 5 && CurrentTime >= SetTodaySunriseTime || day == 5 && SetTodaySunsetTime<CurrentTime || day == 6 && CurrentTime < SetTodaySunriseTime)
    {
      days = "Friday";
    }
    else
    if(day == 6 && CurrentTime >= SetTodaySunriseTime || day == 6 && SetTodaySunsetTime<CurrentTime || day == 7 && CurrentTime < SetTodaySunriseTime)
    {
      days = "Saturday";
    }
    if(cday<=0)
    {
      cday=360+cday;

    }

    if(cday<=(9.0*1.0*360.0/108.0))
    {
      CRashi=rashi[1];
      rgood=false;
      rbad=true;
      app=false;
    }

    else if(cday<=(9.0*2.0*360.0/108.0))
    {
      CRashi=rashi[2];
      rgood=false;
      rbad=false;
      app=false;
    }

    else if(cday<=(9.0*3.0*360.0/108.0))
    {
      CRashi=rashi[3];
      rgood=false;
      rbad=false;
      app=false;
    }

    else if(cday<=(9.0*4.0*360.0/108.0))
    {
      CRashi=rashi[4];
      rgood=false;
      rbad=false;
      app=false;
    }

    else if(cday<=(9.0*5.0*360.0/108.0))
    {
      CRashi=rashi[5];
      rgood=false;
      rbad=false;
      app=false;
    }

    else if(cday<=(9.0*6.0*360.0/108.0))
    {
      CRashi=rashi[6];
      rgood=false;
      rbad=false;
      app=false;
    }

    else if(cday<=(9.0*7.0*360.0/108.0))
    {
      CRashi=rashi[7];
      rgood=true;
      rbad=false;
      app=false;
    }

    else if(cday<=(9.0*8.0*360.0/108.0))
    {
      CRashi=rashi[8];
      rgood=false;
      rbad=false;
      app=false;
    }

    else if(cday<=(9.0*9.0*360.0/108.0))
    {
      CRashi=rashi[9];
      rgood=false;
      rbad=false;
      app=false;
    }

    else if(cday<=(9.0*10.0*360.0/108.0))
    {
      CRashi=rashi[10];
      rgood=false;
      rbad=false;
      app=true;
    }

    else if(cday<=(9.0*11.0*360.0/108.0))
    {
      CRashi=rashi[11];
      rgood=false;
      rbad=false;
      app=true;
    }

    else if(cday<=(9.0*12.0*360.0/108.0))
    {
      CRashi=rashi[12];
      rgood=false;
      rbad=false;
      app=false;
    }

    if(cday<=(4.0*1.0*360.0/108.0))
    {
      CNkh="Ashwini";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*2.0*360.0/108.0))
    {
      CNkh="Bharani";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*3.0*360.0/108.0))
    {
      CNkh="Krutika";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*4.0*360.0/108.0))
    {
      CNkh="Rohini";
      ngood=true;
      nbad=false;
    }
    else if(cday<=(4.0*5.0*360.0/108.0))
    {
      CNkh="Mruga";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*6.0*360.0/108.0))
    {
      CNkh="Ardra";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*7.0*360.0/108.0))
    {
      CNkh="Punarvasu";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*8.0*360.0/108.0))
    {
      CNkh="Pushya";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*9.0*360.0/108.0))
    {
      CNkh="Ashlesha";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*10.0*360.0/108.0))
    {
      CNkh="Magha";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*11.0*360.0/108.0))
    {
      CNkh="Purva Falgun";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*12.0*360.0/108.0))
    {
      CNkh="Uttara Falgun";
      ngood=false;
      nbad=true;
    }
    else if(cday<=(4.0*13.0*360.0/108.0))
    {
      CNkh="Hasta";
      ngood=false;
      nbad=true;
    }
    else if(cday<=(4.0*14.0*360.0/108.0))
    {
      CNkh="Chitra";
      ngood=false;
      nbad=true;
    }
    else if(cday<=(4.0*15.0*360.0/108.0))
    {
      CNkh="Swati";
      ngood=true;
      nbad=false;
    }
    else if(cday<=(4.0*16.0*360.0/108.0))
    {
      CNkh="Vishakha";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*17.0*360.0/108.0))
    {
      CNkh="Anuradha";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*18.0*360.0/108.0))
    {
      CNkh="Jyeshtha";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*19.0*360.0/108.0))
    {
      CNkh="Mula";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*20.0*360.0/108.0))
    {
      CNkh="Poorvashadha";
      ngood=false;
      nbad=false;
    }
    else if(cday>(4.0*20.0*360.0/108.0)&& cday<=(83.0*360.0/108.0))
    {
      CNkh="UttaraShadha";
      ngood=false;
      nbad=false;
    }
    else if(cday>(83.0*360.0/108.0)&& cday<=(4.0*21.0*360.0/108.0))
    {
      CNkh="Abijat";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*22.0*360.0/108.0))
    {
      CNkh="Shravan";
      ngood=true;
      nbad=false;
    }
    else if(cday<=(4.0*23.0*360.0/108.0))
    {
      CNkh="Dhanishtha";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*24.0*360.0/108.0))
    {
      CNkh="Shatataraka";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*25.0*360.0/108.0))
    {
      CNkh="PoorvaBhadrapada";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*26.0*360.0/108.0))
    {
      CNkh="UttaraBhadrapada";
      ngood=false;
      nbad=false;
    }
    else if(cday<=(4.0*27.0*360.0/108.0))
    {
      CNkh="Revati";
      ngood=false;
      nbad=false;
    }
    List<String> return_value=[CRashi,CNkh,graha,days,"$cday",Hora_duration,Hora_start,Hora_end];
    //List<String> return_value=["dsfdsf,asdsadsad"];
    print("Planet Values:--- $return_value");
    return return_value;
  }
  Future <void> scheduleDailyTenAMNotification(int i, String title,String body,NotifystartTime) async {

    await _notificationsPlugin.zonedSchedule(
      i,
      title,
      body,
      nextInstanceOfTenAM(NotifystartTime),
      // tz.TZDateTime.now(tz.local).add(Duration(seconds: 10)),
      const NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: "ashwin",
            importance: Importance.max,
            priority: Priority.max),
      ),

      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,);
    //matchDateTimeComponents: DateTimeCofmponents.time);
  }
  tz.TZDateTime nextInstanceOfTenAM(NotifystartTime) {
    // print("Here in TZ");
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, NotifystartTime.year, NotifystartTime.month,
        NotifystartTime.day, NotifystartTime.hour, NotifystartTime.minute,NotifystartTime.second);
    if (scheduledDate.isBefore(now)) {
      //scheduledDate = scheduledDate.add(const Duration(seconds: 30));

    }
    print(scheduledDate.toString());
    return scheduledDate;
  }
  Future <void> scheduleDailynewTempNotification() async {

    await _notificationsPlugin.zonedSchedule(
      999,
      'In MoonCalc',
      'Calculations Done.',
      newTempNotification(),
      // tz.TZDateTime.now(tz.local).add(Duration(seconds: 10)),
      const NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: "ashwin",
            importance: Importance.max,
            priority: Priority.max),
      ),

      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,);
    //matchDateTimeComponents: DateTimeComponents.time);
  }
  tz.TZDateTime newTempNotification() {
    print("Here in TZ");
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, now.hour, now.minute,now.second);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(seconds: 30));

    }
    print(scheduledDate.toString());
    return scheduledDate;
  }
  }
