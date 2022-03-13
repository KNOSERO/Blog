import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export const resolvers = {
  Query: {
    user: async (parent: any, args: any, context: any, info: any) => {
      return await prisma.user.findFirst({
        where: {
          name: args.name
        },
        include: {
          job: true
        }
      })
    },
  },
}
