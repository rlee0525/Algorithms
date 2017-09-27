import React from 'react';
import $ from 'jquery';
import Posts from './posts.jsx';
import Comments from './comments.jsx';

class SearchBar extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: "",
      posts: null,
      comments: null
    };

    this.updateState = this.updateState.bind(this);
    this.enterUser = this.enterUser.bind(this);
    this.searchUser = this.searchUser.bind(this);
  }

  updateState(e) {
    let username = e.currentTarget.value;
    this.setState({ username });
  }

  enterUser(e) {
    if (e.keyCode === 13) {
      this.searchUser();
    }
  }

  searchUser() {
    let { username } = this.state;

    $.ajax({
      method: 'GET',
      url: `https://www.reddit.com/user/${username}/submitted.json`
    }).then(res => this.setState({ posts: res }));

    $.ajax({
      method: 'GET',
      url: `https://www.reddit.com/user/${username}/comments.json`
    }).then(res => this.setState({ comments: res })); 
  }

  render() {
    if (!this.state.posts) {
      return (
        <div className="search-bar-container">
          <input
            placeholder="Search username"
            onChange={e => this.updateState(e)}
            onKeyDown={e => this.enterUser(e)}
          />
          <input
            type="submit"
            value="Search"
            onClick={this.searchUser}
          />
        </div>
      );
    } else {
      return (
        <div className="search-bar-container">
          <Posts posts={this.state.posts} />
          <Comments comments={this.state.comments} />
        </div>
      );
    }
  }
}

export default SearchBar;