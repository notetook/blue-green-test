{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "blue-green-istio.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "blue-green-istio.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "blue-green-istio.labels" -}}
app: {{ include "blue-green-istio.name" . }}
helm.sh/chart: {{ include "blue-green-istio.chart" . }}
{{ include "blue-green-istio.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "blue-green-istio.selectorLabels" -}}
app: {{ include "blue-green-istio.name" . }}
app.kubernetes.io/name: {{ include "blue-green-istio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
