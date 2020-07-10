variable "region" {
  default = "us-west-2"
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = [
    "146088740470",
  ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      rolearn  = "arn:aws:iam::146088740470:role/eks-cluster-role"
      username = "eks-cluster-role"
      groups   = ["system:masters"]
    },
  ]
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::146088740470:user/kubex"
      username = "kubex"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::146088740470:user/kuberexpert"
      username = "kuberexpert"
      groups   = ["system:masters"]
    },
  ]
}
