{{- define "defaultTemplate" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: {{ coalesce .namespace .Release.Namespace }}
  name: {{ .configName }}
{{- if .Values.labels }}
  labels:
{{ toYaml .Values.labels | indent 4 }}
{{- end }}
{{- if .Values.annotations }}
  annotations:
{{ toYaml .Values.annotations | indent 4 }}
{{- end }}
data:
{{ toYaml .configContent | indent 2 }}

{{- end }}