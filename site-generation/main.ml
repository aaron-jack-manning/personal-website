open General
open Attributes open Css open Nodes open CssConversions open View

type link = {
        text : string;
        url : string;
    }

let project (name : string) (description_text : string) (links : link list) =
    List.([
        h4 [] [
            text name
        ];
        p [] [
            text description_text;
        ];
    ] @
    (links
    |> List.map (fun l -> 
        h5 [] [
            a [href l.url] [text l.text]
        ]
    )))

let css = [
        create_style_group ["body"] [
            background "#fff";
            color "#444";
            font_family "\"Open Sans\", sans-serif";
        ];
        create_style_group ["a"] [
            color "#1bb1dc";
            text_decoration "none";
            transition "0.5s";
        ];
        create_style_group ["a:hover,"; "a:active,"; "a:focus"] [
            color "#0a98c0";
            outline "none";
            text_decoration "none";
        ];
        create_style_group ["p"] [
            padding "0";
            margin "0 0 10px 0";
        ];
        create_style_group ["h1,"; "h2,"; "h3,"; "h4,"; "h5,"; "h6"] [
            font_family "\"Montserrat\", sans-serif";
            font_weight "400";
            margin "0 0 20px 0";
            padding "0";
        ];
        create_style_group ["section"] [
            overflow "hidden";
        ];
        create_style_group [".section-bg-grey"] [
            background "#f5f8fd"
        ];
        create_style_group [".header"] [
            background "#fff";
            transition  "all 0.5s";
            z_index "997";
            height "90px";
        ];
        create_style_group [".header"; ".header-scrolled"] [
            background "#fff";
            height "70px";
            box_shadow "0px 0px 30px rgba(127, 137, 161, 0.3)";
        ];
        create_style_group [".header"; ".logo"] [
            font_size "20px";
            margin "0";
            padding "0";
            font_weight "400";
            letter_spacing "3px";
        ];
        create_style_group [".header"; ".logo"; "a"] [
            color "#413e66";
        ];
        create_style_group [".header"; ".logo"; "img"] [
            max_height "20px";
        ];
        create_style_group [".header"; ".social-links"] [
            margin "0 0 0 20px";
            display "inline-flex";
            align_items "center";
            justify_content "center";
        ];
        create_style_group [".header"; ".social-links"; "a"] [
            color "#555186";
            transition "0.3s";
            line_height "0";
            margin_left "15px";
        ];
        create_style_group [".header"; ".social-links"; "a"; "i"] [
            line_height "0";
        ];
        create_style_group [".header"; ".social-links"; "a:hover"] [
            color "#1bb1dc";
        ];
        create_style_group [".header-gap"] [
            height "6rem";
            background_color "rgba(255, 255, 255, 0.1)";
            border_width "1px 0";
        ];
        create_style_group [".project-links"] [
            padding "60px 0";
        ];
        create_style_group [".project-links"; "h4"] [
            font_weight "600";
            font_size "24px";
        ];
        create_style_group [".site-description"] [
            background "#d68592";
            background_size "cover";
            padding "40px 0";
        ];
        create_style_group [".feature-title"] [
            color "#fff";
            font_size "28px";
            font_weight "700";
        ];
        create_style_group [".feature-paragraph"] [
            color "#fff";
        ];
        create_style_group [".site-description-button"] [
            font_family "\"Montserrat\", sans-serif";
            font_weight "700";
            font_size "16px";
            letter_spacing "1px";
            display "inline-block";
            padding "8px 26px";
            border_radius "3px";
            transition "0.5s";
            margin "10px";
            border "3px solid #fff";
            color "#fff";
        ];
        create_style_group [".site-description-button:hover"] [
            background "#ffffff";
            border "3px solid #ffffff";
            color "rgb(124, 124, 124)";
        ];
        create_style_group [".footer"] [
            padding "0 0 30px 0";
            font_size "14px";
            background "#f5f8fd";
        ];
        create_style_group [".footer"; ".footer-content"] [
            text_align "center";
            padding_top "30px";
            color "#535074";
            font_size "15px";
        ]
    ]
    |> List.map (fun x -> String.(css_class_text x + "\n"))
    |> String.concat

