db = connect("localhost:27017/lms_db");

chars = [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
];
string = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
];
hexa = [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
];
userType = ["Instructor", "Student", "Admin"];

function generateChar(charSet) {
  size = charSet.length;
  a = Math.floor(Math.random() * size);
  return charSet[a];
}

function generateString(size = 10) {
  str = "";
  for (let i = 0; i < size; i++) {
    str = str + generateChar(string);
  }
  return str;
}

function generateEmail() {
  return `${generateString(10)}@${generateString(6)}.com`;
}

function createUser() {
  return {
    _id: ObjectId(),
    firstName: generateString(),
    lastName: generateString(),
    type: generateChar(userType),
    email: generateEmail(),
    password: generateString(),
    birthdate: new Date(),
    courses: [],
  };
}

function createCourse(user) {
  course = {
    _id: ObjectId(),
    code: generateString(4),
    user_id: user._id,
    activities: [],
    students: [],
    questions: [],
  };

  user.courses.push(course._id);

  return course;
}

function createActivity(course) {
  activity = {
    _id: ObjectId(),
    title: generateString(10),
    attachmentPath: generateString(20),
    course_id: course._id,
  };

  course.activities.push(activity._id);

  return activity;
}

function createQuestion(course, authorId) {
  question = {
    _id: ObjectId(),
    description: generateString(50),
    course_id: course._id,
    author_id: authorId,
  };

  course.questions.push(question._id);

  return question;
}

function createAnswer(questionId, authorId) {
  return {
    _id: ObjectId(),
    description: generateString(50),
    question_id: questionId,
    author_id: authorId,
  };
}

users = [];
courses = [];
activities = [];
questions = [];
answers = [];

for (let i = 0; i < 500000; i++) {
  user = createUser();
  users.push(user);
  if (user.type == "Instructor") {
    // Create Courses
    course = createCourse(user);
    courses.push(course);
    activity = createActivity(course);
    activities.push(activity);
    question = createQuestion(course, user._id);
    questions.push(question);
    answer = createAnswer(question._id, user._id);
    answers.push(answer);
  } else if (user.type == "Student") {
    // Enroll in random courses
    course = generateChar(courses);
    if (course) {
      course.students.push(user._id);
      question = createQuestion(course, user._id);
      questions.push(question);
      answer = createAnswer(question._id, user._id);
      answers.push(answer);
    }
  }
}

db.users.insertMany(users);
db.courses.insertMany(courses);
db.activities.insertMany(activities);
db.questions.insertMany(questions);
db.answers.insertMany(answers);
