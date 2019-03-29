apiVersion: apps/v1
kind: Deployment
metadata:
  name: tw-in-a-box
  labels:
    app: tw-in-a-box
spec:
  replicas: 1
  selector:
    matchLabels:
      app: tw-in-a-box
  template:
    metadata:
      labels:
        app: tw-in-a-box
    spec:
      containers:
      - name: tw-in-a-box-demo
        image: asia.gcr.io/GOOGLE_CLOUD_PROJECT/hello-world:COMMIT_SHA
        ports:
        - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  name: tw-in-a-box
spec:
  selector:
    app: tw-in-a-box
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer
