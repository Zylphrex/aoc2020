use crate::day3::util::{count_trues};

pub fn day3part1(input: &String) -> Option<String> {
    let slope = input.lines().map(|x| x.to_string()).collect();
    let count = count_trues(&slope, 3, 1);
    return Some(count.to_string());
}
