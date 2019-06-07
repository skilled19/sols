use std::io::{self, BufRead};

fn trial_division(mut n: i64) -> Vec<i64> {
    let mut a = Vec::new();
    while n % 2 == 0 {
        a.push(2);
        n /= 2;
    }
    let mut f = 3;
    while n > 1 {
        if n % f == 0 {
            a.push(f);
            n /= f;
        } else {
            f += 2;
        }
    }
    a.sort();
    a
}

fn main() {
    let mut buffer = String::new();
    let input = io::stdin();
    input.read_line(&mut buffer).expect("Failed to read line");
    let number_of_tests = buffer.trim().parse().unwrap();

    for line in input.lock().lines().take(number_of_tests) {
        let l = line.unwrap();
        let num: i64 = l.parse().unwrap();
        print!(
            "{} ",
            trial_division(num)
                .iter()
                .map(|n| n.to_string())
                .collect::<Vec<_>>()
                .join("*")
        );
    }

    println!()
}
