import { FastifyInstance } from "fastify";
import { register } from "./controllers/loginDoCaboco";

export async function appRoutes(app: FastifyInstance) {
  app.post("/users", register);
}
