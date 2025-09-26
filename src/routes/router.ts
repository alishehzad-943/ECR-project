import { Router } from "express";

const router = Router();

router.get("/", (_req, res) => {
  res.json({ message: "Hello from Docker v3 🎉" });
});

// ✅ Proper health check endpoint
router.get("/health", (_req, res) => {
  res.status(200).json({ message: "Everything is good here 👀" });
});

export default router;
