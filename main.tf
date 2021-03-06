resource "helm_release" "rancher" {
  count     = var.enable_rancher ? 1 : 0
  name      = "rancher"
  chart     = "rancher-${var.rancher_release_branch}/rancher"
  version   = "v${var.rancher_release_version}"
  namespace = var.rancher_namespace
  dynamic "set" {
    for_each = var.rancher_settings
    iterator = setting
    content {
      name  = setting.key
      value = setting.value
    }
  }
}
