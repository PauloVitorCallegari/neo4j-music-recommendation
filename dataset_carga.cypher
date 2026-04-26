// 1. Criando Gêneros
MERGE (gPop:Genero {nome: 'Pop'})
MERGE (gRock:Genero {nome: 'Rock'})
MERGE (gEletronica:Genero {nome: 'Eletrônica'})

// 2. Criando Artistas
MERGE (aDua:Artista {nome: 'Dua Lipa'})
MERGE (aArctic:Artista {nome: 'Arctic Monkeys'})
MERGE (aDaft:Artista {nome: 'Daft Punk'})

// 3. Criando Músicas e conectando a Artistas e Gêneros
MERGE (m1:Musica {titulo: 'Levitating', id: 1})
  MERGE (m1)-[:CANTADA_POR]->(aDua)
  MERGE (m1)-[:PERTENCE_AO]->(gPop)

MERGE (m2:Musica {titulo: 'Do I Wanna Know?', id: 2})
  MERGE (m2)-[:CANTADA_POR]->(aArctic)
  MERGE (m2)-[:PERTENCE_AO]->(gRock)

MERGE (m3:Musica {titulo: 'Get Lucky', id: 3})
  MERGE (m3)-[:CANTADA_POR]->(aDaft)
  MERGE (m3)-[:PERTENCE_AO]->(gEletronica)

MERGE (m4:Musica {titulo: 'Starboy', id: 4})
  MERGE (m4)-[:CANTADA_POR]->(aDaft)
  MERGE (m4)-[:PERTENCE_AO]->(gPop)

// 4. Criando Usuários
MERGE (u1:Usuario {nome: 'Lucas', id: 101})
MERGE (u2:Usuario {nome: 'Mariana', id: 102})
MERGE (u3:Usuario {nome: 'Pedro', id: 103})

// 5. Criando Interações (Relacionamentos)
// Lucas
MERGE (u1)-[:OUVIU {reproducoes: 15}]->(m1)
MERGE (u1)-[:CURTIU]->(m1)
MERGE (u1)-[:SEGUE]->(aDua)
MERGE (u1)-[:OUVIU {reproducoes: 5}]->(m4)

// Mariana (Perfil parecido com o Lucas)
MERGE (u2)-[:OUVIU {reproducoes: 20}]->(m1)
MERGE (u2)-[:CURTIU]->(m1)
MERGE (u2)-[:OUVIU {reproducoes: 12}]->(m3)
MERGE (u2)-[:CURTIU]->(m3)

// Pedro
MERGE (u3)-[:OUVIU {reproducoes: 30}]->(m2)
MERGE (u3)-[:CURTIU]->(m2)
MERGE (u3)-[:SEGUE]->(aArctic)