import { UsersRepository } from "../users-repository";

class InMemoryUsersRepository implements UsersRepository {
  async findByEmail(email:string) {
    throw new Error('Method not implement')
  }
}