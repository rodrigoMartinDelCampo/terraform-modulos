export default {
  async fetch(request, env) {
    const db = env.DB;

    // Crea la tabla si todavia no existe
    await db
      .prepare(
        "CREATE TABLE IF NOT EXISTS visits (id INTEGER PRIMARY KEY AUTOINCREMENT, created_at TEXT DEFAULT CURRENT_TIMESTAMP)"
      )
      .run();

    // Registra esta visita (el contador sube con cada GET)
    await db.prepare("INSERT INTO visits DEFAULT VALUES").run();

    const count = await db
      .prepare("SELECT COUNT(*) as total FROM visits")
      .first();

    return Response.json({
      ok: true,
      message: "Worker funcionando con D1 y modulos",
      visitas: count?.total ?? 0,
      url: request.url,
    });
  },
};
