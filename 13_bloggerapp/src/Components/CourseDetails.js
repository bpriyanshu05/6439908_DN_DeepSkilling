import React from "react";

function CourseItem({ course }) {
  return (
    <div className="item-container">
      <h4>{course.name}</h4>
      <p>{course.date}</p>
    </div>
  );
}

function CourseDetails({ courses }) {
  return (
    <div>
      <h2>Course Details</h2>
      {courses.map((course) => (
        <CourseItem key={course.id} course={course} />
      ))}
    </div>
  );
}

export default CourseDetails;