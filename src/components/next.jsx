import React from "react";
import { Link } from "gatsby"
export default ({next}) => (
  <div style={{display:"flex", justifyContent:"space-between",flexDirection:"row"}}>
    <div></div>
    <Link to={next}>Next</Link>
  </div>
);
