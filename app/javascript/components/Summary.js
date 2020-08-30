import React from "react"


class Summary extends React.Component {



    render () {

    const orders = this.props.orders;

    return (
      <React.Fragment>
        <ul>
          <li>Total revenue: {orders.length.toString()} </li>
          <li>Customers: </li>
          <li>Average revenue per order:</li>
        </ul>

      </React.Fragment>
    );
  }
}

export default Summary
