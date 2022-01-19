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

module App = {
  @react.component
  let make = () => {
    let (colors, setColors) = React.useState(_ => colorData)

    <ColorList colors={colors} />
  }
}

module ColorList = {
  @react.component
  let make = (~colors) => {
    if Js.Array.length(colors) == 0 {
      <div>No colors listed.</div>
    } else {
        <div>
        {
          Js.Array.map(color =>
              <Color title={color.title}
                     color={color.color}
                     rating={color.rating} />)
        }
        </div>
    }
  }
}

module Color = {
  @react.component
  let make = (~title, ~color, ~rating) => {
    <section>
      <h1>{React.string(title)}</h1>
      <div style={{ "height": 50, "backgroundColor": color }}></div>
      // StarRating
    </section>
  }
}
