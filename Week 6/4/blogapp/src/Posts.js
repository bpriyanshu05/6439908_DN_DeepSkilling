import React, { Component } from 'react';
import Post from './Post';

class Posts extends Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [],
      error: null,
    };
  }

  // Fetch posts from API
  loadPosts = () => {
    fetch('https://jsonplaceholder.typicode.com/posts')
      .then((response) => {
        if (!response.ok) {
          throw new Error('Failed to fetch posts');
        }
        return response.json();
      })
      .then((data) => {
        const postList = data.map(
          (item) => new Post(item.userId, item.id, item.title, item.body)
        );
        this.setState({ posts: postList });
      })
      .catch((error) => {
        this.setState({ error: error.message });
      });
  };

  // Lifecycle method to call API on mount
  componentDidMount() {
    this.loadPosts();
  }

  // Catch rendering errors
  componentDidCatch(error, info) {
    alert('An error occurred: ' + error);
  }

  render() {
    const { posts, error } = this.state;

    if (error) {
      return <p style={{ color: 'red' }}>Error: {error}</p>;
    }

    return (
      <div style={{ padding: '20px' }}>
        <h1>Blog Posts</h1>
        {posts.map((post) => (
          <div key={post.id} style={{ marginBottom: '20px' }}>
            <h3>{post.title}</h3>
            <p>{post.body}</p>
            <hr />
          </div>
        ))}
      </div>
    );
  }
}

export default Posts;
