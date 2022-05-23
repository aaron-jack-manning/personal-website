use yew::html;
use yew_router::prelude::{Routable, Switch, BrowserRouter};

use crate::pages;

#[derive(Clone, Routable, PartialEq)]
enum Route {
    #[at("/")]
    Home,
}

fn switch(routes : &Route) -> yew::Html {
    match routes {
        Route::Home => html! { <pages::Home/> },
    }
}

#[yew::function_component(App)]
pub fn app() -> Html {
    html! {
        <BrowserRouter>
            <Switch<Route> render={ Switch::render(switch) } />
        </BrowserRouter>
    }
}
