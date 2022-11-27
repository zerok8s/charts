{{- define "flannel.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "flannel.defaultTag" -}}
{{- default (printf "v%s" .Chart.AppVersion) .Values.image.flannel.tag }}
{{- end -}}

{{- define "serviceAccount.name" -}}
{{- default .Chart.AppVersion .Values.image.flannel.tag }}
{{- end -}}