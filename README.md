# Platform-v1

The purpose of this software is to install the CUTLER platform, including infrastructure, dependencies and services. This readme offers an overview, with more detail on specific components being contained in the readme files in the subdirectories.

## Deployment

### Ansible Services

The Ansible automation tool is used to install the following services: Apache2, Hadoop, Flume, Spark, Kafka, Zookeeper, Elasticsearch, Kibana, MatLab. More detail can be found in the [Ansible](https://github.com/CUTLER-H2020/Platform-v1/tree/master/Deployment/Ansible) directory

### Ubuntu Base Image

The packer build script for a Ubuntu base VM image on vSphere, configured with static IP addresses present in the preseed file. Directory: [Ubuntu-Base](https://github.com/CUTLER-H2020/Platform-v1/tree/master/Deployment/Ubuntu-Base)

### vSphere Infrastructure

The underlying vSphere infrastrucutre is deployed using terraform, in one of four available VM configurations. Directory: [vSphereInfrastructure](https://github.com/CUTLER-H2020/Platform-v1/tree/master/Deployment/vSphereInfrastructure)

## Configuration

### Service Configuration

The configuration files for several of the services which are deployed by ansible (Hadoop, Elasticsearch, Flume, Kafka, Kibana, Spark) are defined in the subdirectories of this directory: [Configuration](https://github.com/CUTLER-H2020/Platform-v1/tree/master/Configurations)
