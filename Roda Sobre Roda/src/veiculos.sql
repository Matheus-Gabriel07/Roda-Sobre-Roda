show databases;
create database dbrodas_sobre_rodas; 
use dbrodas_sobre_rodas;
select * from veiculos;
create table usuarios (
iduser int primary key auto_increment,
nome varchar(50) not null,
email varchar(50) not null,
senha varchar(15) not null,
veiAlugados varchar(1000) not null,
veiDevolvidos varchar(1000) not null,
imagem varchar(1000) not null
);
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
use dbrodas_sobre_rodas;
select * from carros;

insert into carros (
 marca, tipo, modelo, cor, ano, fotoPrin, descricao, diaria, avaliacao
 ) values (
 'Fiat', 'Carro', 'FastBack', 'Vermelho', 2022, 'https://cdn.motor1.com/images/mgl/QErpZ/s3/2020-bmw-x6-m-competition.jpg', 'Bom dia, Bom Teste', 'R$100,00', 'Nota Máxima' 
 );
 
 delete from carros where idcar=2;
 
 Select * from carros order by marca;
