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

Any researcher constantly asks themselves: but what if I switch X?

And so the researcher starts to configure a pipeline. 

# Config Methods I've Used

First time I built a config it was in VBA. I had a text file I loaded in that could be overwritten based on setting someone chose.

Second time I config'd something was in Python. I used `ConfigParser` per my Manager David Mantilla's suggestion. It was pretty good for 2017. But unwieldy. Don't use this. It had cool string substitutions but there are better tools now. 

Third thing I saw was using a Python constants.py file. Just import Python variables from another module. This is nice because you can import model objects or such. Dicts. Whatever. Seems great. But it's Python code. Config files shouldn't be code. They should be configs. Every great software follows this, like `k8s` helm charts or whatever. Google loves using `Protobufs`. Configs shouldn't be code, because if they're code they're dangerous. You start doing crazy things with them. 

Fourth thing I did was to use YAML which is very clean. Lots of people like YAML. This gets unwieldy if you need 100 configs for different customers, for example. Can you imagine managing 100 yaml files? What if you need to update one param? Then you need to update 100 files. Rough. So then you start setting "default" blocks and settings. 

I also used Pydantic to read in the YAML file and validate types. Gotta validate types. What's an int vs a string? Well, this mean that we needed to design the pipeline to rely on some `config` class. We had to pass this config object around everywhere. Not super idea but gets the job done. 

Fifth thing was to use one default YAML. This solved the issue of redundancy across all the 100 YAML files. (If you only have one model, you probably need only 1 YAML file so this may not be your problem.) But this still kinda stinks. It's in a file. 

Sixth thing was some eng's on my team saw a better way and build a CRUD database. This made it so we didn't have to do a code change to update a config. That means that people outside the team could edit a config. Awesome. But we still have 100 web pages that could change. Kinda sux. And we still had a default setting - essential. Benefits of a crud are migrations. You can get rid of one option across 100 configs more easily. 

Problem with 100 YAML or 100 web pages is that if you want to change things or run experiments, you need to literally clone the config file. Now you have 15 versions of the same config file with slight modifications and you can't remember what's going on. So you delete them all eventually and just pick one. 

Seventh thing: shove everything into environment variables. Create a `.env` file and load with `dotenv() `  but that gets messy because env files don't support data type validation. Validation is essential, lest you try to encode a Boolean in your env file only to realize environment variables only support strings and then you have a "False" rendering as true in your "if os.get(MY_BOOL)" call just because it exists as a valid string. Blech... 🤮 

# Hydra?

I'm writing this because I just learned about `hydra` . Remember: I use this site for note taking. Here's what I just learned. 

![Hydra!](../img/screenshot-hydra-configs.jpeg){.preview-image}

[Hydra | Hydra](https://hydra.cc/)

- Hydra is Python open source maintained by Facebook 
- If built to configure pipelines, in particular ML pipelines but could be used for anything. 
- It uses `dataclasses` and `yaml` files, so I'm thinking I was smart for what I did with my fourth option. 
- But it quickly allows you to override config files from the command line or from editing the yaml file directly. 

This demo is slick:

{{< video https://youtu.be/tEsPyYnzt8s?si=2T58Ix4ZAo-N75y0 >}} 

# Why I like Hydra's design

 - This seems really nice because it avoids the headache of changing code. 
- Also, you can create a simple bash loop to execute 5 different experiments - while retaining only one config file 
- Also, I used to think that having a system of record is pretty important: I need to save the configs that were used for this run. That tells me how the pipeline or experiment was configured. I still think that's true: but I believe that should be done via logging instead of managing 15 config files. 
- My new belief is that experiments should be ephemeral to keep the code clean. Have one prod `yaml` file and then everything else is ephemeral. Log everything: log the created yaml file with all defaults filled inso you can recreate it if necessary. 

# My Ideal World

Hydra doesn't solve the "you shouldn't have to do a git push to update prod". If everything is a `yaml` file then to update prod you need to do a code change. 

Google doesn't seem to mind using code changes because everything is a protobuff. Code changes are nice because they're reviewed. 

But code changes are slow. And non-coders can do them. 

So I believe one prod config should live in a UI with a database backend. But then that should be serialized to `yaml` and loaded via something like hydra. 

I also believe experiments should be launched programmatically. Meaning I should be able to kick off 10 experiments training 10 models using a bash script. I can then log this experiment using [Why you should log with Aimstack](why-you-should-log-with-aimstack.md) and I can log the full config there. 

Also, I'd throw `hydra` in with `metaflow` .

How do you configure?
# Appendix

- [Easy Hyperparameter Management with Hydra, MLflow, and Optuna | by NT | Optuna | Medium](https://medium.com/optuna/easy-hyperparameter-management-with-hydra-mlflow-and-optuna-783730700e7d)