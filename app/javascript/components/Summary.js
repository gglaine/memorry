import React from "react"

import Data from '../api/orders.json'


class Summary extends React.Component {


  render () {

    const data = Data.map(order => (
      console.log(order)
    ))

    return (
      <React.Fragment>
        <h3>TODO SUMMARY</h3>
        <ul>
          <li>Total revenue: </li>
          <li>Customers: </li>
          <li>Average revenue per order:</li>
          <li></li>
        </ul>
        <ul>
          {data}
        </ul>
      </React.Fragment>
    );
  }
}

export default Summary
