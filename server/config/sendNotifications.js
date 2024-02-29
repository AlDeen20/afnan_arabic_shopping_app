import express from "express";
import admin from 'firebase-admin';


async function sendNotifications(message) {
  await  admin.messaging().send(message);
    }
export default sendNotifications
