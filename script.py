import random

'''
GERADOR DE COMANDOS SQL
'''

NOMES_MASC = ['Miguel', 'Lucas', 'Guilherme', 'Gabriel', 'Luan', 'Enzo', 'Arthur', 'Rafael', 'Joao', 'Gustavo', 'Pedro', 'Felipe']
NOMES_FEM = ['Beatriz', 'Laura', 'Maria', 'Julia', 'Ana', 'Alice', 'Sofia', 'Maria Eduarda', 'Larissa', 'Mariana', 'Luana']
SOBRENOMES = ['Silva', 'Souza', 'Costa', 'Santos', 'Oliveira', 'Pereira', 'Rodrigues', 'Almeida']

EMAILS = ['gmail.com', 'outlook.com', 'hotmail.com', 'bol.com']

USUARIOS = []
MURAIS = []
POSTAGENS = []
COMENTARIOS = []
CURTIDAS = []
POSTAGENS_SALVAS = []
LEMBRETES = []

def print_letreiro(mensagem):
    print("#=======================================================================")
    print("#"+mensagem)
    print("#=======================================================================")

'''
=======================================================================
                                CRIAR USUARIOS
=======================================================================

QUERY

INSERT INTO usuarios VALUES (usuario, nome, email, senha, sexo, cargo);
'''
#GERAR_USUARIOS = 70

# 1 -> MASC | 0 -> FEM
def gerar_usuario(sexo):
    nomes = None

    if(sexo == 1): 
        nomes = NOMES_MASC
        sexo = "M"
    else:
        nomes = NOMES_FEM
        sexo = "F"

    nome = nomes[random.randint(0, len(nomes)-1)]+" "+SOBRENOMES[random.randint(0, len(SOBRENOMES)-1)]

    usuario = nome.replace(" ","")
    usuario = usuario.lower()
    usuario = usuario+str(random.randint(0, 10000))

    email = usuario+"@"+EMAILS[random.randint(0, len(EMAILS)-1)]

    query = "INSERT INTO usuarios VALUES ('%s', '%s', '%s', '%s', '%s', 'PADRAO');  " % (usuario, nome, email, str(random.randint(0, 999999)),sexo)

    USUARIOS.append(usuario)
    return(query)

def gerar_script_usuarios(quantidade):
    i = 0
    script = ''

    while(i < quantidade):
        try:
            script += gerar_usuario(random.randint(0, 1))
        except:
            quantidade += 1

        i += 1

    return script

'''
=======================================================================
                                CRIAR MURAIS
=======================================================================

QUERY

INSERT INTO murais VALUES (id, nome, USUARIOS_usuario);
'''
def gerar_script_murais(quantidade):
    i = 0
    script = ''

    while(i < quantidade):
        try:
            script += "INSERT INTO murais VALUES (null, 'MURAL GERADO', '%s');  " % (str(USUARIOS[random.randint(0, len(USUARIOS)-1)]))
            MURAIS.append(i)
        except:
            quantidade += 1

        i += 1

    return script

'''
=======================================================================
                                CRIAR POSTAGENS
=======================================================================

QUERY

INSERT INTO postagens VALUES (id, data, mensagem, media, MURAIS_id, USUARIOS_usuario);
CURRENT_TIMESTAMP()
'''
def gerar_script_postagens(quantidade):
    i = 0
    script = ''

    while(i < quantidade):
        try:
            script += "INSERT INTO postagens VALUES (null, CURRENT_TIMESTAMP(), 'POSTAGEM TESTE', 'localhost', %s, '%s');  " % (str(random.randint(1, len(MURAIS))), USUARIOS[random.randint(0, len(USUARIOS)-1)])
            POSTAGENS.append(i)
        except:
            quantidade += 1

        i += 1

    return script

'''
=======================================================================
                                CRIAR POSTAGENS
=======================================================================

QUERY

INSERT INTO comentarios VALUES (id, mensagem, POSTAGEM_id, USUARIOS_usuario);
CURRENT_TIMESTAMP()
'''
def gerar_script_comentarios(quantidade):
    i = 0
    script = ''

    while(i < quantidade):
        try:
            script += "INSERT INTO comentarios VALUES (null, 'COMENTARIO TESTE', %s, '%s');  " % (str(random.randint(1, len(MURAIS))), USUARIOS[random.randint(0, len(USUARIOS)-1)])
        except:
            quantidade += 1

        i += 1

    return script

'''
=======================================================================
                                CRIAR CURTIDAS
=======================================================================

QUERY

INSERT INTO curtidas VALUES (POSTAGEM_id, USUARIOS_usuario);
CURRENT_TIMESTAMP()
'''
def gerar_script_curtidas(quantidade):
    i = 0
    script = ''
    
    while(i < quantidade):
        try:
            combinacao = [random.randint(1, len(POSTAGENS)), USUARIOS[random.randint(0, len(USUARIOS)-1)]]

            if combinacao in CURTIDAS:
                pass
            else:
                script += "INSERT INTO curtidas VALUES (%s, '%s');  " % (int(combinacao[0]), str(combinacao[1]))
                CURTIDAS.append(combinacao)

        except:
            quantidade += 1

        i += 1

    return script

'''
=======================================================================
                        SALVAR POSTAGEM
=======================================================================

QUERY

INSERT INTO post_salvos VALUES (POSTAGEM_id, USUARIOS_usuario);
CURRENT_TIMESTAMP()
'''
def gerar_script_postsalvos(quantidade):
    i = 0
    script = ''
    
    while(i < quantidade):
        try:
            combinacao = [random.randint(1, len(POSTAGENS)), USUARIOS[random.randint(0, len(USUARIOS)-1)]]

            if combinacao in POSTAGENS_SALVAS:
                pass
            else:
                script += "INSERT INTO post_salvos VALUES (%s, '%s');  " % (int(combinacao[0]), str(combinacao[1]))
                POSTAGENS_SALVAS.append(combinacao)

        except:
            quantidade += 1

        i += 1

    return script

'''
=======================================================================
                        CRIAR LEMBRETE
=======================================================================

QUERY

INSERT INTO lembretes VALUES (POSTAGEM_id, USUARIOS_usuario, CURRENT_DATE + 1 );
'''
def gerar_script_lembretes(quantidade):
    i = 0
    script = ''
    
    while(i < quantidade):
        try:
            combinacao = [random.randint(1, len(POSTAGENS)), USUARIOS[random.randint(0, len(USUARIOS)-1)]]

            if combinacao in LEMBRETES:
                pass
            else:
                script += "INSERT INTO lembretes VALUES (%s, '%s', %s);  " % (int(combinacao[0]), str(combinacao[1]), 'CURRENT_DATE+'+str(random.randint(1, 2)))
                LEMBRETES.append(combinacao)

        except:
            quantidade += 1

        i += 1

    return script


print_letreiro("SQL USUARIOS")
print(gerar_script_usuarios(5))
print_letreiro("SQL MURAIS")
print(gerar_script_murais(2))
print_letreiro("SQL POSTAGENS")
print(gerar_script_postagens(10))
print_letreiro("SQL COMENTARIOS")
print(gerar_script_comentarios(15))
print_letreiro("SQL CURTIDAS")
print(gerar_script_curtidas(20))
print_letreiro("SQL POSTAGENS SALVAS")
print(gerar_script_postsalvos(10))
print_letreiro("SQL LEMBRETES")
print(gerar_script_lembretes(5))


