import React from "react"


class Summary extends React.Component {

    render () {

    return (
      <React.Fragment>
        <ul>
          <li>{this.props.unique_orders.length} - Orders </li>
          <li>{this.props.customers.length} K - Customers: </li>
          <li>{this.props.total_revenue.toString()} € Global revenue </li>
        </ul>

      </React.Fragment>
    );
  }
}

export default Summary
