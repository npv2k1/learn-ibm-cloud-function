provider "ibm" {
  ibmcloud_api_key = "xxxxxxx"
  region           = "jp-tok"
}

resource "ibm_function_action" "nodehello" {
  name      = "hello-terraform"
  namespace = "Namespace-V3w"
  publish   = true

  user_defined_annotations = <<EOF
    [
      {
        "key": "web-export",
        "value": true
      }
    ]
  EOF

  limits {
    timeout = 60000
    memory  = 256
  }

  exec {
    kind = "nodejs:16"
    code = file("./web/dist/bundle.js")
  }
}


resource "ibm_function_action" "gofunc" {
  name      = "gofunc"
  namespace = "Namespace-V3w"
  publish   = true

  user_defined_annotations = <<EOF
    [
      {
        "key": "web-export",
        "value": true
      }
    ]
  EOF

  limits {
    timeout = 60000
    memory  = 256
  }

  exec {
    kind = "go:1.19"
    # code = file("./gofunc/main.go")
    code_path = "./gofunc/go.zip"
  }
}



resource "ibm_function_action" "pyfunc" {
  name      = "pyfunc"
  namespace = "Namespace-V3w"
  publish   = true

  user_defined_annotations = <<EOF
    [
      {
        "key": "web-export",
        "value": true
      }
    ]
  EOF

  limits {
    timeout = 60000
    memory  = 256
  }

  exec {
    kind      = "python:3.9"
    code_path = "./pythonfunc/helloPython.zip"
  }
}


resource "ibm_function_action" "dockerfunc" {
  name      = "dockerfunc"
  namespace = "Namespace-V3w"
  publish   = true

  user_defined_annotations = <<EOF
    [
      {
        "key": "web-export",
        "value": true
      }
    ]
  EOF

  limits {
    timeout = 60000
    memory  = 256
  }

  exec {
    kind  = "blackbox"
    image = "ubuntu:latest"

  }
}
