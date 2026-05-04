# alb-controller

![Version: v0.0.1](https://img.shields.io/badge/Version-v0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest-main](https://img.shields.io/badge/AppVersion-latest--main-informational?style=flat-square)

A Helm chart to install the ALB Controller on Kubernetes

## Requirements

Kubernetes: `>= 1.20.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| albController.controller | object | `{"nodeSelector":{},"replicaCount":2,"resource":{"limits":{"cpu":"400m","memory":"400Mi"},"requests":{"cpu":"100m","memory":"200Mi"}},"tolerations":[]}` | controller parameters |
| albController.controller.nodeSelector | object | `{}` | nodeSelector for alb-controller |
| albController.controller.replicaCount | int | `2` | controller's replica count |
| albController.controller.resource | object | `{"limits":{"cpu":"400m","memory":"400Mi"},"requests":{"cpu":"100m","memory":"200Mi"}}` | controller's container resource parameters |
| albController.controller.tolerations | list | `[]` | tolerations for alb-controller |
| albController.env | list | `[{"name":"","value":""}]` | environment variables for alb-controller |
| albController.image | object | `{"name":{"CRDs":"application-lb/images/alb-controller-crds","bootstrap":"application-lb/images/alb-controller-bootstrap","controller":"application-lb/images/alb-controller"},"pullPolicy":"IfNotPresent","registry":"mcr.microsoft.com"}` | alb-controller image parameters |
| albController.image.name | object | `{"CRDs":"application-lb/images/alb-controller-crds","bootstrap":"application-lb/images/alb-controller-bootstrap","controller":"application-lb/images/alb-controller"}` | Image name defaults |
| albController.image.name.CRDs | string | `"application-lb/images/alb-controller-crds"` | alb-controller's crds' image name |
| albController.image.name.bootstrap | string | `"application-lb/images/alb-controller-bootstrap"` | alb-controller bootstrap's image name |
| albController.image.name.controller | string | `"application-lb/images/alb-controller"` | alb-controller's image name |
| albController.image.pullPolicy | string | `"IfNotPresent"` | Container image pull policy for controller containers |
| albController.image.registry | string | `"mcr.microsoft.com"` | Container image registry for alb controller |
| albController.imagePullSecrets | list | `[]` |  |
| albController.init | object | `{"resource":{"limits":{"cpu":"200m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}}` | init parameters |
| albController.init.resource | object | `{"limits":{"cpu":"200m","memory":"128Mi"},"requests":{"cpu":"100m","memory":"128Mi"}}` | init container's resource parameters |
| albController.installGatewayApiCRDs | bool | `true` | A flag to enable/disable installation of Gateway API CRDs |
| albController.ipAccessRulesFeatureFlag | bool | `false` |  |
| albController.logLevel | string | `"info"` | Log level of alb-controller |
| albController.namespace | string | `"azure-alb-system"` | Namespace to deploy alb-controller components in. |
| albController.podIdentity | object | `{"clientID":""}` | pod-identity parameters for alb-controller |
| albController.securityPolicyFeatureFlag | bool | `true` | feature flags Enable Application Load Balancer Security Policy Resource |

