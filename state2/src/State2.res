// testing JSX in ReScript, following sample from book

module App = {
  @react.component
  let make = () => {
    let (count, setCount) = React.useState( _ => 0)
    let onClick = evt => {
      ReactEvent.Mouse.preventDefault(evt)
      setCount(c => c + 1)
    }

    <div>
        <h1 className="bg-primary text-white display-4">{React.string("React")}</h1>
        <div className="container">
          <h4 className="my-3">{React.string("Hooks sample")}</h4>
          <div className="alert alert-primary text-center">
            <p className="h5 mb-3">{React.string(j`click: $count times!`)}</p>
            <div><button onClick className="btn btn-primary">{React.string("Click me")}</button></div>
          </div>
        </div>
    </div>
  }
}

let el = (
    <App />
)

switch (ReactDOM.querySelector("#root")) {
    | Some(root) => ReactDOM.render(el, root)
    | None => Js.log("ReactDOM.querySelector failed to find the root element")
}
