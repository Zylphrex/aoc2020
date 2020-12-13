use std::io::{self, Read};
use clap::{Arg, App};

mod day1;
mod day2;
mod day3;
mod util;

fn main() -> io::Result<()> {
    let matches = App::new("aoc2020")
        .arg(Arg::with_name("day")
             .long("day")
             .required(true)
             .takes_value(true))
        .arg(Arg::with_name("part")
             .long("part")
             .required(true)
             .takes_value(true))
        .get_matches();

    let day = matches.value_of("day").unwrap();
    let part = matches.value_of("part").unwrap();

    let mut buffer = String::new();
    io::stdin().read_to_string(&mut buffer)?;

    let result = match (day, part) {
        ("1", "1") => day1::part1::day1part1(&buffer),
        ("1", "2") => day1::part2::day1part2(&buffer),
        ("2", "1") => day2::part1::day2part1(&buffer),
        ("2", "2") => day2::part2::day2part2(&buffer),
        ("3", "1") => day3::part1::day3part1(&buffer),
        ("3", "2") => day3::part2::day3part2(&buffer),
        _ => None,
    };

    std::process::exit(match result {
        Some(x) => {
            print!("{}", x);
            0
        },
        None => 1,
    })
}
