# `serverspec`

## Description

In this example we would like to present how to prepare an AMI that is automatically tested after provisioning, and how to setup such pipeline on AWS without any requirement for Jenkins.

We will do that by provisioning an EC2 instance with use of *Ansible*, then we will test it with *Serverspec*, and after successful pass - we will snapshot and bake an *AWS AMI* using *Packer*.

<p align="center">
  <img src="https://github.com/patternmatch/secure-and-testable-immutable-infrastructure/raw/master/serverspec/docs/diagram.png" />
</p>

## Steps to reproduce

1. Fork this repository in your *Github* account.
    - We would really appreciate if you could **star** that repository too! :wink:
2. Configure *AWS CodePipeline* orchestration flow.
    - As a first step we create a job which will automatically trigger whole flow after pushing new changes.
        - Connect your *Github* account with *AWS CodeBuild* in `eu-central-1` region.
    - As a second step we create *AWS CodeBuild* job that will provision, bake and test the *AMI*.
        - Create new or use the existing service role for *AWS CodePipeline* from [here](/infrastructure/aws-codepiepline-service-role-policy.json).
3. Create and attach existing [`PackerPolicy`](/infrastructure/packer-policy.json) to the newly created *AWS CodeBuild* role.
    - It allows to execute necessary actions, when Packer bakes the new image.
4. In order to see how main build job works, let's review the `buildspec.yml` file with related configuration files and scripts.

## References

- [Amazon Machine Image](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html)
- [Ansible](http://docs.ansible.com)
- [Packer](https://www.packer.io/docs/builders/amazon-ebs.html)
- [Serverspec](http://serverspec.org)
- [How to Create an AMI Builder with AWS CodeBuild and HashiCorp Packer](https://aws.amazon.com/blogs/devops/how-to-create-an-ami-builder-with-aws-codebuild-and-hashicorp-packer/)
