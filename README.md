# 🏡 The Manor — Personal Kubernetes Homelab

**The Manor** is a self-hosted Kubernetes homelab environment running on bare metal, designed as a playground for learning cloud-native technologies, infrastructure as code, and GitOps workflows.

The project is named after the 1780 manor house I moved into — a space that inspired me to build a connected, automated digital home using modern cloud-native tools. My goal is to create an elegant, functional environment for experimentation, automation, and real-world infrastructure learning.

At the heart of the setup are two machines:  
🧠 **Paolo**, the dependable TrueNAS server managing all storage, and  
👑 **Zora**, the Kubernetes node running the cluster — graceful, fast, and in charge of everything that moves.

This has become both a functional home network and a hands-on learning lab where I’m actively contributing, experimenting with GitOps workflows, and deepening my understanding of production-grade cloud infrastructure patterns.

---

## ✨ Key Features

- 🛠 **Bare Metal Cluster** — Talos Linux is installed directly on hardware to run Kubernetes nodes, with no virtualization layer.
- 📦 **GitOps via ArgoCD** — Applications (including ArgoCD itself) are deployed from a monorepo using ArgoCD, ensuring a declarative, version-controlled workflow.
- 🧱 **Namespace Isolation** — Services are split into unique Kubernetes namespaces for better organisation and RBAC control.
- 📡 **MetalLB** — Configured with an address pool and Layer 2 advertisement for internal load balancing.
- 💾 **Persistent Storage** — NFS Subdir Provisioner connected to TrueNAS, allowing apps to claim storage via PVCs.
- 🔐 **Secure Access (Planned)** — Upcoming Tailscale Operator integration to securely expose services.
- 📊 **Monitoring (Planned)** — Plans to integrate Prometheus & Grafana for cluster metrics and observability.
- 📽️ **Media Stack (Planned)** — Jellyfin deployment as part of home media services.
- ⚙️ **Terraform + CI/CD (Planned)** — Infrastructure definitions stored under `infra/terraform`, with automation powered by GitHub Actions.

---

## 🧠 What I'm Learning

This repo reflects my hands-on journey learning:
- Kubernetes fundamentals: pods, services, ingress, PVCs
- GitOps concepts with ArgoCD
- Networking using MetalLB and service exposure strategies
- Persistent storage in Kubernetes using NFS and TrueNAS
- Infrastructure-as-Code with Terraform
- CI/CD pipelines with GitHub Actions
- Namespace management, manifest structuring, and best practices

---

## 📌 Roadmap

| Feature                    | Status        |
|---------------------------|---------------|
| ArgoCD + GitOps           | ✅ Done        |
| MetalLB + L2 Config       | ✅ Done        |
| NFS PVCs via TrueNAS      | ✅ Done        |
| Namespace Strategy        | ✅ Done        |
| Tailscale Operator        | 🔄 In Progress |
| Monitoring Stack          | 🔜 Planned     |
| Jellyfin Deployment       | 🔜 Planned     |
| GitHub Actions + Terraform| 🔜 Planned     |

---

## 📝 License

MIT — feel free to fork, use, and learn from it!
