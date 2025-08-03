import React, { useState } from "react";

const Counter = () => {
  const [count, setCount] = useState(0);

  const sayHello = () => {
    alert("Hello! Member");
  };

  const handleIncrement = () => {
    setCount(count + 1);
    sayHello();
  };

  const handleDecrement = () => {
    setCount(count - 1);
  };

  const sayWelcome = (msg) => {
    alert(msg);
  };

  const handleClick = () => {
    alert("I was clicked");
  };

  return (
    <div>
      <h2>Counter: {count}</h2>
      <button onClick={handleIncrement}>Increment</button>
      <button onClick={handleDecrement}>Decrement</button>
      <br />
      <button onClick={() => sayWelcome("Welcome!")}>Say Welcome</button>
      <br />
      <button onClick={handleClick}>OnPress</button>
    </div>
  );
};

export default Counter;
