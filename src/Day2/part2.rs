use crate::day2::util::{Entry, parse_entries};

fn is_valid(entry: &Entry) -> bool {
    let bytes = entry.p.as_bytes();
    let a = bytes[entry.a - 1] as char;
    let b = bytes[entry.b - 1] as char;
    return (a == entry.c) != (b == entry.c);
}

pub fn day2part2(input: &String) -> Option<String> {
    let entries = match parse_entries(input) {
        Some(e) => e,
        None => return None,
    };
    let valid_entries: Vec<&Entry> = entries
        .iter()
        .filter(|e| is_valid(e))
        .collect();
    return Some(valid_entries.len().to_string());
}
