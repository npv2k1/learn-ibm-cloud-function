function main(args) {
  const bcrypt = require("bcryptjs");
  const password = args.password;
  if (!password) {
    return { error: "password is required" };
  }
  const salt = bcrypt.genSaltSync(10);
  const hash = bcrypt.hashSync(password, salt);

  return {
    headers: {
      "Set-Cookie": [
        "UserID=Jane; Max-Age=3600; Version=",
        "SessionID=asdfgh123456; Path = /",
      ],
      "Content-Type": "application/json",
    },
    statusCode: 200,
    body: {
      hash: hash,
      salt: salt,
      password: password,
    },
  };
}

global.main = main;
