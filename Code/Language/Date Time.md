### ISO 8601
most standard descending date time format

| Specifier  | Example    | Description              |
| ---------- | ---------- | ------------------------ |
| **`d`**    | `16`       | Day of the month `1–31`  |
| **`dd`**   | `16`       | Day of the month `01–31` |
| **`ddd`**  | `Thu`      | Abbreviated weekday name |
| **`dddd`** | `Thursday` | Full weekday name        |
| **`M`**    | `4`        | Month number `1–12`      |
| **`MM`**   | `04`       | Month number `01–12`     |
| **`MMM`**  | `Apr`      | Abbreviated month name   |
| **`MMMM`** | `April`    | Full month name          |
| **`y`**    | `26`       | Year `0–99`              |
| **`yy`**   | `26`       | Year `00–99`             |
| **`yyyy`** | `2026`     | Full 4-digit year        |
| **`C`**    | `20`       | Century `Year // 100`    |
| **`g`**    | `A.D.`     | Era `B.C. / A.D.`        |

``` python
YYYY-MM-DD # Date: 2026-04-16
hh:mm:ss # Time: 06:31:25
YYYY-MM-DD'T'hh:mm:ss # DateTime: 2026-04-16T06:31:25
±hh:mm # UTC/Time Zone: 2026-04-16T06:31:25+04:00, use 'Z' for UTC: 2026-04-16T06:31:25Z
YYYY-Www-D # Week Date: 2026-W16-4
YYYY-MM-DD'T'hh:mm:ss.micros # Extended: 2026-04-16T06:31:25.915239Z

%Y # Year

from datetime import datetime, date, time, timedelta, timezone

timedelta(days=1, hours=2, minutes=3, seconds=4)
datetime(2026, 4, 16, 6, 31, 25)
time(6, 31, 25)

dt1 - dt2 => timedelta
dt + timedelta => dt_new

dt = datetime.now(timezone(timedelta(hours=+4))) # 2026-04-16 06:31:25.915239+04:00
date.today() # 2026-04-16
datetime.timestamp() # Seconds since 1970

dt.year, dt.month, dt.day, dt.hour, dt.second, dt.microsecond
dt.time() # 06:31:25.915239
dt.timetz() # 06:31:25.915239+04:00
dt.weekday() # 0-6 => Mon-Sun
dt.isoweekday() # 1-7 => Mon-Sun
dt.strftime("%Y-%m-%d %H:%M:%S") # to formatted string
datetime.strptime("2024-06-01 12:00:00", "%Y-%m-%d %H:%M:%S") # from formatted string

# affects strftime output language
locale.setlocale(locale.LC_ALL, 'ka_GE.UTF-8') # %B: April => აპრილი
```