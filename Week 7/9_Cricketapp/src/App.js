import ListOfPlayers from "./Components/ListOfPlayers";
import IndianPlayers from "./Components/IndianPlayers";

const App = () => {
  var flag = true;

  return <div>{flag ? <ListOfPlayers /> : <IndianPlayers />}</div>;
};

export default App;