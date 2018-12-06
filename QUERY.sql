/*
    01. Selecionar todos os comentários de um post                                                                                   - OK
    02. Listar todos os usuários que curtiram um post                                                                                - OK
    03. Selecionar todos  os murais de um círculo de interesses                                                                      - --
    04. Selecionar todos os posts com pelo menos 3 comentários                                                                       - OK
    05. Selecionar todos os usuários que curtiram um post                                                                            - OK
    06. Selecionar todos os posts salvos por um usuário                                                                              - OK
    07. Selecionar todos os lembretes para o dia seguinte                                                                            - OK
    08. Selecionar o usuário que mais tem posts                                                                                      - OK
    09. Selecionar o usuário com maior número de menções                                                                             - --
    10. Selecionar o post com maior número de menções                                                                                - --
    11. Gerar estatística da quantidade de posts criados no dia anterior                                                             - OK
    12. Selecionar todos os eventos com mais de 4 usuários confirmados                                                               - --
    13. Selecionar todos os comentários de um post por ordem do número de curtidas (do que tem mais curtidas para o que tem menos)   - --
    14. Selecionar a quantidade de curtidas por post.                                                                                - OK
*/

--01
SELECT * FROM comentarios WHERE POSTAGEM_id = 2;

--02
SELECT USUARIOS_usuario FROM curtidas WHERE POSTAGEM_id = 6;

--04
SELECT *, COUNT(POSTAGEM_id) FROM comentarios GROUP BY POSTAGEM_id HAVING COUNT(POSTAGEM_id) > 3;

--05
SELECT * FROM curtidas WHERE POSTAGEM_id = 6;

--06
SELECT postagens.* FROM postagens INNER JOIN post_salvos ON post_salvos.POSTAGEM_id = postagens.id AND post_salvos.USUARIOS_usuario = 'larissacosta9782';

--07
SELECT * FROM lembretes WHERE data = CURRENT_DATE+1;

--08
SELECT usuarios.* FROM usuarios, postagens WHERE usuarios.usuario = postagens.USUARIOS_usuario GROUP BY usuarios.usuario ORDER BY COUNT(postagens.USUARIOS_usuario) DESC LIMIT 1;

--11
SELECT * FROM postagens WHERE data = CURRENT_DATE-1;

--13
--SELECT comentarios.*

--14
SELECT COUNT(*) FROM curtidas WHERE POSTAGEM_id = 7;