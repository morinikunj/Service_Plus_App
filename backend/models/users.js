const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
       type: String,
       required: true,
       trim: true,
    },
    email: {
        type: String,
        required: true,
        trim: true,
        unique: true,
        lowercase: true,
        validate: {
            validator: (value) => {
                const pattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                return value.match(pattern);
            },
            message: "Please enter valid email!"
        }
    },
    password: {
        type: String,
        required: true,
        trim: true,
    },
    type: {
        type: String,
        default: 'user',
    }
});

const User = mongoose.model("User", userSchema);

module.exports = User;