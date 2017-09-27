import React from 'react';

class Posts extends React.Component {
  render() {
    return (
      <div>
        {this.props.posts.data.children.map(child => (
          <div>
            {child.data.title}
          </div>
        ))}
      </div>
    );
  }
}

export default Posts;