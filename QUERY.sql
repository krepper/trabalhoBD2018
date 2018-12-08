/*
    01. Selecionar todos os comentários de um post                                                                                   - OK
    02. Listar todos os usuários que curtiram um post                                                                                - OK
    03. Selecionar todos  os murais de um círculo de interesses                                                                      - OK
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
SELECT * FROM COMENTARIOS WHERE POSTAGEM_id = 2;

--02
SELECT USUARIOS_usuario FROM CURTIDAS WHERE POSTAGEM_id = 6;

--03
SELECT MURAIS.* FROM CIRCULO_INTERESSES as CI, MURAIS WHERE CI.USUARIOS_usuario = 'USUARIO';

--04
SELECT *, COUNT(POSTAGEM_id) FROM COMENTARIOS GROUP BY POSTAGEM_id HAVING COUNT(POSTAGEM_id) > 3;

--05
SELECT * FROM CURTIDAS WHERE POSTAGEM_id = 6;

--06
SELECT POSTAGENS.* FROM POSTAGENS INNER JOIN post_salvos ON post_salvos.POSTAGEM_id = postagens.id AND post_salvos.USUARIOS_usuario = 'USUARIO';

--07
SELECT * FROM LEMBRETES WHERE data = CURRENT_DATE+1;

--08
SELECT USUARIOS.* FROM USUARIOS, POSTAGENS WHERE USUARIOS.usuario = POSTAGENS.USUARIOS_usuario GROUP BY USUARIOS.usuario ORDER BY COUNT(postagens.USUARIOS_usuario) DESC LIMIT 1;

--11
SELECT * FROM POSTAGENS WHERE data = CURRENT_DATE-1;

--13
--SELECT comentarios.*

--14
SELECT COUNT(*) FROM CURTIDAS WHERE POSTAGEM_id = 7;