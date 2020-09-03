import React from "react"
import 'semantic-ui-css/semantic.min.css'
import { Container, Grid, Header, Card } from "semantic-ui-react"

import { VictoryBar, VictoryChart, VictoryAxis, VictoryTheme } from 'victory';


class Dataviz extends React.Component {

    render () {

    const data = [
      {quarter: 1, earnings: this.props.qone_rev},
      {quarter: 2, earnings: this.props.qtwo_rev},
      {quarter: 3, earnings: this.props.qthree_rev},
      {quarter: 4, earnings: this.props.qfour_rev},
    ];
      return (
        <React.Fragment>
          <Container>
            <Header as='h2'>WORLWIDE SALES</Header>
              <VictoryChart
                domainPadding={20}
                theme={VictoryTheme.material}
                animate={{duration: 500}}
              >
              <VictoryAxis
                tickValues={[1, 2, 3, 4, 5]}
                tickFormat={["Q1", "Q2", "Q3", "Q4"]}
              />

              <VictoryAxis
                dependentAxis
                tickFormat={(x) => (`$${x / 10000}k`)}
              />

              <VictoryBar
                  data={data}
                  x="quarter"
                  y="earnings"
                  style={{
                  data: { fill: "tomato", width: 12 }
                }}
                animate={{
                  onExit: {
                    duration: 500,
                    before: () => ({
                      _y: 0,
                      fill: "orange",
                      label: "BYE"
                    })
                  }
                }}
              />
            </VictoryChart>
          </Container>
        </React.Fragment>
      );
  }
}

export default Dataviz
