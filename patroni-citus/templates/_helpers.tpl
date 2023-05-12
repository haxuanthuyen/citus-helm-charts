

{{- define "standard_citus_env" -}}
{{- range $i, $config := .Values.env }}
- name: {{ $config.name }}
  value: {{ $config.value | quote }}
{{- end }}
{{- range $i, $config := .Values.secret }}
- name: {{ $config.envName }}
  valueFrom:
    secretKeyRef:
      name: {{ $config.secretName }}
      key: {{ default "value" $config.secretKey }}
{{- end }}
- name: PATRONI_KUBERNETES_POD_IP
  valueFrom:
    fieldRef:
      fieldPath: status.podIP
- name: PATRONI_KUBERNETES_NAMESPACE
  valueFrom:
    fieldRef:
      fieldPath: metadata.namespace
- name: PATRONI_SCOPE
  value: {{ .Values.cluster.name }}
- name: PATRONI_NAME
  valueFrom:
    fieldRef:
      fieldPath: metadata.name
{{- end }}
