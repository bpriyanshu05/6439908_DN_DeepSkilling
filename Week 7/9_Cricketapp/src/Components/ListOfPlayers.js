import { players } from "./Players";

const ListOfPlayers = () => {
  let playerSort = players.filter((player) => player.score <= 70);

  return (
    <div>
      <h1>List of Players</h1>
      {players.map((player, index) => (
        <div key={`${index}-${player.name}`}>
          <li>
            {player.name}    :   {player.score}
          </li>
        </div>
      ))}

      <hr />

      <h1>List of Players having Score Less than or Equal 70</h1>
      {playerSort.map((player, index) => (
        <div key={`${index}-${player.name}`}>
          <li>
            {player.name}   :  {player.score}
          </li>
        </div>
      ))}
    </div>
  );
};

export default ListOfPlayers;