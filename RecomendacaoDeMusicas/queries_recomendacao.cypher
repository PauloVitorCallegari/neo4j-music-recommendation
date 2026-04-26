
// A. Recomendação Baseada em Filtro Colaborativo (Quem curtiu isso, também curtiu...)
// Recomenda músicas para o "Lucas" com base no que outros usuários com gostos semelhantes (que curtiram as mesmas músicas) estão ouvindo.
MATCH (u:Usuario {nome: 'Lucas'})-[:CURTIU]->(m:Musica)<-[:CURTIU]-(outroUsuario:Usuario)
MATCH (outroUsuario)-[:CURTIU]->(musicaRecomendada:Musica)
WHERE NOT (u)-[:CURTIU]->(musicaRecomendada)
RETURN musicaRecomendada.titulo AS Recomendacao, count(*) AS ForcaDaRecomendacao
ORDER BY ForcaDaRecomendacao DESC




// B. Recomendação Baseada em Conteúdo (Artistas Seguidos)
// Recomenda músicas cantadas pelos artistas que o usuário segue, mas que ele ainda não ouviu.
MATCH (u:Usuario {nome: 'Lucas'})-[:SEGUE]->(a:Artista)<-[:CANTADA_POR]-(m:Musica)
WHERE NOT (u)-[:OUVIU]->(m)
RETURN m.titulo AS Recomendacao, a.nome AS Artista




// C. Top Músicas por Gênero Favorito
// Descobre qual o gênero musical que o usuário mais escuta (somando as reproduções) e recomenda a música mais popular daquele gênero que ele ainda não curtiu.	
MATCH (u:Usuario {nome: 'Lucas'})-[o:OUVIU]->(m:Musica)-[:PERTENCE_AO]->(g:Genero)
WITH u, g, sum(o.reproducoes) AS totalReproducoes
ORDER BY totalReproducoes DESC LIMIT 1
MATCH (g)<-[:PERTENCE_AO]-(novaMusica:Musica)
WHERE NOT (u)-[:CURTIU]->(novaMusica)
RETURN novaMusica.titulo AS Recomendacao, g.nome AS GeneroFavorito