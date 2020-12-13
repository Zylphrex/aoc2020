pub struct Entry {
    pub a: usize,
    pub b: usize,
    pub c: char,
    pub p: String,
}

fn parse_nums(s: &String) -> Option<(usize, usize)> {
    let mut xs = s.split("-").map(|x| x.parse().ok());
    let a = match xs.next() {
        Some(x) => x,
        None => return None,
    };
    let b = match xs.next() {
        Some(x) => x,
        None => return None,
    };
    return match (a, b) {
        (Some(x), Some(y)) => Some((x, y)),
        _ => None,
    };
}

fn parse_entry(line: &String) -> Option<Entry> {
    let mut parts = line.split_whitespace().map(|l| l.to_string());

    let xs: Option<(usize, usize)> = parts
        .next()
        .and_then(|x| parse_nums(&x.to_string()));
    let (a, b) = match xs {
        Some(x) => (x.0, x.1),
        None => return None,
    };

    let c = match parts.next().and_then(|s| s.chars().nth(0)) {
        Some(s) => s,
        None => return None,
    };

    let p = match parts.next() {
        Some(s) => s.to_string(),
        None => return None,
    };

    return Some(Entry{a, b, c, p});
}

pub fn parse_entries(input: &String) -> Option<Vec<Entry>> {
    let entries: Option<Vec<Entry>> = input
        .lines()
        .map(|line| parse_entry(&line.to_string()))
        .collect();
    return entries;
}
