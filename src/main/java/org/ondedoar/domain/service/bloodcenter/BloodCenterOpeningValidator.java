package org.ondedoar.domain.service.bloodcenter;

import org.ondedoar.domain.enums.BloodCenterStatus;

import java.time.ZoneId;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BloodCenterOpeningValidator {

    private static final ZoneId ZONE = ZoneId.of("America/Sao_Paulo");

    private static final Map<String, DayOfWeek> DAYS = Map.of(
            "seg", DayOfWeek.MONDAY,
            "ter", DayOfWeek.TUESDAY,
            "qua", DayOfWeek.WEDNESDAY,
            "qui", DayOfWeek.THURSDAY,
            "sex", DayOfWeek.FRIDAY,
            "sab", DayOfWeek.SATURDAY,
            "dom", DayOfWeek.SUNDAY
    );

    public static String validate(String openingHours) {

        if (openingHours == null || openingHours.isBlank()) {
            return BloodCenterStatus.FECHADO.getSituation();
        }

        String normalized = normalize(openingHours);

        if (normalized.contains("24h")) {
            return BloodCenterStatus.ABERTO.getSituation();
        }

        DayOfWeek today = LocalDate.now(ZONE).getDayOfWeek();
        LocalTime now = LocalTime.now(ZONE);

        String[] periods = normalized.split("/");

        for (String period : periods) {

            if (!isToday(period, today)) {
                continue;
            }

            LocalTime start = extractTime(period, true);
            LocalTime end = extractTime(period, false);

            if (start == null || end == null) {
                continue;
            }

            if (!now.isBefore(start) && !now.isAfter(end)) {
                return BloodCenterStatus.ABERTO.getSituation();
            }
        }

        return BloodCenterStatus.FECHADO.getSituation()
                + " | Abre de "
                + openingHours;
    }

    private static String normalize(String text) {

        return text.toLowerCase()
                .replace("às", "as")
                .replace("à", "a")
                .replaceAll("\\s+", " ")
                .trim();
    }

    private static boolean isToday(String period, DayOfWeek today) {

        Pattern rangePattern =
                Pattern.compile("(seg|ter|qua|qui|sex|sab|dom)\\s*a\\s*(seg|ter|qua|qui|sex|sab|dom)");

        Matcher rangeMatcher = rangePattern.matcher(period);

        if (rangeMatcher.find()) {

            DayOfWeek start = DAYS.get(rangeMatcher.group(1));
            DayOfWeek end = DAYS.get(rangeMatcher.group(2));

            return isWithinRange(today, start, end);
        }

        for (Map.Entry<String, DayOfWeek> entry : DAYS.entrySet()) {

            if (period.contains(entry.getKey())
                    && entry.getValue() == today) {

                return true;
            }
        }

        return false;
    }

    private static boolean isWithinRange(
            DayOfWeek current,
            DayOfWeek start,
            DayOfWeek end
    ) {

        int currentValue = current.getValue();
        int startValue = start.getValue();
        int endValue = end.getValue();

        return currentValue >= startValue
                && currentValue <= endValue;
    }

    private static LocalTime extractTime(String text, boolean start) {

        Pattern pattern =
                Pattern.compile("(\\d{1,2})h(?:(\\d{2}))?");

        Matcher matcher = pattern.matcher(text);

        List<LocalTime> times = new ArrayList<>();

        while (matcher.find()) {

            int hour = Integer.parseInt(matcher.group(1));

            int minute = matcher.group(2) != null
                    ? Integer.parseInt(matcher.group(2))
                    : 0;

            times.add(LocalTime.of(hour, minute));
        }

        if (times.size() < 2) {
            return null;
        }

        return start ? times.get(0) : times.get(1);
    }
}