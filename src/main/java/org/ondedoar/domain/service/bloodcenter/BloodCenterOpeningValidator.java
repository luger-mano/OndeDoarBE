package org.ondedoar.domain.service.bloodcenter;

import org.ondedoar.domain.enums.BloodCenterStatus;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
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
            "dom", DayOfWeek.SUNDAY,
            "domingo", DayOfWeek.SUNDAY
    );

    public static String validate(String openingHours) {
        if (openingHours == null || openingHours.isBlank()) {
            return BloodCenterStatus.FECHADO.getSituation();
        }

        String normalized = normalize(openingHours);
        String formattedHours = formatOpeningHours(openingHours);

        if (normalized.contains("24h")) {
            return BloodCenterStatus.ABERTO.getSituation() + ": " + formattedHours;
        }

        LocalDate todayDate = LocalDate.now(ZONE);
        DayOfWeek today = todayDate.getDayOfWeek();
        LocalTime now = LocalTime.now(ZONE);

        String[] periods = normalized.split("/");

        boolean opensToday = false;
        LocalTime latestEndTimeToday = LocalTime.MIN;

        for (String period : periods) {
            if (isDayMatching(period, today)) {
                opensToday = true;
                LocalTime start = extractTime(period, true);
                LocalTime end = extractTime(period, false);

                if (start != null && end != null) {
                    if (end.isAfter(latestEndTimeToday)) {
                        latestEndTimeToday = end;
                    }
                    if (!now.isBefore(start) && !now.isAfter(end)) {
                        return BloodCenterStatus.ABERTO.getSituation() + ": " + formattedHours;
                    }
                }
            }
        }

        if (opensToday && now.isBefore(latestEndTimeToday)) {
            return "Abre hoje às " + getEarliestStartTime(periods, today) + ": " + formattedHours;
        }

        for (int i = 1; i <= 7; i++) {
            LocalDate nextDate = todayDate.plusDays(i);
            DayOfWeek nextDay = nextDate.getDayOfWeek();

            for (String period : periods) {
                if (isDayMatching(period, nextDay)) {
                    String timeStr = getEarliestStartTime(periods, nextDay);
                    String timeSuffix = timeStr != null ? " às " + timeStr : "";

                    if (i == 1) {
                        return "Abre amanhã" + timeSuffix + ": " + formattedHours;
                    } else {
                        String dayName = nextDay.getDisplayName(TextStyle.FULL, new Locale("pt", "BR"));
                        String formattedDay = dayName.split("-")[0];
                        return "Abre " + formattedDay + timeSuffix + ": " + formattedHours;
                    }
                }
            }
        }

        return BloodCenterStatus.FECHADO.getSituation() + ": " + formattedHours;
    }

    private static String formatOpeningHours(String openingHours) {
        if (openingHours == null) return "";

        String[] parts = openingHours.split("/");
        StringBuilder sb = new StringBuilder();

        for (String part : parts) {
            String trimmedPart = part.trim();
            if (trimmedPart.isEmpty()) continue;

            Pattern timePattern = Pattern.compile("\\b\\d{1,2}h");
            Matcher matcher = timePattern.matcher(trimmedPart);

            if (matcher.find()) {
                int timeStartIndex = matcher.start();

                String dayPart = trimmedPart.substring(0, timeStartIndex).trim();
                dayPart = dayPart.replaceAll("^[- ]+|[- ]+$", "");

                String timePart = trimmedPart.substring(timeStartIndex).trim();

                if (sb.length() > 0) {
                    sb.append(" ");
                }

                sb.append(dayPart).append(" (").append(timePart).append(")");
            } else {
                if (sb.length() > 0) {
                    sb.append(" ");
                }
                sb.append(trimmedPart);
            }
        }

        return sb.toString();
    }

    private static String normalize(String text) {
        return text.toLowerCase()
                .replace("às", "as")
                .replace("à", "a")
                .replaceAll("\\s+", " ")
                .trim();
    }

    private static boolean isDayMatching(String period, DayOfWeek day) {
        Pattern rangePattern = Pattern.compile("(seg|ter|qua|qui|sex|sab|dom(?:ingo)?)\\s*a\\s*(seg|ter|qua|qui|sex|sab|dom(?:ingo)?)");
        Matcher rangeMatcher = rangePattern.matcher(period);

        if (rangeMatcher.find()) {
            DayOfWeek start = DAYS.get(rangeMatcher.group(1));
            DayOfWeek end = DAYS.get(rangeMatcher.group(2));
            return isWithinRange(day, start, end);
        }

        for (Map.Entry<String, DayOfWeek> entry : DAYS.entrySet()) {
            if (period.contains(entry.getKey()) && entry.getValue() == day) {
                return true;
            }
        }
        return false;
    }

    private static boolean isWithinRange(DayOfWeek current, DayOfWeek start, DayOfWeek end) {
        int currentValue = current.getValue();
        int startValue = start.getValue();
        int endValue = end.getValue();

        if (startValue <= endValue) {
            return currentValue >= startValue && currentValue <= endValue;
        } else {
            return currentValue >= startValue || currentValue <= endValue;
        }
    }

    private static String getEarliestStartTime(String[] periods, DayOfWeek day) {
        LocalTime earliest = null;
        for (String period : periods) {
            if (isDayMatching(period, day)) {
                LocalTime start = extractTime(period, true);
                if (start != null && (earliest == null || start.isBefore(earliest))) {
                    earliest = start;
                }
            }
        }
        if (earliest != null) {
            return String.format("%02dh%02d", earliest.getHour(), earliest.getMinute()).replace("h00", "h");
        }
        return null;
    }

    private static LocalTime extractTime(String text, boolean start) {
        Pattern pattern = Pattern.compile("(\\d{1,2})h(?:(\\d{2}))?");
        Matcher matcher = pattern.matcher(text);
        List<LocalTime> times = new ArrayList<>();

        while (matcher.find()) {
            int hour = Integer.parseInt(matcher.group(1));
            int minute = matcher.group(2) != null ? Integer.parseInt(matcher.group(2)) : 0;
            times.add(LocalTime.of(hour, minute));
        }

        if (times.size() < 2) {
            return null;
        }
        return start ? times.get(0) : times.get(1);
    }
}