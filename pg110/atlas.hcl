env "repro" {
  dev   = "docker://postgres/15/dev?search_path=public"
  migration {
    dir = "file://migrations"
  }
}
