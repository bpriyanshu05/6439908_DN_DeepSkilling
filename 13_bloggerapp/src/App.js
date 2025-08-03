import React from "react";
import "./App.css";
import Course from "./Components/CourseDetails";
import Book from "./Components/BookDetails";
import Blog from "./Components/BlogDetails";

function App() {
  const courses = [
    { id: 1, name: "Angular", date: "4/5/2021" },
    { id: 2, name: "React", date: "6/3/20201" },
  ];

  const books = [
    { id: 1, title: "Master React", pages: 670 },
    { id: 2, title: "Deep Dive into Angular 11", pages: 800 },
    { id: 3, title: "Mongo Essentials", pages: 450 },
  ];

  const posts = [
    {
      id: 1,
      title: "React Learning",
      author: "Stephen Biz",
      content: "Welcome to learning React!",
    },
    {
      id: 2,
      title: "Installation",
      author: "Schewzdenier",
      content: "You can install React from npm.",
    },
  ];

  return (
    <div className="details-wrapper">
      <div>
        <Course courses={courses} />
      </div>

      <div className="vr" />

      <div>
        <Book books={books} />
      </div>

      <div className="vr" />

      <div>
        <Blog posts={posts} />
      </div>
    </div>
);

}

export default App;