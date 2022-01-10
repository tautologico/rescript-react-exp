// testing JSX in ReScript, following sample from book

module Rect = {
  @react.component
  let make = (~x:int, ~y:int, ~w:int, ~h:int, ~c:string) => {
    let style = ReactDOM.Style.make(
      ~backgroundColor = c,
      ~position = "absolute",
      ~left = string_of_int(x) ++ "px",
      ~top = string_of_int(y) ++ "px",
      ~width = string_of_int(w) ++ "px",
      ~height = string_of_int(h) ++ "px",
      ()
    )
    <div style={style}></div>
  }
}

let message = "React component page."

let el = (
    <div>
      <h5 className="mb-4">{message->React.string}</h5>
      <div>
        <Rect x=200 y=200 w=200 h=200 c="cyan" />
        <Rect x=300 y=300 w=200 h=200 c="magenta" />
      </div>
    </div>
)

switch (ReactDOM.querySelector("#root")) {
    | Some(root) => ReactDOM.render(el, root)
    | None => Js.log("ReactDOM.querySelector failed to find the root element")
}
