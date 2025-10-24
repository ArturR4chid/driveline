import { db } from "../config/db.js";

export const getAllUsuarios = (req, res) => {
  db.query("SELECT * FROM usuarios", (err, result) => {
    if (err) return res.status(500).json({ error: err });
    res.json(result);
  });
};

export const createUsuario = (req, res) => {
  const { nome, email, senha } = req.body;
  db.query("INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)", [nome, email, senha], (err) => {
    if (err) return res.status(500).json({ error: err });
    res.status(201).json({ message: "Usuário criado!" });
  });
};

export const loginUsuario = (req, res) => {
  const { email, senha } = req.body;
  db.query("SELECT * FROM usuarios WHERE email = ? AND senha = ?", [email, senha], (err, result) => {
    if (err) return res.status(500).json({ error: err });
    if (result.length > 0) res.json(result[0]);
    else res.status(401).json({ error: "Credenciais inválidas" });
  });
};

export const resetSenha = (req, res) => {
  const { id } = req.params;
  const { novaSenha } = req.body;
  db.query("UPDATE usuarios SET senha = ? WHERE id = ?", [novaSenha, id], (err) => {
    if (err) return res.status(500).json({ error: err });
    res.json({ message: "Senha atualizada com sucesso" });
  });
};
