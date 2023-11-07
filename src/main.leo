program AleoTime;

struct Time {
    hour: u8,
    minute: u8,
}

struct TimeZoneConversion {
    name: str,
    offset: i8,
}

function convert_time(utc_time: Time, conversion: TimeZoneConversion) -> (str, Time) {
    let mut new_hour = utc_time.hour as i16 + conversion.offset as i16;

    if new_hour >= 24 {
        new_hour -= 24;
    } else if new_hour < 0 {
        new_hour += 24;
    }

    return (conversion.name, Time {
        hour: new_hour as u8,
        minute: utc_time.minute,
    });
}

function main(utc_time: Time, conversions: [TimeZoneConversion; 5]) -> [(str, Time); 5] {
    var results: [(str, Time); 5] = [
        ("", Time { hour: 0, minute: 0 }),
        ("", Time { hour: 0, minute: 0 }),
        ("", Time { hour: 0, minute: 0 }),
        ("", Time { hour: 0, minute: 0 }),
        ("", Time { hour: 0, minute: 0 })
    ];

    for i in 0..5 {
        results[i] = convert_time(utc_time, conversions[i]);
    }

    return results;
}
