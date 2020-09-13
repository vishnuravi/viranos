#!/usr/bin/env python
# coding: utf-8

# In[1]:


#Import
import plotly
import plotly.graph_objects as go
import plotly.express as px
from plotly.subplots import make_subplots

import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output

from wordcloud import WordCloud, STOPWORDS 
import matplotlib.pyplot as plt 
import pandas as pd 

import datetime


# In[2]:


# Load data
external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

df_mental = pd.read_csv("mental.txt", sep =" ")
df_physical = pd.read_csv("physical.txt", sep=" ")
df_socioecon = pd.read_csv("socioeconomic.txt", sep=" ")

df_data = pd.read_csv("template.csv")
df_average = pd.read_csv("average.csv")

now = datetime.datetime.now()


# In[3]:


#df_average.head()


# In[4]:


#Create App
app = dash.Dash(__name__)


# In[5]:


#Create the figure to be shown
figure = go.Figure()


# In[6]:


# #Create Wordcloud

# comment_words = '' 
# stopwords = set(STOPWORDS) 

# count = 0
  
# # iterate through the csv file 
# for df in [df_mental, df_physical, df_socioecon]:
#     count += 1
#     for val in df: 
#         # typecaste each val to string 
#         val = str(val) 


#         # split the value 
#         tokens = val.split() 

#         # Converts each token into lowercase 
#         for i in range(len(tokens)): 
#             tokens[i] = tokens[i].lower() 

#         comment_words += " ".join(tokens)+" "

#     wordcloud = WordCloud(width = 800, height = 800, 
#                     background_color ='white', 
#                     stopwords = stopwords, 
#                     min_font_size = 10).generate(comment_words) 
  
#     # plot the WordCloud image                        
#     plt.figure(facecolor = None) 
#     plt.imshow(wordcloud) 
#     plt.axis("off") 
#     plt.tight_layout(pad = 0)
#     if count == 1:
#         plt.savefig("mental.png")
#     if count == 2:
#         plt.savefig("physical.png")
#     if count == 3:
#         plt.savefig("socioecon.png")


# In[7]:


#Create App Layout
app.layout = html.Div([
    html.Div([
        html.Div([
            html.Img(src=app.get_asset_url('logo.png'))            
        ], style={'display': 'inline-block', 'vertical-align':'middle'}),
        html.Div([
            html.H1("Understanding coronavirus amongst us")
        ], style={'display': 'inline-block', 'vertical-align':'middle'})
    ]),
    html.Div([
        html.Div([
            html.H2("Self-Rated variables against time:"),
            html.Div([
                dcc.Checklist( id = 'variables',
                options=[
                    {'label': 'Sleep Quality', 'value': 'sleep'},
                    {'label': 'Overall Health', 'value': 'health'},
                    {'label': 'Mobility Limitations', 'value': 'mobility'}
                ],
                value=['sleep', 'health'],
                labelStyle={"display":"list-item", 
                            'padding':'7px',
                           'list-style':'none'}
                )
            ]),
            html.H2("Measured variables against time:"),
            html.Div([
            dcc.RadioItems( id = 'radio',
                options=[
                    {'label': 'PROMIS score', 'value': 'PROMIS'},
                    {'label': 'Average Steps per Day', 'value': 'Average Step Count per Day'}
                ],
                value= 'PROMIS',
                labelStyle={"display":"list-item", 
                            'padding':'10px',
                           'list-style':'none'}
                )                  
            ])
        ], style={'width': '28vw', 'display': 'inline-block', 'vertical-align':'top',
                  'margin-left':'20px',
                 'margin-top':'10px'}
        ),
        html.Div([
            dcc.Graph(figure = figure, id = "one")
        ], style={'width': '68vw', 'display': 'inline-block', 'vertical-align':'top'}
        )
    ]),
    html.Div([
        html.Div([
            html.H2("Support Thread - Word Clouds (as of: " + str(now) +")")
        ]),
        html.Div([
            html.Div([
                html.H2("Mental Health"),
                html.Img(src=app.get_asset_url('mental.png'))
            ])
        ], style={'width': '32vw','height':'30vw', 'display': 'inline-block', 'vertical-align':'top'}
        ),
        html.Div([
            html.Div([
                html.H3("Physical Health"),
                html.Img(src=app.get_asset_url('physical.png'))
            ])
        ], style={'width': '32vw','height':'30vw', 'display': 'inline-block', 'vertical-align':'top'}
        ),
        html.Div([
            html.Div([
                html.H3("Socioeconomic Wellbeing"),
                html.Img(src=app.get_asset_url('socioecon.png'))
            ])
        ], style={'width': '32vw','height':'30vw', 'display': 'inline-block', 'vertical-align':'top'}
        )
    ]),
#     html.H3("hello world!", id='test')
])


