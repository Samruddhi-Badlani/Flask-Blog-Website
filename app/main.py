
from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
import json
import os
import math
from datetime import date, datetime

from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user





from sqlalchemy.sql.elements import Null

app = Flask(__name__)
local_server = False
params={
        "local_server":"True",
        "local_uri":"postgresql://postgres:root@localhost:5432/blogapp",
        "prod_uri":"postgresql://fdgzcmqclwmihe:4cbb4d1e9b93cdb6accf6969587fd733663f055e5dd92b62e336c29608e7d64a@ec2-3-213-76-170.compute-1.amazonaws.com:5432/dbm28fbdipl0gk",
        "hackerrank_uri":"https://www.hackerrank.com/samruddhi_09",
        "github_uri":"https://github.com/Samruddhi-Badlani",
        "linkedin_uri":"https://www.linkedin.com/in/samruddhi-badlani-872262193/",
        "no_of_posts":2,
        "blog_name":"Samruddhi's Blog Channel",
        "admin_email":"admin_email_id_here@gmail.com",
        "admin_pass":"admin_password_here",
        "upload_location" :"your_upload_location"
       
    }
app.config['UPLOAD_LOCATION'] =params['upload_location'];
app.secret_key = 'super-secret-key'
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'userLogin'
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri'];
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri'];

db = SQLAlchemy(app)

class Contacts(db.Model):

    '''
    serial_no
    name
    email
    phone_no
    message
    date
    '''
    serial_no = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False)
    email = db.Column(db.String(300), nullable=False)
    phone_no = db.Column(db.String(20),nullable = False)
    message = db.Column(db.String(65536),nullable = False)
    date = db.Column(db.Date,nullable = True)

    def __repr__(self):
        return '<User %r>' % self.name

class User(UserMixin,db.Model):
    id = db.Column(db.Integer,primary_key = True)
    username = db.Column(db.String(65000),nullable =  False)
    useremail = db.Column(db.String(65000),nullable= False,unique=True)
    userpassword = db.Column(db.String(65000),nullable = False)

    def __repr__(self):
        return '<User %r>' % self.useremail

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


class Post(db.Model):

    '''
    post_id
    title
    content
    By
    slug
    Date
    img_file
    '''
    post_id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(520), nullable=False)
    content = db.Column(db.String(65000), nullable=False)
    by = db.Column(db.String(100),nullable = False)
    slug = db.Column(db.String(200),nullable = False)
    date = db.Column(db.Date,nullable = True)
    img_file = db.Column(db.String(300),nullable = False)
    tagline = db.Column(db.String(300),nullable = False)

    def __repr__(self):
        return '<User %r>' % self.title



@app.route("/")
def index():
    posts = Post.query.filter_by().all();
    last = math.ceil(len(posts)/int(params["no_of_posts"]));
    

    page = request.args.get('page');
    if(not str(page).isnumeric()):
        page = 1;

    page = int(page);
    
    posts = posts[(page-1)*int(params["no_of_posts"]):(page-1)*int(params["no_of_posts"]) + int(params["no_of_posts"]) ]
    if(page == 1):
        prev = "#";
        next = "?page=" + str(page+1);
    
    elif page == last:
        next = "#";
        prev = "?page=" + str(page-1);
    else:
        prev = "?page=" + str(page-1);
        next = "?page=" + str(page+1);

    
    return render_template('index.html',params=params,posts=posts,next = next,prev=prev);
@app.route("/home")
def home():
    posts = Post.query.filter_by().all();
    last = math.ceil(len(posts)/int(params["no_of_posts"]));
    

    page = request.args.get('page');
    if(not str(page).isnumeric()):
        page = 1;

    page = int(page);
    
    posts = posts[(page-1)*int(params["no_of_posts"]):(page-1)*int(params["no_of_posts"]) + int(params["no_of_posts"]) ]
    if(page == 1):
        prev = "#";
        next = "?page=" + str(page+1);
    
    elif page == last:
        next = "#";
        prev = "?page=" + str(page-1);
    else:
        prev = "?page=" + str(page-1);
        next = "?page=" + str(page+1);

    
    return render_template('index.html',params=params,posts=posts,next = next,prev=prev);

@app.route("/about")
def about():
    
    return render_template('about.html',params=params);

@app.route("/contact",methods = ['GET','POST'])
def contact():

    success_msg = Null;    
    if(request.method == 'POST'):
        # Add entry to the database 
        name = request.form.get('name');
        email = request.form.get('email');    
        phone_no = request.form.get('phone_no');
        message = request.form.get('message');

        

        entry = Contacts(name = name,email = email,phone_no = phone_no,message= message,date = datetime.now())

        db.session.add(entry);
        db.session.commit();

        success_msg = "Your message is sent successfully"
    
    else:
        success_msg = None;

        


    
    return render_template('contact.html',success_msg = success_msg,params=params);

@app.route("/post/<string:post_slug>",methods=['GET'])
@login_required
def post(post_slug):
    
    my_post = Post.query.filter_by(slug=post_slug).first();
    
    return render_template('post.html',params=params,post=my_post);


