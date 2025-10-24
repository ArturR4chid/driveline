import express from "express";
import { getAllUsuarios, createUsuario, loginUsuario, resetSenha } from "../controllers/usuarioController.js";

const router = express.Router();

router.get("/", getAllUsuarios);
router.post("/", createUsuario);
router.post("/login", loginUsuario);
router.put("/senha/:id", resetSenha);

export default router;
