# Project Roadmap: Open WebUI + Ollama on Google Cloud Run

## Overview
This roadmap outlines the steps and milestones for deploying Open WebUI with Ollama on Google Cloud Run, leveraging GPU support, Google Cloud Storage (GCS) for model persistence, and best practices from recent guides and codelabs.

---

## 1. **Project Preparation**
- [ ] **Set up Google Cloud Project**
  - Create/select a Google Cloud project
  - Enable billing
- [ ] **Install/Update gcloud CLI**
  - Ensure you have the latest gcloud CLI
- [ ] **Enable Required APIs**
  - Cloud Run, Cloud Build, Artifact Registry, Storage

## 2. **Storage Setup**
- [ ] **Create a GCS Bucket**
  - Name it uniquely (e.g., `ollama-gemma2-2b-xyz`)
  - Enable hierarchical namespace for optimized LLM access
  - Set region (e.g., `us-central1`)
  - Set storage class to Standard
  - Use uniform access control

## 3. **Model Preparation**
- [ ] **Install Ollama Locally**
  - Download and install Ollama
  - Pull required model(s) (e.g., `gemma2:2b`)
- [ ] **Upload Model to GCS**
  - Move/push model files to the GCS bucket

## 4. **Container Image Preparation**
- [ ] **Ollama Sidecar Image**
  - Create a Dockerfile for Ollama with model pre-loading (if needed)
  - Build and push the image to Artifact Registry
- [ ] **Open WebUI Image**
  - Pull the official Open WebUI image
  - Tag and push to Artifact Registry

## 5. **Cloud Run Service Configuration**
- [ ] **Create/Adapt service.yaml**
  - Multi-container setup: Open WebUI (frontend) + Ollama (sidecar)
  - GPU resource requests (nvidia-l4)
  - GCS volume mounting for model storage
  - Environment variables for both containers
  - Health checks and startup probes
  - Auto-scaling and resource limits
- [ ] **Update YAML with Project-Specific Values**
  - Replace placeholders (e.g., `YOUR_PROJECT_ID`)

## 6. **Deployment**
- [ ] **Deploy to Cloud Run**
  - Use `gcloud beta run services replace service.yaml`
  - Monitor deployment and logs

## 7. **Testing & Validation**
- [ ] **Access Service URL**
  - Test Open WebUI frontend
  - Test Ollama API endpoints
- [ ] **Model Inference**
  - Run sample prompts/requests

## 8. **Security & Optimization**
- [ ] **Add Authentication (Optional)**
  - Secure Open WebUI if exposed to the public
- [ ] **Monitor Usage and Costs**
  - Set max instances, monitor GCS and Cloud Run usage

## 9. **Documentation & Maintenance**
- [ ] **Document Setup and Usage**
  - Write clear setup, usage, and troubleshooting docs
- [ ] **Update Images and Models as Needed**
  - Keep Docker images and models up to date

---

## References
- [Google Codelab: Open WebUI + Ollama on Cloud Run](https://codelabs.developers.google.com/codelabs/how-to-use-ollama-sidecar-open-webui-frontend-cloud-run-gpu#0)
- [How to run (any) open LLM with Ollama on Google Cloud Run (Geshan)](https://geshan.com.np/blog/2025/01/ollama-google-cloud-run/)

---

**This roadmap is a living document and should be updated as new best practices and requirements emerge.** 