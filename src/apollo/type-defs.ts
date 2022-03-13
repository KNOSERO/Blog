import { gql } from '@apollo/client'

export const typeDefs = gql`
  type User {
    id:       Int
    name:     String
    surname:  String
    birth:    String
    email:    String
    school:   [School]
    job:      [Job]
    skills:   [Skills]
  }

  type School {
    id:     Int
    name:   String      
    start:  String
    end:    String
    userID: Int
  }

  type Job {
    id:     Int
    name:   String
    start:  String
    end:    String
    user:   User
    userID: Int
  }

  type Skills {
    id:     Int
    name:   String
    star:   Int 
    userID: Int
  }

  type Post {
    id:          Int
    title:       String
    description: String
  }

  type Query {
    user(name: ID): User
    post: [Post]
  }

  type Mutation {
    adduser: User
  }
`

