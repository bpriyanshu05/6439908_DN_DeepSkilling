import React from "react";
import Counter from "./Components/Counter";
import CurrenConv from "./Components/CurrenConv";

const App = () => {
  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <h1>Event Examples App</h1>
      <Counter />
      <hr />
      <CurrenConv />
    </div>
  );
};

export default App;
