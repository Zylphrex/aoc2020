use crate::util::util::{parse_ints};

pub fn day1part1(input: &String) -> Option<String> {
    let xs = parse_ints(input);

    return match solve(2020, xs) {
        Some((a, b)) => Some(((a * b)).to_string()),
        None => None,
    }
}

fn solve(t: i64, xs: Vec<i64>) -> Option<(i64, i64)> {
    for (i, a) in xs.iter().enumerate() {
        for b in xs.iter().skip(i+1) {
            if a + b == t {
                return Some((*a, *b));
            }
        }
    }

    return None;
}
