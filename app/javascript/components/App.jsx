import React from "react";
import Routes from "../routes/Index";
import Header from "./Header";

function App() {
  return (
      <div className="application">
        <Header/>
        {Routes}
      </div>
  );
}

export default App;
  
