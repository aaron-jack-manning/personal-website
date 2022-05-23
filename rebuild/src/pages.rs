use stylist::style;
use yew::html;

use crate::components;

#[yew::function_component(Home)]
pub fn home() -> Html {
    let body = style!(
        r#"
            background: #ffffff;
            color: #444444;
            font-family: "Open Sans", sans-serif;
            margin: 0px;
        "#
    ).unwrap();

    let main = style!(
        r#"
            min-height: calc(100vh - 120px);
        "#
    ).unwrap(); // The 120 here needs to be enough space for the footer

    html! {
        <body class={body}>
            <main class={main}>
                <components::Navigation/>
                <components::Bio/>
                <components::Projects/>
            </main>
            <components::Footer/>
        </body>
    }
}

#[yew::function_component(NotFound)]
pub fn not_found() -> Html {
    html! {
        <p>{ "Not Found" }</p>
    }
}
