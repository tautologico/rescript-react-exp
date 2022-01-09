// testing JSX in ReScript, following sample from book

module Welcome = {
  @react.component
  let make = () => {
      <div className="alert alert-primary">
        <p className="h4">{React.string("Hello React!")}</p>
      </div>
  }
}

let message = "React component page."

let el = (
    <div>
      <h5 className="mb-4">{message->React.string}</h5>
      <Welcome />
    </div>
)

switch (ReactDOM.querySelector("#root")) {
    | Some(root) => ReactDOM.render(el, root)
    | None => Js.log("ReactDOM.querySelector failed to find the root element")
}
