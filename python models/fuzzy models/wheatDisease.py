#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import skfuzzy as fuzz
from skfuzzy import control as ctrl


# In[2]:


max_temp = ctrl.Antecedent(np.arange(0, 41, 1), 'max_temp')
min_temp = ctrl.Antecedent(np.arange(0, 41, 1), 'min_temp')
relative_humidity = ctrl.Antecedent(np.arange(0, 101, 1), 'relative_humidity')
wind_speed = ctrl.Antecedent(np.arange(0, 9.1, 0.1), 'wind_speed')
rust_severity = ctrl.Consequent(np.arange(0, 11, 1), 'rust_severity')


# In[3]:


max_temp['accepted'] = fuzz.trimf(max_temp.universe, [0, 15, 24])
max_temp['rejected'] = fuzz.trimf(max_temp.universe, [25, 35, 40])


# In[4]:


min_temp['rejected'] = fuzz.trimf(min_temp.universe, [0, 4, 8])
min_temp['accepted'] = fuzz.trimf(min_temp.universe, [9, 11, 13])
min_temp['rejected2'] = fuzz.trimf(min_temp.universe, [14, 27, 40])


# In[5]:


relative_humidity['rejected'] = fuzz.trimf(relative_humidity.universe, [0, 35, 70])
relative_humidity['accepted'] = fuzz.trimf(relative_humidity.universe, [71, 85, 100])


# In[6]:


wind_speed['rejected'] = fuzz.trimf(wind_speed.universe, [0, 1, 1.5])
wind_speed['accepted'] = fuzz.trimf(wind_speed.universe, [1.6, 6, 9])


# In[7]:


rust_severity['low'] = fuzz.trimf(rust_severity.universe, [0, 3, 5])
rust_severity['high'] = fuzz.trimf(rust_severity.universe, [6, 8, 10])


# In[8]:


max_temp['accepted'].view()
min_temp['accepted'].view()
relative_humidity['accepted'].view()
wind_speed['accepted'].view()


# In[9]:


rust_severity['high'].view()


# In[10]:


rule1 = ctrl.Rule(max_temp['accepted'] & min_temp['accepted'] & relative_humidity['accepted'] & wind_speed['accepted'], rust_severity['high'])
rule2 = ctrl.Rule(max_temp['rejected'] | min_temp['rejected'] | min_temp['rejected2'] | relative_humidity['rejected'] | wind_speed['rejected'], rust_severity['low'])


# In[11]:


rule1.view()
rule2.view()


# In[12]:


rust_ctrl = ctrl.ControlSystem([rule1, rule2])


# In[13]:


rust_disease_severity = ctrl.ControlSystemSimulation(rust_ctrl)


# In[14]:


rust_disease_severity.input['max_temp'] = 20
rust_disease_severity.input['min_temp'] = 20
rust_disease_severity.input['relative_humidity'] = 37
rust_disease_severity.input['wind_speed'] = 12.5

rust_disease_severity.compute()


# In[15]:


print (rust_disease_severity.output['rust_severity'])
rust_severity.view(sim=rust_disease_severity)


# In[ ]:




