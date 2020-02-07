{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "blue-green.name" -}}
{{- printf "%s-%s" .Chart.Name .Values.spinnaker.executionId | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "blue-green.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "blue-green.labels" -}}
app: {{ include "blue-green.name" . }}
helm.sh/chart: {{ include "blue-green.chart" . }}
{{ include "blue-green.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "blue-green.selectorLabels" -}}
app: {{ include "blue-green.name" . }}
app.kubernetes.io/name: {{ include "blue-green.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
