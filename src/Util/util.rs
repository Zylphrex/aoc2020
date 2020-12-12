pub fn parse_ints(input: &String) -> Vec<i64> {
    return input
        .lines()
        .map(|x| x.parse().expect("parse error"))
        .collect();
}
