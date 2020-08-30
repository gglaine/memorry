import React from "react"


class Summary extends React.Component {

    render () {

    return (
      <React.Fragment>
        <h3>SUMMARY</h3>
        <ul>
          <li>Global revenue: {this.props.total_revenue.toString()} €</li>
{/*          <li>Items sold: {this.props.orders_count}</li>*/}
          <li>Orders: {this.props.unique_orders}</li>
          <li>Average revenue per order: {this.props.average_revenue.toString()} - €</li>
          <li>Customers: {this.props.customers} in {this.props.number_of_countries} countries  </li>
        </ul>

      </React.Fragment>
    );
  }
}

export default Summary
