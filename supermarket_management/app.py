from flask import Flask, render_template, request, redirect, url_for, flash, session
import pymysql
from functools import wraps

app = Flask(__name__)
app.secret_key = 'dev_secret_key_123456'
app.config['USER_CREDENTIALS'] = {
    'admin': 'admin'
}

def get_connection():
    return pymysql.connect(
        host='localhost',
        user='root',
        password='123456',
        db='supermarket_management',
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor
    )

def login_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if 'user' not in session:
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        creds = app.config['USER_CREDENTIALS']
        if creds.get(username) == password:
            session['user'] = username
            flash('登录成功', 'success')
            return redirect(url_for('index'))
        else:
            flash('用户名或密码错误', 'danger')
    return render_template('login.html')

@app.route('/logout')
@login_required
def logout():
    session.pop('user', None)
    flash('已登出', 'info')
    return redirect(url_for('login'))

@app.route('/')
@login_required

def index():
     # 按业务归类
     categories = [
       {
         'name': '供应商信息',
         'items': [
           {'name': '供应商信息',            'endpoint': 'show_table',            'arg': '供应商信息'},
           {'name': '供应商信息更改日志',    'endpoint': 'show_table',            'arg': '供应商信息日志'},
         ]
       },
       {
         'name': '商品信息',
         'items': [
           {'name': '商品信息',              'endpoint': 'show_table',            'arg': '商品'},
           {'name': '商品供应信息',          'endpoint': 'show_product_supplier','arg': None},
           {'name': '商品进价日志',          'endpoint': 'show_table',            'arg': '商品进价日志'},
           {'name': '商品售价日志',          'endpoint': 'show_table',            'arg': '商品售价日志'},
         ]
       },
       {
         'name': '库存信息',
         'items': [
           {'name': '库存',                  'endpoint': 'show_inventory_detail',            'arg': None},
           {'name': '入库综合信息',          'endpoint': 'show_inbound_info',     'arg': None},
           {'name': '出库综合信息',          'endpoint': 'show_outbound_info',    'arg': None},
         ]
       },
       {
         'name': '职员信息',
         'items': [
           {'name': '职员',                  'endpoint': 'show_table',            'arg': '职员'},
         ]
       }
     ]
     return render_template('index.html', categories=categories)


@app.route('/table/<table_name>')
@login_required
def show_table(table_name):
    conn = get_connection()
    with conn.cursor() as cursor:
        cursor.execute(f"SELECT * FROM `{table_name}` LIMIT 100")
        rows = cursor.fetchall()
    conn.close()
    return render_template('table.html', table_name=table_name, rows=rows)

@app.route('/product_supplier')
@login_required
def show_product_supplier():
    conn = get_connection()
    with conn.cursor() as cursor:
        cursor.execute("SELECT * FROM 商品供应信息")
        rows = cursor.fetchall()
    conn.close()
    return render_template('table.html', table_name='商品供应信息', rows=rows)

@app.route('/inbound_info')
@login_required
def show_inbound_info():
    conn = get_connection()
    with conn.cursor() as cursor:
        cursor.execute("SELECT * FROM 入库综合信息")
        rows = cursor.fetchall()
    conn.close()
    return render_template('table.html', table_name='入库综合信息', rows=rows)

@app.route('/outbound_info')
@login_required
def show_outbound_info():
    conn = get_connection()
    with conn.cursor() as cursor:
        cursor.execute("SELECT * FROM 出库综合信息")
        rows = cursor.fetchall()
    conn.close()
    return render_template('table.html', table_name='出库综合信息', rows=rows)

@app.route('/add/supplier', methods=['GET', 'POST'])
@login_required
def add_supplier():
    if request.method == 'POST':
        sid = request.form['supplier_id']
        name = request.form['name']
        addr = request.form['address']
        contact = request.form['contact']
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.callproc('sp_add_supplier', [sid, name, addr, contact])
            conn.commit()
            flash('添加供应商成功', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'错误：{e}', 'danger')
        finally:
            conn.close()
    return render_template('add_supplier.html')

@app.route('/delete/supplier', methods=['GET', 'POST'])
@login_required
def delete_supplier():
    if request.method == 'POST':
        sid = request.form['supplier_id']
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.callproc('sp_delete_supplier', [sid])
            conn.commit()
            flash('删除供应商成功', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'错误：{e}', 'danger')
        finally:
            conn.close()
    return render_template('delete_supplier.html')

@app.route('/add/product', methods=['GET', 'POST'])
@login_required
def add_product():
    if request.method == 'POST':
        pid = request.form['product_id']
        name = request.form['name']
        cat = request.form['category']
        price = request.form['price']
        cost = request.form['cost']
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.callproc('sp_add_product', [pid, name, cat, price, cost])
            conn.commit()
            flash('添加商品成功', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'错误：{e}', 'danger')
        finally:
            conn.close()
    return render_template('add_product.html')

