const express = require("express");
const app = express();
app.disable("x-powered-by");
app.get("/", (_req, res) => res.json({ status: "ok", service: "dockserv-demo-app" }));
app.get("/health", (_req, res) => res.status(200).json({ status: "healthy" }));
app.listen(3000, "0.0.0.0", () => console.log("DockServ demo app listening on :3000"));
