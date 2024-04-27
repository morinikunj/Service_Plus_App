const express = require('express');
const { addCategory, getAllCategory } = require('../controllers/admin');
const { getMessaging } = require('firebase-admin/messaging');

const adminRouter = express.Router();

adminRouter.post("/add_category", addCategory);

adminRouter.get("/get_categories", getAllCategory);

adminRouter.post("/send", async (req, res) => {
    const token = "eD7hvxP3TziSXEBzKs1F1R:APA91bFV0ybGhN0nTjGJNID-dODOPdaMQW8nk4Xm0ivExEWwuz4K55qD2EgXPYgKeFHVQ4jXQuD7pcQy0xauOfFELgSmGbGGSxiBK_SAqMUDD_KUslRDT-NvyiNQQv_mmUR9vknIdPnk";
     const message = {
        notification : {
            "title": "Booking Id : 212",
            "body": "Your request is generated successfully."
        },
        token: token
     };
    getMessaging().send(message).then((response) => {
        res.json({msg: "Notification send successfully."});
    }).catch((e) => {
        res.status(500).json({ error: e });
    })
});


module.exports = adminRouter;