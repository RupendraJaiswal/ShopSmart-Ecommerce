import React, { useState } from "react";
import { Footer, Navbar } from "../components";
import { useSelector } from "react-redux";
import { Link, useNavigate } from "react-router-dom";
import { ORDER_API, API_BASE_URL } from "../Constant";
import { emptyCart } from "../redux/action";
import { useDispatch } from "react-redux";

const Checkout = () => {
  const state = useSelector((state) => state.handleCart);
  const navigate = useNavigate();
  const dispatch = useDispatch();

  const [formData, setFormData] = useState({
    firstName: "",
    lastName: "",
    email: "",
    address: "",
    address2: "",
    country: "India",
    state: "",
    zip: "",
    ccName: "",
    ccNumber: "",
    ccExpiration: "",
    ccCvv: "",
  });

  const handleSubmit = async (e) => {
    e.preventDefault();

    const payload = {
      billingInfo: formData,
      cartItems: state,
      totalAmount: Math.round(
        state.reduce((acc, item) => acc + item.price * item.qty, 0) + 30
      ),
    };
    try {
      const res = await fetch(API_BASE_URL + ORDER_API, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(payload),
      });

      const result = await res.json();

      if (res.ok) {
        dispatch(emptyCart());

        navigate("/thank-you", { state: result });
      } else {
        alert("Order failed: " + result.message);
      }
    } catch (err) {
      console.error("Checkout error:", err);
      alert("Something went wrong.");
    }
  };

  const EmptyCart = () => (
    <div className="container">
      <div className="row">
        <div className="col-md-12 py-5 bg-light text-center">
          <h4 className="p-3 display-5">No item in Cart</h4>
          <Link to="/" className="btn btn-outline-dark mx-4">
            <i className="fa fa-arrow-left"></i> Continue Shopping
          </Link>
        </div>
      </div>
    </div>
  );

  const ShowCheckout = () => {
    const subtotal = state.reduce((acc, item) => acc + item.price * item.qty, 0);
    const shipping = 30;
    const totalItems = state.reduce((acc, item) => acc + item.qty, 0);

    return (
      <div className="container py-5">
        <div className="row my-4">
          {/* Order Summary */}
          <div className="col-md-5 col-lg-4 order-md-last">
            <div className="card mb-4">
              <div className="card-header py-3 bg-light">
                <h5 className="mb-0">Order Summary</h5>
              </div>
              <div className="card-body">
                <ul className="list-group list-group-flush">
                  <li className="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                    Products ({totalItems}) <span>${Math.round(subtotal)}</span>
                  </li>
                  <li className="list-group-item d-flex justify-content-between align-items-center px-0">
                    Shipping <span>${shipping}</span>
                  </li>
                  <li className="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                    <strong>Total amount</strong>
                    <span><strong>${Math.round(subtotal + shipping)}</strong></span>
                  </li>
                </ul>
              </div>
            </div>
          </div>

          {/* Billing Form */}
          <div className="col-md-7 col-lg-8">
            <div className="card mb-4">
              <div className="card-header py-3">
                <h4 className="mb-0">Billing address</h4>
              </div>
              <div className="card-body">
                <form className="needs-validation" noValidate onSubmit={handleSubmit}>
                  <div className="row g-3">
                    {/* First and Last Name */}
                    <div className="col-sm-6">
                      <label htmlFor="firstName" className="form-label">First name</label>
                      <input type="text" className="form-control" id="firstName" value={formData.firstName}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required />
                    </div>
                    <div className="col-sm-6">
                      <label htmlFor="lastName" className="form-label">Last name</label>
                      <input type="text" className="form-control" id="lastName" value={formData.lastName}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required />
                    </div>

                    {/* Email */}
                    <div className="col-12">
                      <label htmlFor="email" className="form-label">Email</label>
                      <input type="email" className="form-control" id="email" value={formData.email}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required />
                    </div>

                    {/* Address */}
                    <div className="col-12">
                      <label htmlFor="address" className="form-label">Address</label>
                      <input type="text" className="form-control" id="address" value={formData.address}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required />
                    </div>

                    <div className="col-12">
                      <label htmlFor="address2" className="form-label">Address 2 <span className="text-muted">(Optional)</span></label>
                      <input type="text" className="form-control" id="address2" value={formData.address2}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} />
                    </div>

                    {/* Country, State, Zip */}
                    <div className="col-md-5">
                      <label htmlFor="country" className="form-label">Country</label>
                      <select id="country" className="form-select" value={formData.country}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required>
                        <option value="">Choose...</option>
                        <option>India</option>
                      </select>
                    </div>

                    <div className="col-md-4">
                      <label htmlFor="state" className="form-label">State</label>
                      <select id="state" className="form-select" value={formData.state}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required>
                        <option value="">-- Select State --</option>
                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>
                        <option value="Odisha">Odisha</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Telangana">Telangana</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Uttarakhand">Uttarakhand</option>
                        <option value="West Bengal">West Bengal</option>
                      </select>
                    </div>

                    <div className="col-md-3">
                      <label htmlFor="zip" className="form-label">Zip</label>
                      <input type="text" className="form-control" id="zip" value={formData.zip}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required />
                    </div>
                  </div>

                  <hr className="my-4" />

                  {/* Payment Details */}
                  <h4 className="mb-3">Payment</h4>
                  <div className="row gy-3">
                    <div className="col-md-6">
                      <label htmlFor="ccName" className="form-label">Name on card</label>
                      <input type="text" className="form-control" id="ccName" value={formData.ccName}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required />
                    </div>

                    <div className="col-md-6">
                      <label htmlFor="ccNumber" className="form-label">Credit card number</label>
                      <input type="text" className="form-control" id="ccNumber" value={formData.ccNumber}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required />
                    </div>

                    <div className="col-md-3">
                      <label htmlFor="ccExpiration" className="form-label">Expiration</label>
                      <input type="text" className="form-control" id="ccExpiration" value={formData.ccExpiration}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required />
                    </div>

                    <div className="col-md-3">
                      <label htmlFor="ccCvv" className="form-label">CVV</label>
                      <input type="text" className="form-control" id="ccCvv" value={formData.ccCvv}
                        onChange={(e) => setFormData({ ...formData, [e.target.id]: e.target.value })} required />
                    </div>
                  </div>

                  <hr className="my-4" />

                  <button className="w-100 btn btn-primary" type="submit">
                    Continue to checkout
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  };

  return (
    <>
      <Navbar />
      <div className="container my-3 py-3">
        <h1 className="text-center">Checkout</h1>
        <hr />
        {state.length ? <ShowCheckout /> : <EmptyCart />}
      </div>
      <Footer />
    </>
  );
};

export default Checkout;
