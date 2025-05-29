import React from "react";

const Footer = () => {
  return (
    <>
   <footer className="text-center py-3 bg-light border-top mt-auto">
  <div className="container">
    <p className="mb-0">
      &copy; {new Date().getFullYear()} Rupendra Jaiswal. All rights reserved.
    </p>
  </div>
</footer>

    </>
  );
};

export default Footer;
