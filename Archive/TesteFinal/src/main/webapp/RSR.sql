show databases;
select * from carros;
select * from usuarios;
delete from usuarios where iduser= 9;
 
-- Criação da DataBase utilizada no projeto
use dbrodas_sobre_rodas;

-- Criação da Tabela de Usuários
create table usuarios (
iduser int primary key auto_increment,
nome varchar(50) not null,
email varchar(50) not null,
senha varchar(15) not null,
veiAlugados varchar(1000) not null,
veiDevolvidos varchar(1000) not null,
imagem varchar(1000) not null,
isAdmin varchar (100) not null
);
-- Criação da Tabela de Veículos
create table carros(
idcar int primary key auto_increment,
marca varchar(20) not null,
tipo varchar (20) not null,
modelo varchar(50) not null,
cor varchar(25) not null,
ano varchar(4) not null,
fotoPrin varchar(500) not null,
fotoSec varchar(500), 
descricao varchar(1000) not null,
diaria varchar(20) not null,
avaliacao varchar(1000) not null
);

-- Veiculos Default da DataBase -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Audi', 'Carro', 'Q5', 'Cinza', 2022, 'https://garagem360.com.br/wp-content/uploads/2022/10/audi-q5-sportback-tfsi-e.jpg', 'SUV premium com alta tecnologia e conforto', 'R$320,00', 'Nota Máxima' 
 );
 insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'BMW', 'Carro', 'X3', 'Branco', 2022, 'https://classic.exame.com/wp-content/uploads/2020/10/BMW-X3-30e.jpg?quality=70&strip=info&w=750', 'SUV luxuoso e potente', 'R$340,00', 'Nota Máxima' 
 );
  insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Mercedes-Benz', 'Carro', 'GLC', 'Prata', 2020, 'https://s3.ecompletocarros.dev/images/lojas/108/veiculos/22114/veiculoInfoVeiculoImagesMobile/vehicle_image_1587756581_bcb31e233280e4e227f7e2dc0189cf41.jpeg', 'SUV elegante com interior refinado', 'R$310,00', 'Nota Máxima' 
 );
  insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Porshe', 'Carro', 'Macan', 'Branco', 2022, 'https://revistacarro.com.br/wp-content/uploads/2021/07/Macan-GTS-2022_1.jpg', 'SUV esportivo e sofisticado', 'R$400,00', 'Nota Máxima' 
 );
  insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Ferrari', 'Carro', '488 GTB', 'Amarelo', 2021, 'https://i.pinimg.com/736x/56/f2/5f/56f25f853bcf8edf760adf41074484da.jpg', 'Carro esportivo de alta performance', 'R$1500,00', 'Nota Máxima' 
 );
  insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Lamborghini', 'Carro', 'Huracán', 'Laranja', 2020, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Lamborghini_Huracan_Evo_Genf_2019_1Y7A5452.jpg/1200px-Lamborghini_Huracan_Evo_Genf_2019_1Y7A5452.jpg', 'Carro esportivo com design arrojado', 'R$200,00', 'Nota Máxima' 
 );
  insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Rolls-Royce', 'Carro', 'Phantom', 'Preto', 2023, 'https://s2-autoesporte.glbimg.com/Xap8rBKeSDFuaF18P40glddV1LA=/0x0:620x413/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/q/j/ZX73GLQOShCTPxUP1T4g/2019-11-07-rolls-royce-cullinan-black-bladge-8.jpg', 'Carro de luxo com interior impecável', 'R$5000,00', 'Nota Máxima' 
 );
  insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Aston Martin', 'Carro', 'DB11', 'Prata', 2022, 'https://www.planetcarsz.com/assets/uploads/2017/10/ASTON%20MARTIN%20DB11%20VOLANTE%202019%200045.jpg', 'Carro esportivo com elegância e potência', 'R$1800,00', 'Nota Máxima' 
 );
  insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Maserati', 'Carro', 'Ghibli', 'Azul Escuro', 2021, 'https://parkers-images.bauersecure.com/wp-images/21006/cut-out/930x620/50_maserati_ghibli.jpg', 'Sedan de luxo e com estilo italiano', 'R$900,00', 'Nota Máxima' 
 );
  insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Bugatti', 'Carro', 'Chiron', 'Preto e azul', 2023, 'https://3.bp.blogspot.com/-BrHM7dnjiis/WMGKy0Jms-I/AAAAAAAA4qg/i1TqHff_3SASh_xNfqOFHNoLQjsgcJsZwCLcB/s1600/Bugatti-Chiron%2B%25284%2529.jpg', 'Hipercarro com desempenho incrível', 'R$10000,00', 'Nota Máxima' 
 );
insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Fiat', 'Carro', 'Uno', 'Vermelho', 2020, 'https://cdn.motor1.com/images/mgl/Vo13B/s1/fiat-uno-attractive.webp', 'Carro compacto e econômico', 'R$120,00', 'Nota Máxima' 
 );
   insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Chevrolet', 'Carro', 'Onix', 'Prata', 2021, 'https://cdn.grupolance.com.br/batches/c9/21033/83b5009e040969ee7b60362ad7426573.jpeg', 'Carro popular com bom espaço interno', 'R$130,00', 'Nota Máxima' 
 );
   insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Ford', 'Carro', 'KA', 'Branco', 2019, 'https://cdn.autopapo.com.br/box/uploads/2018/11/22195850/img_2858-732x488.jpg', 'Carro versátil para uso urbano', 'R$125,00', 'Nota Máxima' 
 );
   insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Volkswagen', 'Carro', 'Gol', 'Azul', 2021, 'https://3.bp.blogspot.com/-E9bTQwDB9YQ/Vs9Pd6dm74I/AAAAAAAAud8/TgLfR3PSm3I/s1600/VW-Gol-2017-Connect%2B%25283%2529.jpg', 'Carro tradicional e econômico', 'R$115,00', 'Nota Máxima' 
 );
   insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Renault', 'Carro', 'Kwid', 'Amarelo', 2020, 'https://1.bp.blogspot.com/-jg4mKLmZsWc/YJEt0RU0qwI/AAAAAAAAvXg/7aNRsF4BuL8ZBO3RFNbCP4VEz7ttW1BdQCLcBGAsYHQ/s2048/Novo-Peugeot-208-2022%2B%252820%2529.jpeg', 'Carro pequeno e ágil', 'R$110,00', 'Nota Máxima' 
 );
   insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Hyundai', 'Carro', 'HB20', 'Cinza', 2019, 'https://s2-autoesporte.glbimg.com/d3hiCh4P4j4DASPx5v25-66y26k=/0x0:620x413/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/H/D/jWlqOMSDOqFt2jYw4BPg/2018-05-10-hyundai-hb20-2019-1.jpg', 'Carro com design moderno e confortável', 'R$135,00', 'Nota Máxima' 
 );
   insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Toyota', 'Carro', 'Etios', 'Preto', 2021, 'https://cdn.motor1.com/images/mgl/6XJYk/s1/toyota-lanca-etios-2015-com-novidades-de-acabamento-e-equipamentos-veja-precos.jpg', 'Carro espaçosos e confiável', 'R$140,00', 'Nota Máxima' 
 );
   insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Nissan', 'Carro', 'March', 'Vermelho', 2017, 'https://cdn.motor1.com/images/mgl/LVqZl/s1/nissan-march-e-versa.jpg', 'Carro compacto e econômico', 'R$110,00', 'Nota Máxima' 
 );
   insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Chevrolet', 'Carro', 'Prisma', 'Branco', 2018, 'https://s3.ecompletocarros.dev/images/lojas/209/veiculos/47450/veiculoInfoVeiculoImagesMobile/vehicle_image_1607801841_f869df8e90d1d2f8939ee8e749b7a96f.jpeg', 'Sedan confortável e eficiente', 'R$130,00', 'Nota Máxima' 
 );
   insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Ford', 'Carro', 'Ka+', 'Azul', 2020, 'https://cdn.motor1.com/images/mgl/Zq6qN/s3/ford-ka-2019-antes-e-depois.jpg', 'Sendan compacto e com boa dirigibilidade', 'R$125,00', 'Nota Máxima' 
 );
 -- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Usuários Defult da DataBase ------------------------------------------
 insert into usuarios(
 nome, email, senha, veiAlugados, veiDevolvidos, imagem, isAdmin
 ) values (
 'Kaique', 'kaique@santos.com', '123456', 0, 0, 'ALT', 'false'
 );
  insert into usuarios(
 nome, email, senha, veiAlugados, veiDevolvidos, imagem, isAdmin
 ) values (
 'Kaique-Admin', 'kaiqueAdmin@santos.com', '1234', 0, 0, 'ALT', 'true'
 );
  insert into usuarios(
 nome, email, senha, veiAlugados, veiDevolvidos, imagem, isAdmin
 ) values (
 'Matheus', 'matheus@gabriel.com', '123456', 0, 0, 'ALT', 'false'
 );
  insert into usuarios(
 nome, email, senha, veiAlugados, veiDevolvidos, imagem, isAdmin
 ) values (
 'Matheus-Admin', 'matheusAdmin@gabriel.com', '1234', 0, 0, 'ALT', 'true'
 );
  insert into usuarios(
 nome, email, senha, veiAlugados, veiDevolvidos, imagem, isAdmin
 ) values (
 'Felipe', 'felipe@eca.com', '123456', 0, 0, 'ALT', 'false'
 );
  insert into usuarios(
 nome, email, senha, veiAlugados, veiDevolvidos, imagem, isAdmin
 ) values (
 'Felipe-Admin', 'felipeAdmin@eca.com', '1234', 0, 0, 'ALT', 'true'
 );
 -- ---------------------------------------------------------------------