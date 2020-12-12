use std::io::{self, Read};
use clap::{Arg, App};

mod day1;
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

    let func = match (day, part) {
        ("1", "1") => Some(day1::part1::day1part1),
        _ => None,
    };

    let result = match func {
        Some(f) => f(&buffer),
        None => None,
    };

    std::process::exit(match result {
        Some(x) => {
            print!("{}", x);
            0
        },
        None => 1,
    })
}
