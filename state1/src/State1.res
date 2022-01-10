// testing JSX in ReScript, following sample from book

type app_state = {
  count: int,
  msg: string
}

module App = {
  @react.component
  let make = (~message: string) => {
    let (state, setState) = React.useState( _ => { count: 0, msg: "Hello" })
    let updateState = ({ count: c, msg: _m}) => { count: c + 1, msg: j`[ count: $c ]`}
    let _timer = Js.Global.setInterval(_ => setState(updateState), 2000)

    <div>
        <h1 className="bg-primary text-white display-4">{React.string("React")}</h1>
        <div className="container">
          <p className="subtitle">{React.string("Count number")}</p>
          <p className="alert alert-warning">{state.msg->React.string}</p>
          <p className="alert alert-dark">{message->React.string}</p>
        </div>
    </div>
  }
}

let el = (
    <App message="Hello App" />
)

switch (ReactDOM.querySelector("#root")) {
    | Some(root) => ReactDOM.render(el, root)
    | None => Js.log("ReactDOM.querySelector failed to find the root element")
}
