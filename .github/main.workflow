workflow "Generate Document" {
  on = "push"
  resolves = ["Save To GH Pages"]
}

action "Tex To PDF" {
  uses = "./"
  env = {
    OUT_DIR = "public"
  }
}

action "Save To GH Pages" {
  uses = "maxheld83/ghpages@v0.2.1"
  needs = ["Tex To PDF"]
  env = {
    BUILD_DIR = "public/"
  }
  secrets = ["GH_PAT"]
}
