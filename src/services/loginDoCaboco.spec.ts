import { compare } from "bcryptjs";
import { describe, expect, it } from "vitest";
import { RegisterUseCase } from "./loginDoCaboco";

describe("Register Use Case", () => {
  it("a senha do usuario deve ser hash assim que ele se cadastra", async () => {
    const registerUseCase = new RegisterUseCase({
      async findByEmail(email: string) {
        return null;
      },

      async create(data) {
        return {
          id: "user-1",
          name: data.name,
          email: data.email,
          password_hash: data.password_hash,
          created_at: new Date(),
        };
      },
    });

    const { user } = await registerUseCase.execute({
      name: "Jonata Jostar",
      email: "jojo@fernando.com",
      password: "12345678",
    });

    const isPasswordCorrectlyHashed = await compare(
      "12345678",
      user.password_hash
    );

    expect(isPasswordCorrectlyHashed).toBe(true);
  });
});
