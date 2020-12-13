use crate::day2::util::{Entry, parse_entries};

fn is_valid(entry: &Entry) -> bool {
    let count = entry.p.matches(&entry.c.to_string()).count();
    return entry.a <= count && count <= entry.b;
}

pub fn day2part1(input: &String) -> Option<String> {
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
