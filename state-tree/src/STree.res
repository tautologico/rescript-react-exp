// Rescript version of example from
// Learning React, 2nd edition

// a type for the color data
type color = {
  id: string,
  title: string,
  color: string,
  rating: int
}

let colorData = [
  {
    id: "0175d1f0-a8c6-41bf-8d02-df5734d829a4",
    title: "ocean at dusk",
    color: "#00c4e2",
    rating: 5
  },
  {
    id: "83c7ba2f-7392-4d7d-9e23-35adbe186046",
    title: "lawn",
    color: "#26ac56",
    rating: 3
  },
  {
    id: "a11e3995-b0bd-4d58-8c48-5e49ae7f7f23",
    title: "bright red",
    color: "#ff0000",
    rating: 0
  }
]

// The component FaStar from react-icons/fa
module FaStar = {
  @obj
  external makeProps: (~color: string, ~key: 'key=?,
                       ~onClick: ReactEvent.Mouse.t => unit, unit) => {"color": React.element} = ""
  @module("react-icons/fa")
  external make: React.component<{ "color": React.element }> = "FaStar"
}


let initArrayWithElement = (n, el) => {
  let result = []
  for _i in 1 to n {
    Js.Array.push(el, result) |> ignore
  }
  result
}

module Star = {
  @react.component
  let make = (~selected, ~onSelect) => {
      <FaStar color={if selected { "red" } else { "grey" }}
              onClick={onSelect} />
  }
}

let initStars = (total, sel) => {
  let result = []
  for i in 1 to total {
    result
      |> Js.Array.push(<Star selected={i <= sel} onSelect={x => ()} />)
      |> ignore
  }
  result
}

module StarRating = {
  @react.component
  let make = (~selectedStars, ~totalStars=5) => {
      <>
      {initStars(totalStars, selectedStars) |> React.array}
      </>
  }
}

module Color = {
  @react.component
  let make = (~title, ~color, ~rating) => {
    <section>
      <h1>{React.string(title)}</h1>
      <div style={ReactDOM.Style.make(~height="50px", ~backgroundColor=color, ())}></div>
      <StarRating selectedStars={rating} />
    </section>
  }
}

module ColorList = {
  @react.component
  let make = (~colors) => {
    if Js.Array.length(colors) == 0 {
      <div>{React.string("No colors listed.")}</div>
    } else {
        <div>
        {
          colors
          -> Js.Array2.map(color =>
                <Color title={color.title}
                       color={color.color}
                       rating={color.rating} />)
          -> React.array
        }
      </div>
    }
  }
}

module App = {
  @react.component
  let make = () => {
    let (colors, setColors) = React.useState(_ => colorData)

    <ColorList colors={colors} />
  }
}


let el = (
    <App />
)

switch (ReactDOM.querySelector("#root")) {
    | Some(root) => ReactDOM.render(el, root)
    | None => Js.log("ReactDOM.querySelector failed to find the root element")
}
