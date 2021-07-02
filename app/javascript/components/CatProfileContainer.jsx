import React from 'react'
class CatProfileContainer extends React.Component {

  constructor() {
    super();
    this.state = {
    };
  }

  render(){
    const { cat } = this.props;

    const profilePicture = cat.images.map((image, index) => (
        (() => {if(image.role == 'profile'){
        return <img src={image.url} width="10%" height="10%"/>
        }
        })()
    ));

    return (  
      <div className="cat-profile-container">
        <h1>{cat.name}</h1>
        <div className="cat-profile-img">{profilePicture}</div>
        <div className="cat-profile-status">{cat.status}</div>
        
      </div>
    )
  }
}

export default CatProfileContainer
