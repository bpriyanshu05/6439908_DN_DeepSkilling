const App = () => {
  const element = "Office Space, at Affordable Range";
  const img = (
    <img
      src="https://cdn.sanity.io/images/uqxwe2qj/production/20577ef16f6c2443c2b43c7e36beef98db3e3661-1086x612.png?q=80&auto=format&fit=clip&dpr=2&w=1086"
      height="25%"
      width="25%"
    />
  );

  const ofcObj = {
    name: "DMART",
    rent: 900000,
    address: "Hyderabad",
  };

  return (
    <div>
      <h1>{element}</h1>
      {img}
      <h1>Name: {ofcObj.name}</h1>
      <h3 style={{ color: ofcObj.rent < 60000 ? "red" : "green" }}>
        Rent: Rs {ofcObj.rent}
      </h3>
      <h3>Address: {ofcObj.address}</h3>
    </div>
  );
};

export default App;