db = connect("localhost:27017/lms_db");

db.dropDatabase();
db = db.getSiblingDB("lms_db");

db.createCollection("users", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      additionalProperties: false,
      properties: {
        _id: {
          bsonType: "objectId"
        },
        firstName: {
          bsonType: "string",
          description: "must be a string",
          maxLength: 100,
        },
        lastName: {
          bsonType: "string",
          enum: ['Instructor', 'Student', 'Admin'],
          description: "must be a string",
          maxLength: 100,
        },
        type: {
          bsonType: "string",
          description: "must be a string",
          maxLength: 100,
        },
        email: {
          bsonType: "string",
          description: "must be a string",
          maxLength: 100,
        },
        password: {
          bsonType: "string",
          description: "must be a string",
          maxLength: 100,
        },
        birthdate: {
          bsonType: "date",
          description: "must be a date",
        },
        courses: {
          bsonType: "array",
          uniqueItems: true,
          items: {
            bsonType: "objectId",
            description: "must be object Id's"
          }
        }
      },
    },
  },
});

// printjson(db.users.insertOne({
//   firstName: "sdkjl",
//   courses: [ObjectId("61d0474bd7e7417d911162fb")]
// }))


db.createCollection("courses", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["code", "user_id"],
      additionalProperties: false,
      properties: {
        _id: {
          bsonType: "objectId"
        },
        code: {
          bsonType: "string",
          unique: true,
          description: "Each course must have a code",
        },
        user_id: {
          bsonType: "objectId"
        },
        activities: {
          bsonType: "array",
          uniqueItems: true,
          items: {
            bsonType: "objectId",
            description: "must be object Id's"
          }
        },
        students: {
          bsonType: "array",
          uniqueItems: true,
          items: {
            bsonType: "objectId",
            description: "must be object Id's"
          }
        },
        questions: {
          bsonType: "array",
          uniqueItems: true,
          items: {
            bsonType: "objectId",
            description: "must be object Id's"
          }
        }
      },
    },
  },
});


db.createCollection("activities", {
  validator: {
    $jsonSchema: {
      bsonType:"object",
      additionalProperties: false,
      required: ['course_id'],
      properties: {
        _id: {
          bsonType: "objectId"
        },
        title: {
          bsonType: "string",
          description: "must be a string",
          maxLength: 100
        },
        attachmentPath: {
          bsonType: "string",
          description: "must be a string",
          maxLength: 100
        },
        course_id: {
          bsonType: "objectId"
        }
      }
    }
  }
})

db.createCollection("questions", {
  validator: {
    $jsonSchema: {
      bsonType:"object",
      additionalProperties: false,
      required: ['course_id', 'author_id'],
      properties: {
        _id: {
          bsonType: "objectId"
        },
        description: {
          bsonType: "string",
          description: "Description of the question must be a string",
          maxLength: 65535
        },
        course_id: {
          bsonType: "objectId"
        },
        author_id: {
          bsonType: "objectId"
        }
      }
    }
  }
})

db.createCollection("answers", {
  validator: {
    $jsonSchema: {
      bsonType:"object",
      additionalProperties: false,
      required: ['question_id', 'author_id'],
      properties: {
        _id: {
          bsonType: "objectId"
        },
        description: {
          bsonType: "string",
          description: "Description of the answer must be a string",
          maxLength: 65535
        },
        question_id: {
          bsonType: "objectId"
        },
        author_id: {
          bsonType: "objectId"
        }
      }
    }
  }
})
