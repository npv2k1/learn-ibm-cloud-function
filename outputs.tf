output "nodehello" {
  value = ibm_function_action.nodehello.target_endpoint_url
}
output "gofunc" {
  value = ibm_function_action.gofunc.target_endpoint_url

}
output "gofunc_version" {
  value = ibm_function_action.gofunc.version
}