# In[8]:


#Allow Functionality
@app.callback(
    Output(component_id='one', component_property='figure'),
    [Input(component_id='variables', component_property='value'),
    Input(component_id='radio', component_property = 'value')]
)
def update_figure(check, radio):
    update = make_subplots(specs=[[{"secondary_y": True}]])
    update.add_trace(
        go.Scatter(x=df_data['Survey month'], y=df_data[radio], 
                   mode='markers',
                  marker = dict(color = 'red'),
                   name = radio,
                  showlegend = False),
        secondary_y=False)
    
    update.add_trace(
        go.Scatter(x=df_average['altx'], y=df_average[radio+' average'],mode='lines', line=dict(color='red',width=5),
                  showlegend = True,
                  name = radio),
                secondary_y=False)
# if check:
    if 'sleep' in check:
        update.add_trace(
            go.Scatter(x=df_data['Survey month'], y=df_data['Sleep quality'],
                      mode = 'markers',
                      marker = dict(color = 'orange'),
                        name = 'Sleep Quality',
                      showlegend = False),
            secondary_y=True,
        )
        update.add_trace(
            go.Scatter(x=df_average['altx'], y=df_average['average1'],mode='lines',
                      line = dict(color='orange'), showlegend = True,
                      name = 'Sleep Quality'),
            secondary_y=True,)
    if 'health' in check:
        update.add_trace(
            go.Scatter(x=df_data['Survey month'], y=df_data['Overall Health'],
                      mode = 'markers',
                      marker = dict(color = 'blue'),
                        name = 'Overall Health',
                      showlegend = False),
            secondary_y=True,
        )
        update.add_trace(
            go.Scatter(x=df_average['altx'], y=df_average['average2'],mode='lines',
                      line = dict(color='blue'),
                      showlegend = True,
                      name = 'Overall Health'),
            secondary_y=True,)
    if 'mobility' in check:
        update.add_trace(
            go.Scatter(x=df_data['Survey month'], y=df_data['Mobility Limitations'],
                      mode = 'markers',
                      marker = dict(color = 'green'),
                        name = 'Mobility Limitations',
                      showlegend = False),
            secondary_y=True,
        )
        update.add_trace(
            go.Scatter(x=df_average['altx'], y=df_average['average3'], mode='lines',
                      line = dict(color='green'),
                      showlegend = True,
                      name = 'Mobility Limitations'),
            secondary_y=True,)

    update.update_layout(xaxis_title = 'Report month since positive',
                         title = 'Long-term symptom reports from COVID-19+ patients',
                         template = 'simple_white')
    update.update_yaxes(title_text="<b>"+ str(radio)+"</b> scale", secondary_y=False,)
    update.update_yaxes(title_text="<b>5-point</b> scale", secondary_y=True, range=[0,5])

    return update

# @app.callback(
#     Output(component_id='test', component_property = 'children'),
#     [Input(component_id='variables', component_property = 'value')]
# )
# def update_string(variables):
#     return str(variables)


# In[ ]:


app.run_server(debug=True, use_reloader=False)


# In[ ]:




