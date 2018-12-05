/*
    01. Selecionar todos os comentários de um post - OK
    02. Listar todos os usuários que curtiram um post - OK
    03. Selecionar todos  os murais de um círculo de interesses
    04. Selecionar todos os posts com pelo menos 3 comentários OK
    05. Selecionar todos os usuários que curtiram um post - OK
    06. Selecionar todos os posts salvos por um usuário
    07. Selecionar todos os lembretes para o dia seguinte
    08. Selecionar o usuário que mais tem posts
    09. Selecionar o usuário com maior número de menções
    10. Selecionar o post com maior número de menções
    11. Gerar estatística da quantidade de posts criados no dia anterior
    12. Selecionar todos os eventos com mais de 4 usuários confirmados
    13. Selecionar todos os comentários de um post por ordem do número de curtidas (do que tem mais curtidas para o que tem menos)
    14. Selecionar a quantidade de curtidas por post.
*/

--01
SELECT * FROM comentarios WHERE POSTAGEM_id = 2;

--02
SELECT USUARIOS_usuario FROM curtidas WHERE POSTAGEM_id = 6;

--04
SELECT *, COUNT(POSTAGEM_id) FROM comentarios GROUP BY POSTAGEM_id HAVING COUNT(POSTAGEM_id) > 3

--05
SELECT * FROM curtidas WHERE POSTAGEM_id = 6;