let home_page =
    html [lang "en"] [
        head [] [
            title [] [
                text "Aaron Manning"
            ];
            
            link [href "google-fonts/montserrat.css"; rel "stylesheet"];
            link [href "bootstrap/bootstrap.min.css"; rel "stylesheet"];
            link [href "bootstrap/bootstrap-icons.css"; rel "stylesheet"];
            link [href "stylesheet.css"; rel "stylesheet"];

            script [src "iconify/iconify.min.js"] []
        ];
        body [] [
            header [class_ "header fixed-top d-flex align-items-center header-transparent"] [
                div [class_ "container d-flex align-items-center"] [
                    h1 [class_ "logo me-auto"] [
                        a [href "index.html"] [
                            text "Aaron Manning"
                        ]
                    ];
                    (* Top right links *)
                    div [class_ "social-links"] [
                        a [href "https://www.linkedin.com/in/aaron-jack-manning"] [
                            i [class_ "bi bi-linkedin"] []
                        ];
                        a [href "https://github.com/aaron-jack-manning"] [
                            i [class_ "bi bi-github"] []
                        ];
                        a [href "https://www.youtube.com/channel/UC06BOeVNJ9uu-WLDux6r_BQ"] [
                            i [class_ "bi bi-youtube"] []
                        ];
                        a [href "https://letterboxd.com/aaronmanning/"] [
                            i [class_ "iconify"; custom_attribute "data-icon" "simple-icons:letterboxd"] []
                        ]
                    ]
                ]
            ];
            
            div [class_ "header-gap"] [];

            main [id "main"] [
                section [class_ "site-description"] [
                    div [class_ "container"] [
                        div [class_ "row"] [
                            div [class_ "col-lg-12 text-center text-lg-start"] [
                                h3 [class_ "feature-title"] [
                                    text "Hello there!"
                                ];
                                p [class_ "feature-paragraph"] [
                                    text "My name is Aaron and I'm a full time university student and part time software developer. I also spend a lot of time on side projects that relate to my studies, work and interests. This site is a place where you can find links to all of the other places I am lurking about on the internet, and the projects I have been working on."
                                ]
                            ]
                        ]
                    ]
                ];
                section [class_ "project-links"] [
                    div [class_ "container"] [
                        div [class_ "row"] [
                            div [class_ "col-lg-offset-2 col-lg-8 col-md-12"] 
                                ([
                                    project "Programming Projects" "Any programming projects I have created to make my life easier that are general enough that someone else might find them useful can be found on my GitHub page." [
                                        { text = "GitHub"; url = "https://github.com/aaron-jack-manning?repositories"}
                                    ];
                                    project "Mathil" "Mathil is a Rust library that I write for creating programmatic illustrations and animations." [
                                        { text = "Mathil"; url = "https://github.com/aaron-jack-manning/mathil" }
                                    ];
                                    project "Blog" "On occasion (hopefully more regularly soon) I write on a blog that I run which you can find here. It's mostly about Mathematics and Computing but I tend to try and avoid putting it in a box, so in future it could be about anything." [
                                        { text = "Stars and Bars"; url = "https://stars-and-bars.net" }
                                    ];
                                    project "Textbooks" "I'm currently working on two textbooks, one of which you can find here in an incomplete form (feedback welcomed) and another which I plan on uploading in a mostly complete form very soon." [
                                        { text = "Probability, Statistics and Mathematical Reasoning"; url = "linked-files/Probability, Statistics and Mathematical Reasoning.pdf" };
                                        (* { text = "Functional Programming with OCaml"; url = "" } *)
                                    ];
                                    project "HSC Projects" "These are the projects I did for my HSC." [
                                        { text = "Addilo - Machine Learning Library"; url = "https://addilo.net" };
                                        { text = "Determining the Classification Accuracy for Image Recognition of Feedforward Neural Networks with Different Activation Functions"; url = "linked-files/Machine Learning Research Paper.pdf" }
                                    ]
                                ] |> List.foldl (fun s m -> List.(s @ m)) [])
                        ]
                    ]
                ]
            ];

            footer [class_ "footer"] [
                div [class_ "container footer-content"] [
                    text "If you want to contact me feel free to send me an ";
                    a [href "mailto:contact@aaronmanning.net"] [
                        text "email"
                    ];
                    text "."
                ]
            ]
        ]
    ]

let _ = File.write_all_text "website/index.html" (view home_page)
let _ = File.write_all_text "website/stylesheet.css" css