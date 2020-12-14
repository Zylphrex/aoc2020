use crate::day4::util::{Passport, parse_passports};

pub fn day4part1(input: &String) -> Option<String> {
    let passports = parse_passports(&input);
    let valid_passports: Vec<&Passport> = passports
        .iter()
        .filter(|p| is_valid(p))
        .collect();
    return Some(valid_passports.len().to_string());
}

fn is_valid(passport: &Passport) -> bool {
    return passport.byr != "" &&
        passport.iyr != "" &&
        passport.eyr != "" &&
        passport.hgt != "" &&
        passport.hcl != "" &&
        passport.ecl != "" &&
        passport.pid != "";
}
