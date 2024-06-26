{{- define "defaultTemplate" -}}
apiVersion: v1
kind: Secret
metadata:
  namespace: {{ coalesce .namespace .Release.Namespace }}
  name: {{ .secretName }}
{{- if .Values.labels }}
  labels:
{{ toYaml .Values.labels | indent 4 }}
{{- end }}
{{- if .Values.annotations }}
  annotations:
{{ toYaml .Values.annotations | indent 4 }}
{{- end }}
stringData:
{{ toYaml .secretContent | indent 2 }}
type: {{ .type }}
{{- end }}