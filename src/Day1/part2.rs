use crate::util::util::{parse_ints};

pub fn day1part2(input: &String) -> Option<String> {
    let xs = parse_ints(input);

    return match solve(2020, xs) {
        Some((a, b, c)) => Some(((a * b * c)).to_string()),
        None => None,
    }
}

fn solve(t: i64, xs: Vec<i64>) -> Option<(i64, i64, i64)> {
    for (i, a) in xs.iter().enumerate() {
        for (j, b) in xs.iter().skip(i+1).enumerate() {
            for c in xs.iter().skip(i+j+1) {
                if a + b + c == t {
                    return Some((*a, *b, *c));
                }
            }
        }
    }

    return None;
}
