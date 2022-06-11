mod logos;

use std::fs;
use std::io::*;
use std::path;

use dsl::{
    *,
    nodes::*,
    nodes::Title,
    attr::*,
    css::*,
    css::Style
};

fn nav() -> Header {
    
    let header = style![
        css::width("100vw"),
        css::height("80px"),
        display("flex"),
        flex_direction("row"),
        align_items("center"),
        margin("0px"),
        background("#ecf0f1")
    ];

    let h1 = style![
        font_size("20px"),
        color("#555186"),
        text_decoration("none"),
        margin_left("30px")
    ];

    let links = style![
        margin_left("auto"),
        margin_right("30px")
    ];

    fn link() -> Style {
        style![
            color("#555186"),
            margin_left("15px"),
            transition("0.3s")
        ]
    }

    header!([](header)[
        h1!([](h1)[
            text!["Aaron Manning"]
        ]),
        div!([](links)[
             a!([href("https://www.linkedin.com/in/aaron-jack-manning")](link())[logos::linkedin()]),
             a!([href("https://github.com/aaron-jack-manning")](link())[logos::github()]),
             a!([href("https://www.youtube.com/channel/UC06BOeVNJ9uu-WLDux6r_BQ")](link())[logos::youtube()])
        ])
    ])
}

fn bio() -> Div {

    let top_level = style![
        background("#d68592"),
        color("#ecf0f1"),
        margin("0px"),
        overflow("hidden")
    ];
    
    let flex_box = style![
        margin("40px auto 50px auto"),
        css::width("80%"),
        display("flex"),
        flex_direction("row"),
        max_width("1000px")
    ];

    div!([](top_level)[
        div!([](flex_box)[
            div!([][][
                h1!([][][
                    text!["Hello there!"]
                ]),
                p!([][][
                   text!["My name is Aaron and I'm a full time university student and part time software developer. I also spend a lot of time on side projects that relate to my studies, work and interests. This site is a place where you can find links to all of the other places I am lurking about on the internet, and the projects I have been working on."]
                ])
            ])
        ])
    ])
}

fn card(title : &str, description : &str, image_src : &str, link : &str) -> Div {

    let card_style = style![
        margin("0px"),
        css::width("0"),
        flex_grow("1"),
        flex_basis("30%")
    ];


    let link_style = style![
        text_decoration("none"),
        transition("0.3s"),
        color("#444444")
    ];

    div!([](card_style)[
        img!([src(image_src), alt("Image Not Found")][css::width("100%")]),
        div!([][padding("2px 16px")][
            h3!([][
                a!([href(link)](link_style)[
                   text![title]
                ])
            ]),
            p!([
               text![description]
            ])
        ])
    ])
}

fn projects() -> Div {

    let flex_box = style![
        max_width("1000px"),
        display("flex"),
        flex_direction("row"),  
        justify_content("flex-start"),
        flex_wrap("wrap"),
        grid_gap("40px"),
        margin("40px auto 0px auto")
    ];

    div!([][padding("30px")][
        div!([](flex_box)[
            card(
                "Probability, Statistics and Mathematical Reasoning",
                "A textbook I am working on teaching introductory statistics.",
                "statistics.png",
                "Probability, Statistics and Mathematical Reasoning.pdf"
            ),
            card(
                "Functional Programming with OCaml",
                "A textbook I am working on teaching functional programming through the language OCaml.",
                "ocaml-book.png",
                "https://ocamlbook.aaronmanning.net"
            ),
            card(
                "Blog",
                "I also write to a blog about mathematics, computing and sometimes whatever else is on my mind.",
                "blog.png",
                "https://blog.aaronmanning.net"
            ),
            card(
                "Mathil",
                "A Rust library for illustrating and animating mathematical concepts.",
                "mathil.png",
                "https://github.com/aaron-jack-manning/mathil"
            ),
            card(
                "Addilo",
                "A machine learning library I created for my HSC Software Design and Development project.",
                "addilo.png",
                "https://addilo.aaronmanning.net"
            ),
            card(
                "Other Programming Projects",
                "All other programming projects I have put online you can find on GitHub.",
                "github.png",
                "https://github.com/aaron-jack-manning"
            )
        ])
    ])
}

fn footer() -> Footer {
    let footer = style![
        background("#ecf0f1"),
        text_align("center"),
        padding("10px 20px"),
        min_height("50px")
    ];

    footer!([](footer)[
        p!([
            text!["If you want to contact me, feel free to send me an "],
            a!([href("mailto:contact@aaronmanning.net")][
                text!["email"]
            ]),
            text!["."]
        ])
    ])
}

fn home_page<A, B, C, D>(nav : A, bio : B, projects : C, footer : D) -> Html
    where A : 'static + Node, B : 'static + Node, C : 'static + Node, D : 'static + Node {

    let body_style = style![
        background("#ffffff"),
        color("#444444"),
        font_family("&quot;Open Sans&quot;, sans-serif"),
        margin("0")
    ];

    html!([
        head!([
            meta!([charset("utf-8")]),
            meta!([name("viewport"), attr::content("width=device-width, initial-scale=1")]),
            title!([text!["Aaron Manning"]])
        ]),
        body!([](body_style)[
            // The 50px here should match the min_height on the footer, which itself should be
            // greater than the forced height of the footer. This is to avoid whitespace at the
            // bottom whilst forcing the footer to the bottom.
            main!([][min_height("calc(100vh - 50px)")][ 
                nav,
                bio,
                projects
            ]),
            footer
        ])
    ])
}

fn main() {
    let root = std::env::args().nth(1).unwrap();
    let root = path::PathBuf::from(root);

    let home_page = home_page(nav(), bio(), projects(), footer()).to_string();

    let mut file = fs::File::create(root.join("index.html")).unwrap();

    file.write(home_page.as_bytes()).unwrap();
}
