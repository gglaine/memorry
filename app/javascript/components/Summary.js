import React from "react"
import { Grid, Header } from 'semantic-ui-react'

class Summary extends React.Component {

    render () {
      return (
        <React.Fragment>
          <Grid stackable >
            <Grid.Column width={4}>
              <Header as="h3">Global revenue: {this.props.total_revenue} €
              </Header >
            </Grid.Column>
            <Grid.Column width={4}>
              <Header as="h3">Orders: {this.props.unique_orders}
              </Header >
            </Grid.Column>
            <Grid.Column width={4}>
              <Header as="h3">Average revenue per order: {this.props.average_revenue.toString()} €
              </Header >
            </Grid.Column>
            <Grid.Column width={4}>
              <Header as="h3">Customers: {this.props.customers} in {this.props.number_of_countries} countries
              </Header >
            </Grid.Column>
          </Grid>
        </React.Fragment>
      );
  }
}

export default Summary