@app.route("/dashboard",methods=['GET','POST'])
def dashboard():

    if 'user' in session and session['user'] == params['admin_email']:
        posts = Post.query.all();
        return render_template('dashboard.html',params=params,posts=posts);

    if(request.method == 'POST'):
        # Redirect to admin handle
        user_email = request.form.get('uemail');
        user_pass = request.form.get('upass');

        if(user_email == params['admin_email'] and user_pass == params["admin_pass"]):
            # set session variable 
            session['user'] = user_email;
            posts = Post.query.all();
            return render_template('dashboard.html',params=params,posts=posts);
        else:
            return render_template("login.html",params=params)

    else:
        return render_template("login.html",params=params)
    


# Edit routing
@app.route("/edit/<string:post_id>",methods=['GET','POST'])
def edit(post_id):
    success_msg = None;
    if 'user' in session and session['user'] == params['admin_email']:
        if request.method == 'POST':
            box_title = request.form.get('title');
            box_tagline = request.form.get('tagline');
            box_slug = request.form.get('slug');
            box_content = request.form.get('content');
            box_img_file = request.form.get('img_file');
            box_by = request.form.get('By');
            box_date = request.form.get('Date');

            if post_id != '0':
                post = Post.query.filter_by(post_id = post_id).first();
                post.title = box_title;
                post.tagline = box_tagline;
                post.slug = box_slug;
                post.content = box_content;
                post.img_file = box_img_file;
                post.by = box_by;
                post.date = box_date

                db.session.commit();

            
                success_msg = 'Post edited successfully'
            else:
                post = Post(title = box_title,tagline = box_tagline,slug = box_slug,content=box_content,img_file=box_img_file,by=box_by,date=box_date);
                db.session.add(post);
                db.session.commit();
                success_msg = 'Post Added successfully'
             
           
        posts = Post.query.all();
        post = Post.query.filter_by(post_id = post_id).first();
        return render_template('edit.html',params=params,posts=posts,post_id=post_id,success_msg = success_msg,post= post)


# @app.route("/uploader",methods=['GET','POST'])
# def uploader():
#     if 'user' in session and session['user'] == params['admin_email']:
#         if request.method == "POST":
#             myFile = request.files['myFile'];
#             myFile.save(os.path.join(app.config['UPLOAD_LOCATION'],secure_filename(myFile.filename)))
#         return "Uploaded successfully"


@app.route("/logout",methods=['GET','POST'])
def logout():
    session.pop('user')
    return redirect('/dashboard');

@app.route('/userRegister', methods=['GET', 'POST'])
def userRegister():
    if request.method == "POST":
        useremail = request.form.get('useremail');
        userpassword = request.form.get('userpassword');
        confirm_password = request.form.get('userpassword2');
        username = request.form.get('username')

    # if form.validate_on_submit():
        hashed_password = generate_password_hash(userpassword, method='sha256')
        new_user = User(username=username,useremail=useremail, userpassword=hashed_password)
        db.session.add(new_user)
        db.session.commit()
        return redirect('userDashboard');
    else:

    #     return '<h1>New user has been created!</h1>'
        #return '<h1>' + form.username.data + ' ' + form.email.data + ' ' + form.password.data + '</h1>'
        return render_template('userRegister.html', params=params)

@app.route('/userLogin', methods=['GET', 'POST'])
def userLogin():
    if request.method == "POST":
        failure_message=None
        useremail = request.form.get('useremail');
        userpassword = request.form.get('userpassword'); 
        user = User.query.filter_by(useremail = useremail).first()
        print("hello this is what ",user)
        if user:
            if check_password_hash(user.userpassword, userpassword):
                login_user(user)
                return redirect('userDashboard')
            else:
                failure_message = "Invalid password or email"
                user = user
                return render_template('userLogin.html',failure_message=failure_message,user=user,email=useremail,password=userpassword)

        else:
            failure_message = "Invalid password or email"
            return render_template('userLogin.html',failure_message=failure_message,user=user,email=useremail,password=userpassword)

    # return '<h1>Invalid username or password</h1>'
        #return '<h1>' + form.username.data + ' ' + form.password.data + '</h1>'
    else:
        if current_user.is_authenticated:
            return redirect('userDashboard');
        else:
            return render_template('userLogin.html',params=params)

@app.route("/delete/<string:post_id>",methods=['GET','POST'])
def delete(post_id):
    if 'user' in session and session['user'] == params['admin_email']:
        post = Post.query.filter_by(post_id=post_id).first();
        db.session.delete(post);
        db.session.commit();
        return redirect('/dashboard');
@app.route("/userDashboard",methods=['GET','POST'])
@login_required
def userDashboard():
    posts = Post.query.filter_by().all();
    last = math.ceil(len(posts)/int(params["no_of_posts"]));
    

    page = request.args.get('page');
    if(not str(page).isnumeric()):
        page = 1;

    page = int(page);
    
    posts = posts[(page-1)*int(params["no_of_posts"]):(page-1)*int(params["no_of_posts"]) + int(params["no_of_posts"]) ]
    if(page == 1):
        prev = "#";
        next = "?page=" + str(page+1);
    
    elif page == last:
        next = "#";
        prev = "?page=" + str(page-1);
    else:
        prev = "?page=" + str(page-1);
        next = "?page=" + str(page+1);

    
    return render_template('userDashboard.html',params=params,posts=posts,next = next,prev=prev);



@app.route("/userProfile",methods=['GET','POST'])
@login_required
def userProfile():
    return render_template('userProfile.html',params=params,user=current_user);

@app.route('/userLogout')
@login_required
def userLogout():
    logout_user()
    return redirect('/home')