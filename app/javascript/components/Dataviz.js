import React from "react"

import { VictoryBar } from 'victory';


class Dataviz extends React.Component {

    render () {
    // const data = this.props.orders;
      return (
        <React.Fragment>
          <h3>Data Graphic</h3>
          <VictoryBar
            categories={{
                x: ["birds", "cats", "dogs", "fish", "frogs"]
            }}
            data={[
              {x: "cats", y: 1},
              {x: "dogs", y: 2},
              {x: "birds", y: 3},
              {x: "fish", y: 2},
              {x: "frogs", y: 1}
            ]}
          />
        </React.Fragment>
      );
  }
}

export default Dataviz
