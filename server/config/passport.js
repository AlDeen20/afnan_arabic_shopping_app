const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const adminsModel = require("../models/adminsModel");

passport.use(
  new LocalStrategy(
    {
      usernameField: "username"
    },
    async (username, password, done) => {
      try {
        const user = await adminsModel.findOne({ where: { username: username } });

        if (!user) {
          // console.log("user not found");
          return done(null, false, { message: "User was not found" });
        } else {
          // console.log("user found");
          if (password === user.password) {
            // console.log("correct password");
            return done(null, user);
          } else {
            // console.log("incorrect password");
            return done(null, false, { message: "Wrong password" });
          }
        }
      } catch (error) {
        // console.error("Error:", error);
        return done(error);
      }
    }
  )
);

passport.serializeUser(function (user, done) {
  done(null, user.id);
});

passport.deserializeUser(async function (id, done) {
  try {
    const user = await adminsModel.findByPk(id);
    done(null, user);
  } catch (error) {
    console.error("Error:", error);
    done(error);
  }
});
