<%@page contentType="text/html" pageEncoding="UTF-8" import="dvdrental.*,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>CRUD</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Bitter' rel='stylesheet' type='text/css'>

        <link href="data:image/x-icon;base64,AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMmAcDmLBOqNiwTrKYsE6r2LAO5ZiwTl2YcE7lzBgHBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAY8E6d2LAOmwAAAAAMWEdKWLBO7hgvzoUAAAAAAAAAABjwjq4YcA9fAAAAAAAAAAAAAAAAAAAAAAAAAAAYsE62S9eGwkAAAAAAAAAAAAAAAAAAAAAYsE60HHgHUcwYRwSYsE7lWHCOVViwTroAAAAAAAAAAAAAAAAY8E6dy9eGwllxDsrYsE6tWPBO6NkwTpcAAAAAAAAAABiwTqgYcE5hWbCPCkAAAAAYsE7ZGPCOnkAAAAAMmAcDmLAOmwAAAAAYsE6tWLBOr1iwTrjYcA9fzBgIAgAAAAAYsE6pTFhHWNiwTrvAAAAAGLCOmliwDttL10jBWLAPW8AAAAAAAAAAGPBO6NiwTrjYsE67mTAPWgxYR0pAAAAAGLBOqIAAAAAYsM7ejBgGwwAAAAAccA9fmLCOqRiwTrLL10jBQAAAABkwTpcYcA9f2TAPWhjwjqWAAAAAAAAAABjwTrPAAAAAGLBOo9iwTrQYsA61DFhHUhiwjqkYsI6rmPCOrEAAAAAAAAAADBgIAgxYR0pAAAAAAAAAABiwjuOZ8E9JwAAAABr4x0FAAAAACtVKwFiwTr0YsE64GPCOZtjv0ASYcE5ogAAAAAAAAAAAAAAAAAAAABiwjuOYsE6pjFhHVxiwDq7YsE7oGLBOqZiwTt7MWEeMWLBO55iwjp8AAAAADFhHjRiwTrgYsE6dWHBO6FiwTuVYsM7aTJgHS5jwDmOAAAAAAAAAAAAAAAAMWEeR2LCO3RiwTqrY8E7nwAAAAAAAAAAZcI7WGHAOo0AAAAAAAAAAAAAAABiwDq7AAAAAAAAAAAyYB4gAAAAAAAAAABnvEJFYsE7nTFhHTljwTrGYsE6v2LBO15jwTojY8E6lGLBOtMr4x0FYsE7oAAAAAAyYB4gYsA7gmLCOrMAAAAAYcE6aTBgIAgAAAAAYcE6gDFhHVkxYR5KMWEdRAAAAABiwTuLAAAAAGLBOqYAAAAAAAAAAGLCOrNhwj0qMWEdPmPCO4cAAAAAAAAAAAAAAABiwjrdYsI60VvEOSFgwztiYsI7KGLBOpxiwDt8MWEeRwAAAAAAAAAAMWEdPmLBOuAAAAAAAAAAAAAAAAAAAAAAAAAAAGLBOq1jwDqPW8Q6SmLBOqBcxDoqMmAdJGLCO3RnvEJFYcE6aWLBOokAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMmAdEmLBO5xiwTmiY8I4kWLBO55iwTqrYsE7nTBgIAgAAAAAAAAAAAAAAAAAAAAA+F8AAP7vAADfawAA858AAOOvAADjvgAAfaIAAD98AABeRgAA6b4AAHd+AACZZwAAvW0AAM77AADl9wAA+B8AAA==" 
              rel="icon" type="image/x-icon"/> 

        <%!
            private AlunoDAO geraCon() throws Exception {
                try {
                    return new AlunoDAO();
                } catch (Exception ex) {
                    throw new Exception("Erro ao acessar BD!!!");
                }
            }
        %>

        <%!
            private ArrayList<String> getValores(HttpServletRequest request) {
                ArrayList<String> ret = new ArrayList<String>();

                ret.add(request.getParameter("op"));
                ret.add(request.getParameter("fdRa"));
                ret.add(request.getParameter("fdNome"));
                ret.add(request.getParameter("fdCurso"));

                return ret;
            }
        %>

        <script>
            function validate(evt) {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);

                if (!(key >= 0 && key <= 9)) {
                    theEvent.returnValue = false;

                    if (theEvent.preventDefault)
                        theEvent.preventDefault();
                }
            }
        </script> 

        <style>
            .form-style-10{
                width:450px;
                padding:30px;
                margin:40px auto;
                background: #FFF;
                border-radius: 10px;
                -webkit-border-radius:10px;
                -moz-border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
                -moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
                -webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
            }
            .form-style-10 .inner-wrap{
                padding: 30px;
                background: #F8F8F8;
                border-radius: 6px;
                margin-bottom: 15px;
            }
            .form-style-10 h1{
                background: #596977;
                padding: 20px 30px 15px 30px;
                margin: -30px -30px 30px -30px;
                border-radius: 10px 10px 0 0;
                -webkit-border-radius: 10px 10px 0 0;
                -moz-border-radius: 10px 10px 0 0;
                color: #fff;
                text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
                font: normal 30px 'Bitter', serif;
                -moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
                -webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
                box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
                border: 1px solid #c4e5ff;
            }
            .form-style-10 h1 > span{
                display: block;
                margin-top: 2px;
                font: 13px Arial, Helvetica, sans-serif;
            }
            .form-style-10 label{
                display: block;
                font: 13px Arial, Helvetica, sans-serif;
                color: #888;
                margin-bottom: 15px;
            }
            .form-style-10 input[type="text"],
            .form-style-10 input[type="date"],
            .form-style-10 input[type="datetime"],
            .form-style-10 input[type="email"],
            .form-style-10 input[type="number"],
            .form-style-10 input[type="search"],
            .form-style-10 input[type="time"],
            .form-style-10 input[type="url"],
            .form-style-10 input[type="password"],
            .form-style-10 textarea,
            .form-style-10 select {
                display: block;
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                width: 100%;
                padding: 8px;
                border-radius: 6px;
                -webkit-border-radius:6px;
                -moz-border-radius:6px;
                border: 2px solid #fff;
                box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
                -moz-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
                -webkit-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
            }

            .form-style-10 .section{
                font: normal 20px 'Bitter', serif;
                color: #596977;
                margin-bottom: 5px;
            }
            .form-style-10 .section span {
                background: #596977;
                padding: 5px 10px 5px 10px;
                position: absolute;
                border-radius: 50%;
                -webkit-border-radius: 50%;
                -moz-border-radius: 50%;
                border: 4px solid #fff;
                font-size: 14px;
                margin-left: -45px;
                color: #fff;
                margin-top: -3px;
            }
            .form-style-10 input[type="button"], 
            .form-style-10 input[type="submit"]{
                background: #596977;
                padding: 8px 20px 8px 20px;
                border-radius: 5px;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                color: #fff;
                text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
                font: normal 30px 'Bitter', serif;
                -moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
                -webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
                box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
                border: 1px solid #c4e5ff;
                font-size: 15px;
            }
            .form-style-10 input[type="button"]:hover, 
            .form-style-10 input[type="submit"]:hover{
                background: #2A6881;
                -moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
                -webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
                box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
            }
            .form-style-10 .privacy-policy{
                float: right;
                width: 250px;
                font: 12px Arial, Helvetica, sans-serif;
                color: #4D4D4D;
                margin-top: 10px;
                text-align: right;
            }
        </style>
    </head>

    <body>
        <div class="form-style-10">
            <h1>Crud Aluno</h1>
            <form method="post">
                <div class="section"><span>1</span>Preencha os campos</div>
                <div class="inner-wrap">
                    <label>RA: <input type="text" name="fdRa" onkeypress="validate(event)"/></label>

                    <label>Nome: <input type="text" name="fdNome"/></label>

                    <label>Curso: <input type="text" name="fdCurso"/></label>
                </div>               

                <div class="section"><span>2</span>Selecione a operação</div>
                <div class="buttonform-style-10">      

                    <select name="op">
                        <option value="1">Incluir</option>
                        <option value="2">Excluir</option>
                        <option value="3">Alterar</option>
                        <option value="4">Exibir</option>
                    </select>

                    <br><br>

                    <input type="submit" value="Realizar operação" />

                    <br><br>

                    <label>
                        <%
                            try {
                                ArrayList<String> valores = getValores(request);

                                if (valores.size() == 4) {
                                    if (valores.get(0) != null && !valores.get(0).isEmpty()) {
                                        try {
                                            int op = new Integer(valores.get(0));

                                            try {
                                                AlunoDAO alunoDAO = geraCon();

                                                switch (op) {
                                                    case 1://Incluir
                                                        if (valores.get(1) == null || valores.get(1).equals("")) {
                                                            out.println("RA vazio!!!");
                                                            break;
                                                        } else if (valores.get(2) == null || valores.get(2).equals("")) {
                                                            out.println("Nome vazio!!!");
                                                            break;
                                                        } else if (valores.get(3) == null || valores.get(3).equals("")) {
                                                            out.println("Curso vazio!!!");
                                                            break;
                                                        }

                                                        try {
                                                            int ra = new Integer(valores.get(1));

                                                            try {
                                                                alunoDAO.insere(new Aluno(ra, valores.get(2), valores.get(3)));

                                                                out.println("Aluno inserido com sucesso!!!");
                                                            } catch (Exception ex) {
                                                                out.println("Erro ao inserir Aluno!!!");
                                                            }
                                                        } catch (Exception ex) {
                                                            out.println("RA inválido!!!");
                                                        }
                                                        break;

                                                    case 2://Excluir
                                                        if (valores.get(1) == null || valores.get(1).equals("")) {
                                                            out.println("RA vazio!!!");
                                                            break;
                                                        }

                                                        try {
                                                            int ra = new Integer(valores.get(1));

                                                            try {
                                                                alunoDAO.excluiAlunoByRA(ra);

                                                                out.println("Aluno de RA " + ra + " excluido com sucesso!!!");
                                                            } catch (Exception ex) {
                                                                out.println("Erro ao excluir Aluno!!!");
                                                            }
                                                        } catch (Exception ex) {
                                                            out.println("RA inválido!!!");
                                                        }
                                                        break;

                                                    case 3://Alterar
                                                        if (valores.get(1) == null || valores.get(1).equals("")) {
                                                            out.println("RA vazio!!!");
                                                            break;
                                                        } else if (valores.get(2) == null || valores.get(2).equals("")) {
                                                            out.println("Nome vazio!!!");
                                                            break;
                                                        } else if (valores.get(3) == null || valores.get(3).equals("")) {
                                                            out.println("Curso vazio!!!");
                                                            break;
                                                        }

                                                        try {
                                                            int ra = new Integer(valores.get(1));

                                                            try {
                                                                alunoDAO.altera(new Aluno(ra, valores.get(2), valores.get(3)));

                                                                out.println("Aluno alterado com sucesso!!!");
                                                            } catch (Exception ex) {
                                                                out.println("Erro ao inserir Aluno!!!");
                                                            }
                                                        } catch (Exception ex) {
                                                            out.println("RA inválido!!!");
                                                        }
                                                        break;

                                                    case 4://Exibir
                                                        if (valores.get(1) == null || valores.get(1).equals("")) {
                                                            out.println("RA vazio!!!");
                                                            break;
                                                        }

                                                        try {
                                                            int ra = new Integer(valores.get(1));

                                                            try {
                                                                Aluno aluno = alunoDAO.getAlunoByRA(ra);

                                                                out.println("RA: " + aluno.getRa());
                        %><br><%
                            out.println("Nome: " + aluno.getNome());
                        %><br><%
                                                                out.println("Curso: " + aluno.getCurso());
                                                            } catch (Exception ex) {
                                                                out.println("Erro ao recuperar Aluno!!!");
                                                            }
                                                        } catch (Exception ex) {
                                                            out.println("RA inválido!!!");
                                                        }
                                                        break;

                                                    default:
                                                        out.println("Operação inválida!!!");
                                                        break;
                                                }
                                            } catch (Exception ex) {
                                                out.println(ex.getMessage());
                                                return;
                                            }
                                        } catch (Exception ex) {
                                            out.println("Operação inválida!!!");
                                        }
                                    }
                                } else {
                                    out.println("Parâmetros inválidos!!!");
                                }
                            } catch (Exception ex) {
                                out.println("Parâmetros inválidos!!!");
                            }
                        %>
                    </label>
                </div>
            </form>
        </div>
    </body>
</html>
