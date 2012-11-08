#!/usr/bin/env python

#from google.appengine.ext.webapp.util import run_wsgi_app
import os
import webapp2
import jinja2
from google.appengine.ext import db

template_dir = os.path.join(os.path.dirname(__file__),'..', '..', 'templates')
jinja_env = jinja2.Environment(autoescape=True,
    loader=jinja2.FileSystemLoader(template_dir))

class Handler(webapp2.RequestHandler):
    def write(self, *a, **kw):
        self.response.out.write(*a, **kw)
        
    def render_str(self, template, **params):
        t = jinja_env.get_template(template)
        return t.render(params)

    def render(self, template, **kw):
        self.write(self.render_str(template, **kw))

class Blog(db.Model):
    subject = db.StringProperty(required = True)
    body =  db.TextProperty(required = True) #text allows for longer than 500 chars
    created = db.DateTimeProperty(auto_now_add = True)
    
class NewPost(Handler):
    def render_blog(self, subject='', body='', error=''):
        posts = db.GqlQuery("SELECT * "
                           "FROM Blog")
                           #"ORDER BY created DESC")        
        self.render('blog.html', subject=subject, body=body, error=error, posts=posts)        
    def get(self):        
        self.render_blog()
    def post(self):
        subject = self.request.get('subject')
        body = self.request.get('body')

        if subject and body:
            blog = Blog(subject = subject, body = body)
            b_key = blog.put() # Key('Blog', id)      

            #blog.put()

            self.redirect("/cs253/unit3/blog/%d" % b_key.id())
        else:
            error = 'there was an error'
            self.render_front(subject = subject, body = body, error = error)

class Permalink(NewPost):
        def get(self, blog_id):
            s = Blog.get_by_id(int(blog_id))
            self.render("blog.html", posts=[s])
                        
        
                

