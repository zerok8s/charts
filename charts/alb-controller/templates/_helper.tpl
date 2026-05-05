{{/* Determine alb-controller namespace */}}
{{- define "albController.namespace" -}}
{{ default .Values.albController.namespace }}
{{- end -}}

{{/* Reference to the container image tag */}}
{{- define "albController.imageTag" -}}
{{- if .Values.albController.image.tag -}}
{{- .Values.albController.image.tag -}}
{{- else -}}
{{- .Chart.AppVersion -}}
{{- end -}}
{{- end -}}

{{/* Image path prefix based on the registry */}}
{{- define "albController.imagePathPrefix" -}}
{{- if hasPrefix "mcr.microsoft.com" .Values.albController.image.registry -}}
{{- printf "%s" .Values.albController.image.registry -}}
{{- else -}}
{{- printf "%s/public" .Values.albController.image.registry -}}
{{- end -}}
{{- end -}}

{{/* alb controller image */}}
{{- define "albController.image" -}}
{{- include "albController.imagePathPrefix" . -}}{{- printf "/%s:" .Values.albController.image.name.controller -}}{{- include "albController.imageTag" . -}}
{{- end -}}


{{/* alb-controller-crds image */}}
{{- define "albControllerCRDs.image" -}}
{{- include "albController.imagePathPrefix" . -}}{{- printf "/%s:" .Values.albController.image.name.CRDs -}}{{- include "albController.imageTag" . -}}
{{- end -}}

{{/* alb-controller-bootstrap image */}}
{{- define "albControllerBootstrap.image" -}}
{{- include "albController.imagePathPrefix" . -}}{{- printf "/%s:" .Values.albController.image.name.bootstrap -}}{{- include "albController.imageTag" . -}}
{{- end -}}
