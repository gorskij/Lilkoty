import React from "react";
import { Link } from "react-router-dom";

class LitterProfileContainer extends React.Component {
  constructor() {
    super();
    this.state = {
    };
  }

  render(){
    const { litter } = this.props;
    const profilePicture = litter.images.map((image, index) => (
        (() => {if(image.role == 'profile'){
        return <img src={image.url} width="80%" height="80%"/>
        }
        })()
    ));

    return (  
      <div className="litter-container">
        <h5 className="litter-date_of_creation">{litter.date_of_creation}</h5>
        <h5 className="litter-name">{litter.name}</h5>
        <div className="litter-profile-img">{profilePicture}</div>
        <Link to={`/litter/${litter.id}`} className="btn custom-button">
          View Litter
        </Link>
      </div>
    )
  }
}

export default LitterProfileContainer;
