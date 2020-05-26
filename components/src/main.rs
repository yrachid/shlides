use std::io;

fn main() {
    let inp = read_input();

    println!("{}", inp)
}

fn read_input() -> String {
    let mut output = String::new();
    loop {
        let mut input = String::new();
        io::stdin()
            .read_line(&mut input)
            .expect("Failed to read from stdin");

        if input.trim().to_string() == "" {
            break;
        } else {
            output = output + &input;
        }
    };

    return output;
}
