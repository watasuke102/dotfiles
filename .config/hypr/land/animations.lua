hl.curve("myBezier", {
  type   = "bezier",
  points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

hl.animation({
  leaf = "global",
  enabled = true,
  speed = 2,
  bezier = "myBezier",
})

hl.animation({
  leaf = "monitorAdded",
  enabled = false,
})
