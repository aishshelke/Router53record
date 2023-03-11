resource "aws_route53_record" "RECORDNAME" {
  zone_id = "Hosted zone id"
  name    = "RECORDNAME.abc.com"
  type    = "A"
  alias {
    name                   = "ELB_NAME"
    zone_id                = "ELB_HOSTED_ZONE"
    evaluate_target_health = true
  }
}
