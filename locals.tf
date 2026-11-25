locals {
  suffix = "${var.environment}-${var.region_code}"
  tags = merge(var.tags, {
    environment = var.environment
    managed_by  = "terraform"
  })
}