@app.route('/delete/product', methods=['GET', 'POST'])
@login_required
def delete_product():
    if request.method == 'POST':
        pid = request.form['product_id']
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.callproc('sp_delete_product', [pid])
            conn.commit()
            flash('删除商品成功', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'错误：{e}', 'danger')
        finally:
            conn.close()
    return render_template('delete_product.html')

@app.route('/inbound', methods=['GET', 'POST'])
@login_required
def inbound():
    if request.method == 'POST':
        eid = request.form['entry_id']
        edate = request.form['entry_date']
        sid = request.form['supplier_id']
        pid = request.form['product_id']
        qty = int(request.form['qty'])
        iid = request.form['inventory_id']
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.callproc('sp_create_inbound', [eid, edate, sid, pid, qty, iid])
            conn.commit()
            flash('入库登记成功', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'错误：{e}', 'danger')
        finally:
            conn.close()
    return render_template('add_inbound.html')

@app.route('/outbound', methods=['GET', 'POST'])
@login_required
def outbound():
    if request.method == 'POST':
        oid = request.form['exit_id']
        odate = request.form['exit_date']
        eid = request.form['employee_id']
        pid = request.form['product_id']
        qty = int(request.form['qty'])
        iid = request.form['inventory_id']
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.callproc('sp_create_outbound', [oid, odate, eid, pid, qty, iid])
            conn.commit()
            flash('出库登记成功', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'错误：{e}', 'danger')
        finally:
            conn.close()
    return render_template('add_outbound.html')

# 添加职员
@app.route('/add/employee', methods=['GET', 'POST'])
@login_required
def add_employee():
    if request.method == 'POST':
        eid = request.form['employee_id']
        name = request.form['name']
        contact = request.form['contact']
        position = request.form['position']
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.callproc('sp_add_employee', [eid, name, contact, position])
            conn.commit()
            flash('添加职员成功', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'错误：{e}', 'danger')
        finally:
            conn.close()
    return render_template('add_employee.html')

# 删除职员
@app.route('/delete/employee', methods=['GET', 'POST'])
@login_required
def delete_employee():
    if request.method == 'POST':
        eid = request.form['employee_id']
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.callproc('sp_delete_employee', [eid])
            conn.commit()
            flash('删除职员成功', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'错误：{e}', 'danger')
        finally:
            conn.close()
    return render_template('delete_employee.html')

@app.route('/update/supplier', methods=['GET','POST'])
@login_required
def update_supplier():
    if request.method == 'POST':
        sid     = request.form['supplier_id']
        name    = request.form['name']
        addr    = request.form['address']
        contact = request.form['contact']
        user    = session.get('user')  # 当前登录用户名
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                cursor.callproc('sp_update_supplier', [sid, name, addr, contact, user])
            conn.commit()
            flash('供应商信息更新成功并已记录日志', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'错误：{e}', 'danger')
        finally:
            conn.close()
    return render_template('update_supplier.html')


# 修改商品售价
@app.route('/update/product_price', methods=['GET','POST'])
@login_required
def update_product_price():
    if request.method == 'POST':
        pid      = request.form['product_id']
        new_price= request.form['new_price']
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                # 调用我们刚才创建的 sp_update_price
                cursor.callproc('sp_update_price', [pid, new_price])
            conn.commit()
            flash('商品售价更新并记录日志成功', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'更新失败：{e}', 'danger')
        finally:
            conn.close()
    return render_template('update_product_price.html')

# 修改商品进价
@app.route('/update/product_cost', methods=['GET','POST'])
@login_required
def update_product_cost():
    if request.method == 'POST':
        pid      = request.form['product_id']
        new_price= request.form['new_price']
        conn = get_connection()
        try:
            with conn.cursor() as cursor:
                # 调用我们刚才创建的 sp_update_price
                cursor.callproc('sp_update_cost', [pid, new_price])
            conn.commit()
            flash('商品进价更新并记录日志成功', 'success')
            return redirect(url_for('index'))
        except Exception as e:
            conn.rollback()
            flash(f'更新失败：{e}', 'danger')
        finally:
            conn.close()
    return render_template('update_product_cost.html')

@app.route('/inventory_detail')
@login_required
def show_inventory_detail():
    conn = get_connection()
    with conn.cursor() as c:
        c.execute("SELECT * FROM 库存详情")
        rows = c.fetchall()
    conn.close()
    return render_template('table.html',
                           table_name='库存详情',
                           rows=rows)


if __name__ == '__main__':
    app.run(debug=True, port=5000)
