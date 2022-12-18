resource "aws_route53_record" "www" {
  zone_id = abc.io.primary.Z0427719376SIPEUTQP9C
  name    = "$REPOSITORY_NAME_$BITBUCKET_SOURCE_BRANCH"
  type    = "A"

  alias {
    name                   = dev-alb.main.abc.io
    zone_id                = dev-alb.main.Z0427719376SIPEUTQP9C
    evaluate_target_health = true
  }
}
