import React from 'react';

class Comments extends React.Component {
  render() {
    return (
      <div>
        {this.props.comments.data.children.map(child => (
          <div>
            {child.data.body}
          </div>
        ))}
      </div>
    );
  }
}

export default Comments;