package org.ondedoar.domain.service.bloodcenter;

import org.ondedoar.domain.enums.BloodCenterStatus;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BloodCenterOpeningValidator {

    public static String validate(String openingHours) {

        if (openingHours == null || openingHours.isBlank()) {
            return BloodCenterStatus.FECHADO.getSituation() + " | Abre de " + openingHours;
        }

        String normalized = openingHours.toLowerCase();

        if (normalized.contains("24h")) {
            return BloodCenterStatus.VERIFICAR_NO_SITE_OU_LIGANDO.getSituation();
        }

        DayOfWeek today = LocalDate.now().getDayOfWeek();
        LocalTime now = LocalTime.now();

        String currentDate;

        switch (today) {
            case MONDAY:
            case TUESDAY:
            case WEDNESDAY:
            case THURSDAY:
            case FRIDAY:
                currentDate = "sex";
                break;
            case SATURDAY:
                currentDate = "sab";
                break;
            case SUNDAY:
                currentDate = "dom";
                break;
            default:
                return BloodCenterStatus.FECHADO.getSituation() + " | Abre de " + openingHours;
        }

        String[] periods = normalized.split("/");

        for (String period : periods) {
            if (matchesCurrentDay(period, currentDate)) {
                LocalTime start = extractTime(period, true);
                LocalTime end = extractTime(period, false);

                if (start != null && end != null) {
                    if (!now.isBefore(start) && !now.isAfter(end)) {
                        return BloodCenterStatus.ABERTO.getSituation();
                    }
                }
            }
        }
        return BloodCenterStatus.FECHADO.getSituation() + " | Abre de " + openingHours;
    }

    private static LocalTime extractTime(String text, boolean start) {
        Pattern pattern = Pattern.compile("(\\\\d{1,2})h?(\\\\d{2})?");
        Matcher matcher = pattern.matcher(text);

        int count = 0;

        while (matcher.find()) {

            count++;

            if (start || count == 2) {

                int hour =  Integer.parseInt(matcher.group(1));

                int  minute = matcher.group(2) != null
                        ? Integer.parseInt(matcher.group(2))
                        : 0;

                return LocalTime.of(hour, minute);
            }
        }
        return null;
    }

    private static boolean matchesCurrentDay(String period, String currentDate) {

        if (currentDate.equals("sex")) {
            return period.contains("seg")
                    || period.contains("ter")
                    || period.contains("qua")
                    || period.contains("qui")
                    || period.contains("sex");
        }
        return period.contains(currentDate);
    }


}
