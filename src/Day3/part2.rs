use crate::day3::util::{count_trues};

pub fn day3part2(input: &String) -> Option<String> {
    let slope = input.lines().map(|x| x.to_string()).collect();
    let directions: [(usize, usize); 5] = [
        (1, 1),
        (3, 1),
        (5, 1),
        (7, 1),
        (1, 2),
    ];
    let mut prod = 1;
    for (dx, dy) in directions.iter() {
        prod *= count_trues(&slope, *dx, *dy);
    }
    return Some(prod.to_string());
}
