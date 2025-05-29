import React from "react";
import { useLocation, Link } from "react-router-dom";
import { API_BASE_URL, UPLOAD_API } from "../Constant";

const ThankYou = () => {
  const { state } = useLocation();
  const order = state?.data;

  return (
    <div className="container my-5 py-4">
      <div className="text-center mb-5">
        <i className="bi bi-check-circle-fill text-success" style={{ fontSize: "4rem" }}></i>
        <h2 className="text-success mt-3">Thank You for Your Order!</h2>
        <p className="lead">{state?.message || "Something went wrong!"}</p>
        <p className="mb-0">Order ID: <strong>{order?.orderTrackId || "N/A"}</strong></p>
        <p>Total Paid: ₹{order?.totalAmount || "N/A"}</p>
        <p>Confirmation sent to: <strong>{order?.billingInfo?.email}</strong></p>
      </div>

      <div className="row">
        {/* Billing Info */}
        <div className="col-md-6 mb-4">
          <div className="card shadow-sm rounded-4">
            <div className="card-header bg-dark text-white rounded-top-4">
              <h5 className="mb-0">Billing Information</h5>
            </div>
            <div className="card-body">
              <p><strong>Name:</strong> {order?.billingInfo?.firstName} {order?.billingInfo?.lastName}</p>
              <p><strong>Address:</strong> {order?.billingInfo?.address}, {order?.billingInfo?.address2}</p>
              <p><strong>State & Country:</strong> {order?.billingInfo?.state}, {order?.billingInfo?.country}</p>
              <p><strong>ZIP Code:</strong> {order?.billingInfo?.zip}</p>
            </div>
          </div>
        </div>

        {/* Order Summary */}
        <div className="col-md-6 mb-4">
          <div className="card shadow-sm rounded-4">
            <div className="card-header bg-primary text-white rounded-top-4">
              <h5 className="mb-0">Order Summary</h5>
            </div>
            <div className="card-body">
              <p><strong>Status:</strong> {order?.orderStatus}</p>
              <p><strong>Date:</strong> {new Date(order?.createdAt).toLocaleString()}</p>
              <p><strong>Total Items:</strong> {order?.cartItems?.length}</p>
              <p><strong>Total Amount:</strong> ₹{order?.totalAmount}</p>
            </div>
          </div>
        </div>
      </div>

      {/* Ordered Items */}
      <div className="card shadow-sm rounded-4 mb-4">
        <div className="card-header bg-info text-white rounded-top-4">
          <h5 className="mb-0">Items in Your Order</h5>
        </div>
        <div className="card-body">
          {order?.cartItems?.map((item, index) => (
            <div key={index} className="d-flex mb-3 border-bottom pb-2">
              <img
                src={`${API_BASE_URL}${UPLOAD_API}/${item.image}`}
                alt={item.title}
                className="img-thumbnail me-3"
                style={{ width: "100px", height: "100px", objectFit: "cover" }}
              />
              <div>
                <h6 className="mb-1">{item.title}</h6>
                <p className="mb-1 text-muted">{item.category}</p>
                <p className="mb-0"><strong>₹{item.price}</strong></p>
              </div>
            </div>
          ))}
        </div>
      </div>

      <div className="text-center">
        <Link to="/" className="btn btn-dark btn-lg rounded-pill px-5">🏠 Back to Home</Link>
      </div>
    </div>
  );
};

export default ThankYou;
