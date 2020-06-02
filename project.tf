module "ml-language" {
  source = "./modules/enable-api"
  project = var.project
  service = "language.googleapis.com"
}

module "ml-texttospeech" {
  source = "./modules/enable-api"
  project = var.project
  service = "texttospeech.googleapis.com"
}

module "ml-speech" {
  source = "./modules/enable-api"
  project = var.project
  service = "speech.googleapis.com"
}

module "ml-translate" {
  source = "./modules/enable-api"
  project = var.project
  service = "translate.googleapis.com"
}

module "ml-automl" {
  source = "./modules/enable-api"
  project = var.project
  service = "automl.googleapis.com"
}

module "ml-dialogflow" {
  source = "./modules/enable-api"
  project = var.project
  service = "dialogflow.googleapis.com"
}

module "cloud-function" {
  source = "./modules/enable-api"
  project = var.project
  service = "cloudfunctions.googleapis.com"
}

module "app-engine-api" {
  source = "./modules/enable-api"
  project = var.project
  service = "appengine.googleapis.com"
}

module "deploymentmanager" {
  source = "./modules/enable-api"
  project = var.project
  service = "deploymentmanager.googleapis.com"
}

module "scheduler" {
  source = "./modules/enable-api"
  project = var.project
  service = "cloudscheduler.googleapis.com"
}

/*
module "ml-video" {
  source = "./modules/enable-api"
  project = var.project
  service = "videointelligence.googleapis.com"
}

module "ml-storage" {
  source = "./modules/enable-api"
  project = var.project
  service = "storagetransfer.googleapis.com"
}
*/
module "service-account" {
  source = "./modules/service-account"
  account_id = "learning-ml"
}

output "service-account-private-key" {
  value = <<EOF

${base64decode(module.service-account.private_key)}
EOF
}

resource "local_file" "service-account-file" {
    content     = base64decode(module.service-account.private_key)
    filename = "${path.module}/service-account.json"
}
