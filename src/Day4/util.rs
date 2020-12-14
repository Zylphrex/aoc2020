pub struct Passport {
    pub byr: String,
    pub iyr: String,
    pub eyr: String,
    pub hgt: String,
    pub hcl: String,
    pub ecl: String,
    pub pid: String,
    pub cid: String,
}

pub fn parse_passports(input: &String) -> Vec<Passport> {
    return input
        .split("\n\n")
        .map(|d| d.to_string())
        .map(|d| parse_passport(&d))
        .collect();
}

fn parse_passport(data: &String) -> Passport {
    let mut passport = Passport{
        byr: "".to_string(),
        iyr: "".to_string(),
        eyr: "".to_string(),
        hgt: "".to_string(),
        hcl: "".to_string(),
        ecl: "".to_string(),
        pid: "".to_string(),
        cid: "".to_string(),
    };

    let passport_data: Vec<String> = data
        .split("\n")
        .map(|d| d.split_whitespace())
        .flatten()
        .map(|d| d.to_string())
        .collect();

    for entry in passport_data.iter() {
        if entry.len() < 5 {
            continue;
        }

        let val = entry[4..].to_string();

        match &entry[..4] {
            "byr:" => passport.byr = val,
            "iyr:" => passport.iyr = val,
            "eyr:" => passport.eyr = val,
            "hgt:" => passport.hgt = val,
            "hcl:" => passport.hcl = val,
            "ecl:" => passport.ecl = val,
            "pid:" => passport.pid = val,
            "cid:" => passport.cid = val,
            _      => continue
        }
    }

    return passport;
}
