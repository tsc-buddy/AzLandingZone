# Introduction

This project is managed by the Leaven Azure Practice Team. It contains the source code, product backlog & all other relevant artefacts for the Terraform based MVC Landing Zone Solution. The purpose of this solution is to enable the rapid delivery of consistent, secure & production ready landing zones. The Landing Zone design options are based around an 80/20 model.

It is extremely common to find that most LZ's deployed with the well architected framework in mind contain many similarities. With this in mind, this solution focuses on providing a small number of landing zones designs, each of which would make up 80% of the majority of our customers Landing Zone requirements. The remaining 20% of an MVC Landing Zone consists of specific resources and configuration for the customer, their workloads and applications in question.

For more information on what the current LZ design options are and the resources they consist of, see below.

# LZ Design Options (as of Jan 2021)

### Single VNET

### Hub & Spoke

### Hub & Spoke w/transit connectivity

### App Service Landing Zone (Coming April 2021)

# Directory Structure

The directory of the MVC LZ Solution is broken down as follows:

**environment** - this directory is where 'environments' made up of a collection of module references. This goes beyond the context of just networking. For example the directory /environment/LZ-standard/01_standard_hub contains everything required for a shared services subscription. Remote state storage, management groups, Azure Policies, diagnostic settings, networking, compute for a Domain Controller etc.

The idea with this is an environment is built as a bundle that makes up one of the LZ designs available.

**modules** - a collection of modules, both custom and as provided on TF Registry. A custom example is 'network_transit_hub'

**resources** - contains all tf resource source code based primarily on the 'azurerm' provider

**Templates** - this directory contains code templates for additional resource or module creations.

**readMe** - contains all readme markdown files.


# Getting Started
Please ensure you are familiar with how TF is written and deployed before working on this solution...

# Roadmap
