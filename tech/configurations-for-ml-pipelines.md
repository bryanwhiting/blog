---
title: Configurations for ML Pipelines
date: 2024-04-02 21:50:43
created: 2024-04-02 21:50:43
categories:
  - tech
  - configuration
  - software engineering
  - ml pipeline
  - ml-tools
draft: false
---
Configuring an ML pipeline means you have 15 different things that could change at any time and you create a way to easily change those 15 things. Those 15 things could be file paths, data filtering steps, models you want to use, etc. 

Any researcher constantly asks themselves: but what if I switch X parameter? What would happen?

And so the researcher starts to configure a pipeline. 

# Config Methods I've Used

First time I built a config it was in VBA. I had a text file I loaded in that could be overwritten based on a setting someone chose.

Second time I config'd something was in Python. I used ConfigParser, a Python standard library class. It was pretty good for 2017. But unwieldy. Don't use this. It had cool string substitutions but there are better tools now. 

Third thing I saw was using a Python constants.py file. Just import Python variables from another module. This is nice because you can import model objects or such. Dicts. Whatever. Seems great. But it's Python code. Config files probably shouldn't be code. They should be configs. Configs are easy to read for non-tech folks. They have no dependencies. They're just plain text files. Every great software follows this, like `k8s` helm charts or whatever. Google loves using `Protobufs`. Configs shouldn't be code, because if they're code they're dangerous. You start doing crazy things with them. 

Fourth thing I did was to use YAML which is very clean. Lots of people like YAML. This gets unwieldy if you need 100 configs for different customers, for example. Can you imagine managing 100 yaml files? What if you need to update one param? Then you need to update 100 files. Rough. So then you start setting "default" blocks and settings. 

A nice pairing was to use Pydantic to read in the YAML file and validate types. You've got to validate types. What's an int vs a string? Using `pydantic` means that we needed to design the pipeline to rely on some `config` class on the top level. My suggestion would be to design functions to take in arguments that are satisfied by the config, and don't pass the config object itself into the function. The former keeps your code cleaner and more testable. The latter sends you down a chaotic slippery slope. 

Fifth thing was to use one default YAML. This solved the issue of redundancy across all the 100 YAML files. (If you only have one model, you probably need only 1 YAML file so this may not be your problem.) But this still kinda stinks. It's in a file. 

Sixth thing was some eng's on my team saw a better way and build a CRUD database. This made it so we didn't have to do a code change to update a config. That means that people outside the team could edit a config. Awesome. But we still have 100 web pages that could change. Kinda sux. And we still had a default setting - essential. Benefits of a crud are migrations. You can get rid of one option across 100 configs more easily. 

Problem with 100 YAML or 100 web pages is that if you want to change things or run experiments, you need to literally clone the config file. Now you have 15 versions of the same config file with slight modifications and you can't remember what's going on. So you delete them all eventually and just pick one. 

Seventh thing: shove everything into environment variables. Create a `.env` file and load with `dotenv() `  but that gets messy because env files don't support data type validation. Validation is essential, lest you try to encode a Boolean in your env file only to realize environment variables only support strings and then you have a "False" rendering as true in your "if os.get(MY_BOOL)" call just because it exists as a valid string. Blech... 🤮 

# Hydra?

I've been using Hydra lately and I see a lot of benefits in that it solves a lot of the things I've tried and seen solved above. 

![Hydra!](../img/screenshot-hydra-configs.jpeg){.preview-image}

[Hydra | Hydra](https://hydra.cc/)

- Hydra is Python open source maintained by Facebook 
- If built to configure pipelines, in particular ML pipelines but could be used for anything that needs config files. 
- It uses `dataclasses`, which ensures the typing of your files
- It uses `yaml` files as the config sources
- You can specify default config values
- It quickly allows you to override config files from the command line or from editing the yaml file directly. 
- It's possible to run from the command line a single config with several different values using the `multirun` flag. 
- It gives a nice way to organize your output folder and automatically exports the fully qualified config there. 
- It will capture your logs into your output directory. 
- You can version your configs very easily. 

This demo is slick:

{{< video https://youtu.be/tEsPyYnzt8s?si=2T58Ix4ZAo-N75y0 >}} 

# Why I like Hydra's design

 - This seems really nice because it avoids the headache of changing code. 
- Also, you can create a simple bash loop to execute 5 different experiments - while retaining only one config file. Or you can just use the `multirun` flag to cross a few arguments easily. It'll create separate output folders for each run. 
- Hydra maintains a system of record for every run. You know exactly how that run was generated given the parameters fed into it. 

# My Ideal World

Hydra makes it incredibly easy to kick off a bunch of runs without managing multiple configurations or hard-coding constants into a Python file. 

It enables you to have parameters outside of your code. This makes experimentation very easy. 

It does not make it easy for non-developers to edit the config - so you'd still want a GUI to enable that that translates into yaml files. This isn'

It's lightweight - all it does is create a `config` class that you then pass into your pipeline to control the pipeline. That pipeline could be airflow or whatever.

It may be nice to pair `hydra` with `metaflow` or `flyte`.

How do you configure?
# Appendix

- [Easy Hyperparameter Management with Hydra, MLflow, and Optuna | by NT | Optuna | Medium](https://medium.com/optuna/easy-hyperparameter-management-with-hydra-mlflow-and-optuna-783730700e7d)
- [Why you should log with Aimstack](why-you-should-log-with-aimstack.md)