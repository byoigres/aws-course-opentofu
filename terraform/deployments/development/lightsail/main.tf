locals {
  name = "coolify"
  tags = merge(var.tags, {
    coolify = true
  })
}
