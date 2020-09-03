import React from "react"
import { Container, Grid, Header, Card } from "semantic-ui-react"
import 'semantic-ui-css/semantic.min.css'

class Summary extends React.Component {

    render () {
      return (
        <React.Fragment>
          <Container>
            <Header as='h2'>SUMMARY</Header>
            <Grid stackable >
              <Grid.Column width={4}>
                <Card fluid color='green'>
                  <Card.Header as="h2"> <div className="huge"> {this.props.total_revenue}€ </div><div>Global Revenue</div></Card.Header >
                </Card>

              </Grid.Column>
              <Grid.Column width={4}>
                <Card fluid color='teal'>
                  <Card.Header as="h2"> <div className="huge">{this.props.unique_orders}</div><div>Orders</div>
                  </Card.Header >
                </Card>
              </Grid.Column>
              <Grid.Column width={4}>
                <Card fluid color='violet'>
                  <Card.Header as="h2"><div className="huge">{this.props.average_revenue.toString()}€</div><div>Average Revenue</div>
                  </Card.Header >
                </Card>
              </Grid.Column>
              <Grid.Column width={4}>
                <Card fluid color='yellow'>
                  <Card.Header as="h2"><div className="huge">{this.props.customers}</div><div> Customers in {this.props.number_of_countries} countries </div>
                  </Card.Header >
                </Card>
              </Grid.Column>
            </Grid>
          </Container>
        </React.Fragment>
      );
  }
}

export default Summary
