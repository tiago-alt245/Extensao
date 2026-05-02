# Script para leitura de bancos de dados diversos para geração de um data frame de uma única linha referente as informações do estado do aluno

# Ao receber este script esqueleto colocá-lo no repositório LOCAL Extensao, que deve ter sido clonado do GitHub
# Enviar o script esqueleto para o repositório REMOTO com o nome extensao-esqueleto.R

# Para realizar as tarefas da ETAPA 1, ABRIR ANTES uma branch de nome SINASC no main de Extensao e ir para ela
# Após os alunos concluírem a ETAPA 1 a professora orientará fazer o merge into main e depois abrir outro branch. Aguarde...


####################################
# ETAPA 1: BANCO DE DADOS DO SINASC
####################################

# A ALTERAÇÃO DO SCRIPT ESQUELETO - ETAPA 1 - DEVERÁ SER FEITA DENTRO DA BRANCH SINASC

# Tarefa 1. Leitura do banco de dados do SINASC 2015  com 3017668 linhas e 61 colunas
# verificar se a leitura foi feita corretamente e a estrutura dos dados
# nomeie o banco de dados como dados_sinasc
dados_sinasc = read.csv2("SINASC_2015.csv" , header = TRUE , sep = ";")

# Tarefa 2. Reduzir dados_sinasc apenas para as colunas que serão utilizadas, nomeando este novo banco de dados como dados_sinasc_1
# as colunas serão 1, 4, 5, 6, 7, 12, 13, 14, 15, 19, 21, 22, 23, 24, 35, 38, 44, 46, 48, 59, 60, 61
# nomes das respectivas variáveis: CONTADOR, CODMUNNASC, LOCNASC, IDADEMAE, ESTCIVMAE, CODMUNRES, GESTACAO, GRAVIDEZ, PARTO,
# SEXO, APGAR5, RACACOR, PESO, IDANOMAL, ESCMAE2010, RACACORMAE, SEMAGESTAC, CONSPRENAT, TPAPRESENT, TPROBSON, PARIDADE, KOTELCHUCK
dados_sinasc_1 =  dados_sinasc[,  c(1,4,5,6,7,12,13,14,15,19,21,22,23,24,35,38,44,46,48,59,60,61)]

# Tarefa 3. Reduzir dados_sinasc_1 apenas para o estado que o aluno irá trabalhar (utilizar os dois primeiros dígitos de CODMUNRES), nomeando este novo banco de dados como dados_sinasc_2
# Códigos das UF: 11: RO, 12: AC, 13: AM, 14: RR, 15: PA, 16: AP, 17: TO, 21: MA, 22: PI, 23: CE, 24: RN
# 25: PB, 26: PE, 27: AL, 28: SE, 29: BA, 31: MG, 32: ES, 33: RJ, 35: SP, 41: PR, 42: SC, 43: RS
# 50: MS, 51: MT, 52: GO, 53: DF 
UF = substr(as.character(dados_sinasc_1$CODMUNRES), 1, 2)
dados_sinasc_2 = dados_sinasc_1[UF == "25",]
# observar abaixo o número de nascimentos por UF de residência para certificar-se que seu banco de dados está correto
# 11: 27918     12: 16980     13: 80097     14: 11409     15: 143657    16: 15750      17: 25110
# 21: 117564    22: 49253     23: 132516    24: 49099     25: 59089     26: 145024     27: 52257     28: 34917     29: 206655
# 31: 268305    32: 56941     33: 236960    35: 634026     
# 41: 160947    42: 97223     43: 148359
# 50: 44142     51: 56673     52: 100672    53: 46122 

# Exportar o arquivo com o nome dados_sinasc_2.csv
# Ao concluir a Tarefa 3 da Etapa 1 commite e envie para o repositório REMOTO o script e dados_sinasc_2.csv com o comentário "Dados do estado UF (coloque o nome da UF) e script de sua obtenção"
write.csv(dados_sinasc_2, "dados_sinasc2.csv")


# Tarefa 4. Verificar em dados_sinasc_2 a frequência das categorias das seguintes variáveis: LOCNASC, ESTCIVMAE, GESTACAO, GRAVIDEZ, PARTO,
# SEXO, APGAR5, RACACOR, IDANOMAL, ESCMAE2010, RACACORMAE, TPAPRESENT, TPROBSON, PARIDADE, KOTELCHUCK
table(dados_sinasc_2$LOCNASC)
table(dados_sinasc_2$CONTADOR)
table(dados_sinasc_2$CODMUNNASC)
table(dados_sinasc_2$IDADEMAE)
table(dados_sinasc_2$ESTCIVMAE)
table(dados_sinasc_2$CODMUNRES)
table(dados_sinasc_2$GESTACAO)
table(dados_sinasc_2$GRAVIDEZ)
table(dados_sinasc_2$PARTO)
table(dados_sinasc_2$SEXO)
table(dados_sinasc_2$APGAR5)
table(dados_sinasc_2$RACACOR)
table(dados_sinasc_2$PESO)
table(dados_sinasc_2$IDANOMAL)
table(dados_sinasc_2$ESCMAE2010)
table(dados_sinasc_2$RACACORMAE)
table(dados_sinasc_2$SEMAGESTAC)
table(dados_sinasc_2$CONSPRENAT)
table(dados_sinasc_2$TPAPRESENT)
table(dados_sinasc_2$TPROBSON)
table(dados_sinasc_2$PARIDADE)
table(dados_sinasc_2$KOTELCHUCK)

# Tarefa 5. Atribuir para cada variável de dados_sinasc_2 como sendo NA a categoria de "Não informado ou Ignorado", geralmente com código 9
# KOTELCHUCK = 9 significa "não informado"   TPROBSON = 11 significa "não classificado por falta de informação"
# veja o dicionário do SINASC para identificar qual o código das categorias de cada variável
# Em variáveis quantitativas como IDADEMAE, APGAR5 e PESO e SEMAGESTAC verificar se existem valores como 99 para NA
unique(dados_sinasc_2$LOCNASC)
unique(dados_sinasc_2$IDADEMAE)
unique(dados_sinasc_2$ESTCIVMAE)
unique(dados_sinasc_2$CODMUNRES)
unique(dados_sinasc_2$GESTACAO)
unique(dados_sinasc_2$APGAR5)
unique(dados_sinasc_2$RACACOR)
unique(dados_sinasc_2$PESO)
unique(dados_sinasc_2$CONSPRENAT)
unique(dados_sinasc_2$PARIDADE)
dados_sinasc_2$CONSPRENAT[dados_sinasc_2$CONSPRENAT == 99] = NA
dados_sinasc_2$APGAR5[dados_sinasc_2$APGAR5 == 99] = NA
dados_sinasc_2$ESTCIVMAE[dados_sinasc_2$ESTCIVMAE == 9] = NA
dados_sinasc_2$GESTACAO[dados_sinasc_2$GESTACAO == 9] = NA
dados_sinasc_2$GRAVIDEZ[dados_sinasc_2$GRAVIDEZ == 9] = NA
dados_sinasc_2$PARTO[dados_sinasc_2$PARTO == 9] = NA
dados_sinasc_2$SEXO[dados_sinasc_2$SEXO == 0] = NA
dados_sinasc_2$IDANOMAL[dados_sinasc_2$IDANOMAL == 9] = NA
dados_sinasc_2$ESCMAE2010[dados_sinasc_2$ESCMAE2010 == 9] = NA
dados_sinasc_2$TPAPRESENT[dados_sinasc_2$TPAPRESENT == 9] = NA
dados_sinasc_2$TPROBSON[dados_sinasc_2$TPROBSON == 11] = NA
dados_sinasc_2$KOTELCHUCK[dados_sinasc_2$KOTELCHUCK == 9] = NA

# Tarefa 6. Atribuir legendas para as categorias das variáveis investigadas na etapa 4.
# Exemplo: dados_sinasc_2$KOTELCHUCK = factor(dados_sinasc_2$KOTELCHUCK, levels = c(1,2,3,4,5), 
# labels = c("Não realizou pré-natal", "Inadequado", "Intermediário", "Adequado",  
# "Mais que adequado")

# ATENçÃO: 1. Na hora de escrever os labels, somente a primeira letra da palavra é maiúscula. Exemplo para SEXO: Feminino e Masculino
#          2. Nesta Tarefa 6 não crie novas variáveis no banco de dados

dados_sinasc_2$LOCNASC = factor(dados_sinasc_2$LOCNASC, levels = c(1,2,3,4,5), labels = c("Hospital", "Outros establecimentos de saúde", "Domicílio", "Outros", "Aldeia Indígena"))
dados_sinasc_2$ESTCIVMAE = factor(dados_sinasc_2$ESTCIVMAE, levels = c(1,2,3,4,5), labels = c("Solteira", "Casada", "Viúva", "Separada judicialmente/divorciada", "União estável"))
dados_sinasc_2$GESTACAO = factor(dados_sinasc_2$GESTACAO, levels = c(1,2,3,4,5,6), labels = c("Menos de 22 semanas", "22 a 27 semanas", "28 a 31 semanas", "32 a 36 semanas", "37 a 41 semanas", "42 semanas e mais"))
dados_sinasc_2$GRAVIDEZ = factor(dados_sinasc_2$GRAVIDEZ, levels = c(1,2,3), labels = c("Única", "Dupla", "Tripla ou mais"))
dados_sinasc_2$PARTO = factor(dados_sinasc_2$PARTO, levels = c(1,2), labels = c("Vaginal", "Cesário"))
dados_sinasc_2$SEXO = factor(dados_sinasc_2$SEXO, levels = c(1,2), labels = c("Masculino", "Feminino"))
dados_sinasc_2$RACACOR = factor(dados_sinasc_2$RACACOR, levels = c(1,2,3,4,5), labels  = c("Branca", "Preta", "Amarela", "Parda", "Indígena"))
dados_sinasc_2$IDANOMAL = factor(dados_sinasc_2$IDANOMAL, levels = c(1,2), labels = c("Sim", "Não"))
dados_sinasc_2$ESCMAE2010 = factor(dados_sinasc_2$ESCMAE2010, levels = c(0,1,2,3,4,5), labels = c("Sem escolaridade", "Fundamental I (1° a 4° série)" , "Fundamental II (5° a 8° série)", "Médio (antigo 2° Grau", "Superior incompleto", "Superior completo"))
dados_sinasc_2$RACACORMAE = factor(dados_sinasc_2$RACACORMAE, levels = c(1,2,3,4,5), labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena"))
dados_sinasc_2$TPAPRESENT = factor(dados_sinasc_2$TPAPRESENT, levels = c(1,2,3), labels = c("Cefálico", " Pélvica ou podálica", "Transversa"))
dados_sinasc_2$TPROBSON = factor(dados_sinasc_2$TPROBSON, levels = c(1,2,3,4,5,6,7,8,9,10), labels = c("Grupo 1", "Grupo 2", "Grupo 3", "Grupo 4", "Grupo 5", "Grupo 6", "Grupo 7", "Grupo 8", "Grupo 9", "Grupo 10"))
dados_sinasc_2$PARIDADE = factor(dados_sinasc_2$PARIDADE, levels = c(1,0), labels = c("Multípara", "Nulípara"))
dados_sinasc_2$KOTELCHUCK = factor(dados_sinasc_2$KOTELCHUCK, levels = c(1,2,3,4,5), labels = c("Não realizou pré-natal", "Inadequado", "Intermediário", "Adequado", "Mais que adequado"))



# Tarefa 7. Categorizar as variáveis IDADEMAE, PESO e APGAR5 e criar variáveis referentes ao deslocamento materno (peregrinação) e estado civil
# nova variável: dados_sinasc_2$F_PESO com PESO: < 2500: Baixo peso, >=2500 e < 4000: Peso normal, >= 4000: Macrossomia
# nova variável dados_sinasc_2$F_IDADE com IDADEMAE: <15, 15-19, 20-24, 25-29, 30-34, 35-39, 40-44, 45-49, 50+
# nova variável dados_sinasc_2$F_APGAR5 com APGAR5: < 7: Baixo, >= 7: Normal
# Atenção para casos de NA em IDADEMAE, PESO e APGAR5

dados_sinasc_2$F_IDADE <- cut(dados_sinasc_2$IDADEMAE, breaks = c(-Inf, 14,19,24,29,34,39,44,49,Inf), labels = c("<15", "15-19", "20-24", "25-29", "30-34", "35-39", "40-44", "45-49", "50+"))

dados_sinasc_2$F_PESO <- cut(dados_sinasc_2$PESO, breaks = c(-Inf,2499,3999,Inf), labels = c("Baixo peso", "Peso normal", "Macrossomia"))

dados_sinasc_2$F_APGAR5 <- ifelse(dados_sinasc_2$APGAR5 < 7, "Baixo", "Normal")
dados_sinasc_2$F_APGAR5 <- as.factor(dados_sinasc_2$F_APGAR5)

# nova variável: dados_sinasc_2$PERIG: Não: CODMUNNASC igual a CODMUNRES, Sim: CODMUNNASC diferente de CODMUNRES
# nova variável: dados_sinasc_2$ESTCIV: Sem companheiro: ESTCIVMAE 1, 3 ou 4, Com companheiro: ESTCIVMAE 2 ou 5
# Ao categorizar as variáveis, garantir que sejam transformadas em tipo fator
dados_sinasc_2$PERIG <- ifelse(dados_sinasc_2$CODMUNNASC == dados_sinasc_2$CODMUNRES, "Não", "Sim")

dados_sinasc_2$PERIG <- as.factor(dados_sinasc_2$PERIG)

dados_sinasc_2$PERIG <- ifelse(dados_sinasc_2$CODMUNNASC == dados_sinasc_2$CODMUNRES, "Não", "Sim")
dados_sinasc_2$PERIG <- as.factor(dados_sinasc_2$PERIG)

dados_sinasc_2$ESTCIV <- case_when(dados_sinasc_2$ESTCIVMAE %in% c("Solteira","Viúva","Separada Judicialmente") ~ "Sem companheiro", dados_sinasc_2$ESTCIVMAE %in% c("Casada","União estável") ~"Com companheiro")
dados_sinasc_2$ESTCIV <- as.factor(dados_sinasc_2$ESTCIV)

# Tarefa 8. Agregar ao banco de dados_sinasc_2 as informações PESO_P10 e PESO_P90 a partir de Tabela_PIG_Brasil.csv
# a Tabela PIG informa P10 e P90 dos pesos, de acordo com a idade gestacional
# criar nova variável referente ao peso, de acordo com a idade gestacional, conforme indicado abaixo
# nova variável apenas para casos de GRAVIDEZ Única: dados_sinasc_2$F_PIG: PIG: PESO < PESO_P10, AIG: PESO_P10 <= PESO <= PESO_P90, GIG: PESO > PESO_P90
# Atenção para casos de NA em SEMAGESTAC, PESO ou SEXO. Lembre-se também que em dados_sinasc_2 SEXO está como fator com as categorias Feminino e Masculino.
tabela_pig = read.csv("Tabela_PIG_Brasil - Tabela_PIG_Brasil.csv", header = TRUE, sep=",")
tabela_pig$SEXO = factor(tabela_pig$SEXO, levels = c("Masculino", "Feminino"))
dados_sinasc_2 = merge(dados_sinasc_2, tabela_pig, by = c("SEMAGESTAC","SEXO"), all.x = TRUE)
dados_sinasc_2$F_PIG=ifelse(dados_sinasc_2$GRAVIDEZ != "Única", NA,
                            ifelse(is.na(dados_sinasc_2$PESO)|is.na(dados_sinasc_2$PESO_P10)|is.na(dados_sinasc_2$PESO_P90),
                                   NA,
                                   ifelse(dados_sinasc_2$PESO < dados_sinasc_2$PESO_P10, "PIG",
                                          ifelse(dados_sinasc_2$PESO<=dados_sinasc_2$PESO_P90, "AIG", "GIG"))))
dados_sinasc_2$F_PIG = factor(dados_sinasc_2$F_PIG, levels = c("PIG","AIG","GIG"))

# Tarefa 9. Obter as frequências das categorias das variáveis qualitativas e medidas descritivas de variáveis quantitativas e salvar os resultados em novas variáveis.
# Exemplo: freq_SEXO = table(dados_sinasc_2$SEXO)   media_peso = mean(dados_sinasc_2$PESO)
# Medidas descritivas a serem calculadas para variáveis QUANTITATIVAS: P25, P50, P75, média e desvio-padrão. Atenção: usar na.rm = TRUE, quando necessário.


# Tarefa 10. Criar as colunas do novo banco de dados (de nome SINASC_UF.csv Exemplo: SINASC_RJ.csv) com base nas análises prévias, devendo as variáveis estar na ordem indicada abaixo
# ATENÇÃO aos nomes das variáveis e ordem das colunas
# 1. ANO: 2015  2. UFR (Estado de residência)   3. TN (total de nascimentos)   4. TNRC (total de nascimentos com registros completos, ou seja, sem NA em todas as variáveis do banco de dados)
# 5. TGI_15 (total de gestantes com idade inferior a 15 anos - F_IDADE)   6. TGI_15_19 (total de gestantes com idade >=15 e <=19 anos)
# 7: TGI_20_24 (total de gestantes com idade >=20 e <=24 anos)   8. TGI_25_29 (total de gestantes com idade >=25 e <=29 anos)
# 9: TGI_30_34 (total de gestantes com idade >=30 e <=34 anos)   10. TGI_35_39 (total de gestantes com idade >=35 e <=39 anos)
# 11: TGI_40_44 (total de gestantes com idade >=40 e <=44 anos)  12. TGI_45_49 (total de gestantes com idade >=45 e <=49 anos)
# 13: TGI_50 (total de gestantes com idade >=50)   14: TGIF (total de gestantes em idade fértil, idade >=15 e <=49 anos)
# 15: IM_P25 (percentil 25 da idade materna - IDADEMAE) 16: IM_P50 (percentil 50 da idade materna)   17: IM_P75 (percentil 75 da idade materna)
# 18. IM_MD (idade média materna)   19: IM_DP (desvio-padrão da idade materna)
# 20. EM_S (total de gestantes sem escolaridade, ESCMAE2010=0)   21: EM_FI (total de gestantes com escolaridade Fundamental I)
# 22. EM_FII (total de gestantes com escolaridade Fundamental II)   23. EM_M (total de gestantes com escolaridade Médio)   
# 24. EM_SI (total de gestantes com escolaridade Superior Incompleto)   25. EM_SC (total de gestantes com escolaridade Superior Completo) 
# 26. TGRC_B (total de gestantes da raça/cor branca - RACACORMAE)   27. TGRC_PT (total de gestantes da raça/cor preta)
# 28. TGRC_A (total de gestantes da raça/cor amarela)   29. TGRC_PD (total de gestantes da raça/cor parda)
# 30. TGRC_I (total de gestantes da raça/cor indígena)
# 31. TGSC (total de gestantes sem companheiro - ESTCIV)   32. TGCC (total de gestantes com companheiro)
# 33. TGPRI (total de gestantes primíparas - PARIDADE)     34. TGNPRI (total de gestantes não primíparas)
# 35. TGU (total de gestações única)   36. TGG (total de gestações gemelares)   37. TGD_22 (total de gestações com duração inferior a 22 semanas - GESTACAO)
# 38. TGD_22_27 (total de gestações com duração da gestação >=22 e <=27)   39. TGD_28_31 (total de gestações com duração da gestação >=28 e <=31)
# 40. TGD_32_36 (total de gestações com duração da gestação >=32 e <=36)   41. TGD_37_41 (total de gestações com duração da gestação >=37 e <=41)
# 42. TGD_42 (total de gestações com duração da gestação >=42)   43. TGD_PRT (total de gestações pre-termo, duração < 37 semanas)
# 44. TGD_AT (total de gestações a termo, duração >=37 e <=41)   45. TGD_PST  (total de gestações pós termo, duração >=42) 
# 46. DG_P25 (percentil 25 da duração da gestação - SEMAGESTAC)  47. DG_P50 (percentil 50 da duração da gestação)   
# 48. DG_P75 (percentil 75 da duração da gestação)   49. DG_MD (idade média da duração da gestação)   50. DG_DP (desvio-padrão da duração da gestação)
# 51. TKC_NR (total de consultas de pre-natal não realizado - KOTELCHUCK)   52. TKC_ID (total de consultas de pre-natal inadequado)
# 53. TKC_IT (total de consultas de pre-natal intermediário)   54. TKC_AD (total de consultas de pre-natal adequado)  
# 55. TKC_MAD (total de consultas de pre-natal mais que adequado)   56. TGPRG_S (total de gestantes que peregrinaram)  
# 57. TGPRG_N (total de gestantes que não peregrinaram)    58. TPV (total de partos vaginais)   59. TPC (total de partos cesáreos) 
# 60. TRAP_C (total de recém-nascidos na posição cefálica - TPAPRESENT)   61. TRAP_P (total de recém-nascidos na posição pélvica ou podálica)
# 62. TRAP_T (total de recém-nascidos na posição transversa)  63. TGROB_1 (total de gestantes do grupo de Robson 1 - TPROBSON)
# 64. TGROB_2 (total de gestantes do grupo de Robson 2)   65. TGROB_3 (total de gestantes do grupo de Robson 3)
# 66. TGROB_4 (total de gestantes do grupo de Robson 4)   67. TGROB_5 (total de gestantes do grupo de Robson 5)
# 68. TGROB_6 (total de gestantes do grupo de Robson 6)   69. TGROB_7 (total de gestantes do grupo de Robson 7)
# 70. TGROB_8 (total de gestantes do grupo de Robson 8)   71. TGROB_9 (total de gestantes do grupo de Robson 9)
# 72. TGROB_10 (total de gestantes do grupo de Robson 10)   
# 73. TNLOC_H (total de nascimentos em hospital)   74. TNLOC_ES (total de nascimentos em outros estabelecimentos de saúde)
# 75. TNLOC_D (total de nascimentos em domicílio)  76. TNLOC_O (total de nascimentos em outros locais) 
# 77. TNLOC_AI (total de nascimentos em aldeias indígenas)   
# 78. TRRC_B (total de recém-nascidos da raça/cor branca - RACACOR)   79. TRRC_PT (total de recém-nascidos da raça/cor preta)
# 80. TRRC_A (total de recém-nascidos da raça/cor amarela)   81. TRRC_PD (total de recém-nascidos da raça/cor parda)
# 82. TRRC_I (total de recém-nascidos da raça/cor indígena)  83. TRP_BP (total de recém nascidos com baixo peso - FPESO)
# 84. TRP_N (total de recém nascidos com peso normal)   85. TRP_M (total de recém nascidos com macrossomia)
# 86. PESO_P25 (percentil 25 do peso dos recém-nascidos - PESO)  87. PESO_P50 (percentil 50 do peso dos recém-nascidos)   
# 88. PESO_P75 (percentil 75 do peso dos recém-nascidos)  89. PESO_MD (peso médio dos recém-nascidos)   
# 90. PESO_DP (desvio-padrão dos pesos dos recém-nascidos)    91. TRPIG_P (total de recém-nascidos de GESTAÇÕES ÚNICAS com PIG) 
# 92. TRPIG_A (total de recém-nascidos de GESTAÇÕES ÚNICAS com AIG)   93. TRPIG_G (total de recém-nascidos de GESTAÇÕES ÚNICAS com GIG)
# 94: TRAPG5_B (total de recém-nascidos com Apgar5 baixo, ou seja, < 7)
# 95: TRAPG5_N (total de recém-nascidos com Apgar5 normal, ou seja, >= 7)   96. APG5_MD (Apgar5 médio dos recém-nascidos)   
# 97. APG5_DP (desvio-padrão dos Apgar5 dos recém-nascidos)   98. TRAC (total de recém-nascidos com anomalia congênita - IDANOMAL)
# 99. TRSAC (total de recém-nascidos sem anomalia congênita)

#Base inicial

base = data.frame(CODMUNRES =sort(unique(dados_sinasc_2$CODMUNRES)))

# Criação das variáveis
# 1.Nascimentos:

TN = as.data.frame(table(factor(dados_sinasc_2$CODMUNRES, levels = base$CODMUNRES)))
names(TN) = c("CODMUNRES","TN")
base = merge(base, TN, by = "CODMUNRES", all.x = TRUE)

dados_UF = dados_sinasc[substr(as.character(dados_sinasc$CODMUNRES), 1, 2) == "25",]
dados_UF_comp = dados_UF[complete.cases(dados_UF), ]
TNRC = as.data.frame(table(factor(dados_UF_comp$CODMUNRES, levels = base$CODMUNRES)))

names(TNRC) = c("CODMUNRES","TNRC")
base = merge(base, TNRC, by = "CODMUNRES", all.x = TRUE)

dados_UF_1 = dados_sinasc_1[substr(as.character(dados_sinasc_1$CODMUNRES), 1, 2) == "25",]
dados_UF_1_comp = dados_UF_1[complete.cases(dados_UF_1), ]
TNRCR = as.data.frame(table(factor(dados_UF_1_comp$CODMUNRES, levels = base$CODMUNRES)))
names(TNRCR) = c("CODMUNRES","TNRCR")
base = merge(base, TNRCR, by = "CODMUNRES", all.x = TRUE)

#2.Faixa etária das gestantes:

TGI_15 <- dados_sinasc_2 %>%
  mutate(mae_menor15 = ifelse(IDADEMAE < 15, 1, 0)) %>%
  group_by(CODMUNRES) %>%
  summarise(TGI_15 = sum(mae_menor15, na.rm = TRUE))
base = merge(base, TGI_15, by = "CODMUNRES", all.x = TRUE)

TGI_15_19 <- dados_sinasc_2 %>%
  mutate(faixa_15_19 = ifelse(IDADEMAE >= 15 & IDADEMAE <= 19, 1, 0)) %>%
  group_by(CODMUNRES) %>%
  summarise(TGI_15_19 = sum(faixa_15_19, na.rm = TRUE))
base = merge(base, TGI_15_19, by = "CODMUNRES", all.x = TRUE)

TGI_20_24 <- dados_sinasc_2 %>%
  mutate(faixa_20_24 = ifelse(IDADEMAE >= 20 & IDADEMAE <= 24, 1, 0)) %>%
  group_by(CODMUNRES) %>%
  summarise(TGI_20_24 = sum(faixa_20_24, na.rm = TRUE))
base = merge(base, TGI_20_24, by = "CODMUNRES", all.x = TRUE)

TGI_25_29 <- dados_sinasc_2 %>%
  mutate(faixa_25_29 = ifelse(IDADEMAE >= 25 & IDADEMAE <= 29, 1, 0)) %>%
  group_by(CODMUNRES) %>%
  summarise(TGI_25_29 = sum(faixa_25_29, na.rm = TRUE))
base = merge(base, TGI_25_29, by = "CODMUNRES", all.x = TRUE)

TGI_30_34 <- dados_sinasc_2 %>%
  mutate(faixa_30_34 = ifelse(IDADEMAE >= 30 & IDADEMAE <=34, 1, 0)) %>%
  group_by(CODMUNRES) %>%
  summarise(TGI_30_34 = sum(faixa_30_34, na.rm = TRUE))
base = merge(base, TGI_30_34, by = "CODMUNRES", all.x = TRUE)

TGi_35_39 <- dados_sinasc_2 %>%
  mutate(faixa_35_39 = ifelse(IDADEMAE >= 35 & IDADEMAE <= 39, 1, 0)) %>%
  group_by(CODMUNRES) %>%
  summarise(TGi_35_39 = sum(faixa_35_39, na.rm = TRUE))
base = merge(base, TGi_35_39, by = "CODMUNRES", all.x = TRUE)

TGI_40_44 <- dados_sinasc_2 %>%
  mutate(faixa_40_44 = ifelse(IDADEMAE >= 40 & IDADEMAE <= 44, 1, 0)) %>%
  group_by(CODMUNRES) %>%
  summarise(TGI_40_44 = sum(faixa_40_44, na.rm = TRUE))
base = merge(base, TGI_40_44, by = "CODMUNRES", all.x = TRUE)

TGI_45_49 <- dados_sinasc_2 %>%
  mutate(faixa_45_49 = ifelse(IDADEMAE >= 45 & IDADEMAE <= 49, 1, 0)) %>%
  group_by(CODMUNRES) %>%
  summarise(TGI_45_49 = sum(faixa_45_49, na.rm = TRUE))
base = merge(base, TGI_45_49, by = "CODMUNRES", all.x = TRUE)

TGi_50 <- dados_sinasc_2 %>%
  mutate(faixa_50 = ifelse(IDADEMAE >= 50, 1, 0)) %>%
  group_by(CODMUNRES) %>%
  summarise(TGi_50 = sum(faixa_50, na.rm = TRUE))
base = merge(base, TGi_50, by = "CODMUNRES", all.x = TRUE)

TGIF <- dados_sinasc_2 %>%
  mutate(faixa_15_49 = ifelse(IDADEMAE >= 15 & IDADEMAE <= 49, 1, 0)) %>%
  group_by(CODMUNRES) %>%
  summarise(TGIF = sum(faixa_15_49, na.rm = TRUE))
base = merge(base, TGIF, by = "CODMUNRES", all.x = TRUE )

#3. Análise estatística da idade materna:

IM_P25 <- dados_sinasc_2 %>%
  group_by(CODMUNRES) %>%
  summarise(IM_P25= quantile(IDADEMAE, probs = 0.25, na.rm = TRUE))
base = merge(base, IM_P25, by = "CODMUNRES", all.x = TRUE)

IM_P50 <- dados_sinasc_2 %>%
  group_by(CODMUNRES) %>%
  summarise(IM_P50 = quantile(IDADEMAE, probs = 0.50, na.rm = TRUE))
base = merge(base, IM_P50, by = "CODMUNRES", all.x = TRUE)

IM_P75 <- dados_sinasc_2 %>%
  group_by(CODMUNRES) %>%
  summarise(IM_P75 = quantile(IDADEMAE, probs = 0.75, na.rm = TRUE))
base = merge(base, IM_P75, by = "CODMUNRES", na.rm = TRUE)

IM_MD <- dados_sinasc_2 %>%
  group_by(CODMUNRES) %>%
  summarise(IM_MD = round(mean(IDADEMAE, na.rm  = TRUE),2))
base = merge(base, IM_MD, by = "CODMUNRES", all.x = TRUE)
  
IM_DP <- dados_sinasc_2 %>%
  group_by(CODMUNRES) %>%
  summarise(IM_DP = round(sd(IDADEMAE, na.rm = TRUE),2))
base = merge(base,IM_DP, by = "CODMUNRES", all.x = TRUE)

#Escolaridade da mãe:

escolaridade <- dados_sinasc_2 %>%
  mutate(EM_S = ifelse(ESCMAE2010 == "Sem escolaridade",1,0),
         EM_FI = ifelse(ESCMAE2010 == "Fundamental I (1° a 4° série)",1,0),
         EM_FII = ifelse(ESCMAE2010 == "Fundamental II (5° a 8° série)",1,0),
         EM_M = ifelse(ESCMAE2010 == "Médio (antigo 2° Grau",1,0),
         EM_SI = ifelse(ESCMAE2010 == "Superior incompleto",1,0),
         EM_SC = ifelse(ESCMAE2010 == "Superior completo",1,0)
          ) %>%
  group_by(CODMUNRES) %>%
  summarise(EM_S = sum(EM_S, na.rm = TRUE),
            EM_FI = sum(EM_FI, na.rm = TRUE),
            EM_FII = sum(EM_FII, na.rm = TRUE),
            EM_M = sum(EM_M, na.rm = TRUE),
            EM_SI = sum(EM_SI, na.rm = TRUE),
            EM_SC = sum(EM_SC, na.rm = TRUE))
base <- merge(base, escolaridade, by = "CODMUNRES", all.x = TRUE)

#Raça/cor da mãe:

raça <- dados_sinasc_2 %>%
  mutate(TGRC_B = ifelse(RACACORMAE == "Branca", 1,0),
         TGRC_PT = ifelse(RACACORMAE == "Preta", 1,0),
         TGRC_A = ifelse(RACACORMAE == "Amarela",1,0),
         TGRC_PD = ifelse(RACACORMAE == "Parda",1,0),
         TGRC_I = ifelse(RACACORMAE == "Indígena",1,0)
         ) %>%
  group_by(CODMUNRES) %>%
  summarise(TGRC_B = sum(TGRC_B, na.rm = TRUE),
            TGRC_PT = sum(TGRC_PT, na.rm = TRUE),
            TGRC_A = sum(TGRC_A, na.rm = TRUE),
            TGRC_PD = sum(TGRC_PD, na.rm = TRUE),
            TGRC_I = sum(TGRC_I, na.rm = TRUE))

base = merge(base, raça, by = "CODMUNRES", all.x = TRUE)

#Estado civil da mãe:

Companheiros <- dados_sinasc_2 %>%
  mutate(TGSC = ifelse(ESTCIV == "Sem companheiro",1,0),
         TGCC = ifelse(ESTCIV == "Com companheiro",1,0)
  ) %>%
  group_by(CODMUNRES) %>%
  summarise(TGSC = sum(TGSC, na.rm = TRUE),
            TGCC = sum(TGCC, na.rm = TRUE))
base <- merge(base, Companheiros, by = "CODMUNRES", all.x =  TRUE)

#Verificação se é a primeira gravidez da mãe:

gravidez_p_pp <- dados_sinasc_2 %>%
  mutate(TGPRI = ifelse(PARIDADE == "Nulípara",1,0),
         TGNPRI = ifelse(PARIDADE == "Multípara",1,0)
         )%>%
  group_by(CODMUNRES) %>%
  summarise(TGPRI = sum(TGPRI, na.rm = TRUE),
            TGNPRI = sum(TGNPRI, na.rm = TRUE))
base = merge(base, gravidez_p_pp, by = "CODMUNRES", all.x = TRUE)

#Quantidade de filhos em uma gestação:

grav_u_g <- dados_sinasc_2 %>%
  mutate(TGU = ifelse(GRAVIDEZ == "Única",1,0),
         TGG = ifelse(GRAVIDEZ %in% c("Dupla", "Triplas ou mais"),1,0)
  )%>%
  group_by(CODMUNRES) %>%
  summarise(TGU = sum(TGU, na.rm = TRUE),
            TGG = sum(TGG, na.rm = TRUE))
base = merge(base, grav_u_g, by = "CODMUNRES", all.x = TRUE)

#Tempo de gestação:

gestações <- dados_sinasc_2 %>%
  mutate(TGD_22 = ifelse(GESTACAO == "Menos de 22 semanas",1,0),
         TGD_22_27 = ifelse(GESTACAO == "22 a 27 semanas",1,0),
         TGD_28_31 = ifelse(GESTACAO == "28 a 31 semanas",1,0),
         TGD_32_36 = ifelse(GESTACAO == "32 a 36 semanas",1,0),
         TGD_37_41 = ifelse(GESTACAO == "37 a 41 semanas",1,0),
         TGD_42 = ifelse(GESTACAO == "42 semanas e mais",1,0),
         TGD_PRT = ifelse(SEMAGESTAC < 37,1,0),
         TGD_AT = ifelse(SEMAGESTAC >= 37 & SEMAGESTAC <= 41,1,0),
         TGD_PST = ifelse(SEMAGESTAC >= 42,1,0)
  )%>%
  group_by(CODMUNRES) %>%
  summarise(TGD_22 = sum(TGD_22, na.rm = TRUE),
            TGD_22_27 = sum(TGD_22_27, na.rm = TRUE),
            TGD_28_31 = sum(TGD_28_31, na.rm = TRUE),
            TGD_32_36 = sum(TGD_32_36, na.rm = TRUE),
            TGD_37_41 = sum(TGD_37_41, na.rm = TRUE),
            TGD_42 = sum(TGD_42, na.rm = TRUE),
            TGD_PRT = sum(TGD_PRT, na.rm = TRUE),
            TGD_AT = sum(TGD_AT, na.rm = TRUE),
            TGD_PST = sum(TGD_PST, na.rm = TRUE))
base = merge(base,gestações, by = "CODMUNRES", all.x = TRUE)

#Percentil da gravidez:

percentil_grv <- dados_sinasc_2 %>%
  group_by(CODMUNRES) %>%
  summarise(DG_P25 = quantile(SEMAGESTAC, probs = 0.25, na.rm = TRUE),
         DG_P50 = quantile(SEMAGESTAC, probs = 0.50, na.rm = TRUE),
         DG_P75 = quantile(SEMAGESTAC, probs = 0.75, na.rm = TRUE),
         DG_MD = round(mean(SEMAGESTAC, na.rm = TRUE),2),
         DG_DP = round(sd(SEMAGESTAC, na.rm = TRUE),2))

base = merge(base,percentil_grv, by = "CODMUNRES", all.x = TRUE)

#Verificação do pré-natal:

pre_natal <- dados_sinasc_2 %>%
  mutate(TKC_NR = ifelse(KOTELCHUCK == "Não realizou pré-natal",1,0),
         TKC_ID = ifelse(KOTELCHUCK == "Inadequado",1,0),
         TKC_IT = ifelse(KOTELCHUCK == "Intermediário",1,0),
         TKC_AD = ifelse(KOTELCHUCK == "Adequado",1,0),
         TKC_MAD = ifelse(KOTELCHUCK == "Mais que adequado",1,0)
         ) %>%
  group_by(CODMUNRES) %>%
  summarise(TKC_NR = sum(TKC_NR, na.rm = TRUE),
            TKC_ID = sum(TKC_ID, na.rm = TRUE),
            TKC_IT = sum(TKC_IT, na.rm = TRUE),
            TKC_AD = sum(TKC_AD, na.rm = TRUE),
            TKC_MAD = sum(TKC_MAD, na.rm = TRUE))
base = merge(base,pre_natal, by = "CODMUNRES", all.x = TRUE)

#Peregrinação:

peregrinação <- dados_sinasc_2 %>%
  mutate(TGPRG_S = ifelse(CODMUNNASC != CODMUNRES,1,0),
         TGPRG_N = ifelse(CODMUNNASC == CODMUNRES,1,0)
  )%>%
  group_by(CODMUNRES) %>%
  summarise(TGPRG_S = sum(TGPRG_S, na.rm = TRUE),
            TGPRG_N = sum(TGPRG_N, na.rm = TRUE))
base = merge(base, peregrinação, by = "CODMUNRES", all.x = TRUE)

#Tipo de parto:
  
partos <- dados_sinasc_2 %>%
  mutate(TPV = ifelse(PARTO == "Vaginal",1,0),
         TPC = ifelse(PARTO == "Cesário",1,0)
         ) %>%
  group_by(CODMUNRES) %>%
  summarise(TPV = sum(TPV, na.rm = TRUE),
            TPC = sum(TPC, na.rm = TRUE))
base = merge(base, partos, by = "CODMUNRES", all.x = TRUE)

#Posição do bebê:

posição <- dados_sinasc_2 %>%
  mutate(TRAP_C = ifelse(TPAPRESENT == "Cefálico",1,0),
         TRAP_P = ifelse(TPAPRESENT == " Pélvica ou podálica",1,0),
         TRAP_T = ifelse(TPAPRESENT == "Transversa",1,0)
  )%>%
  group_by(CODMUNRES) %>%
  summarise(TRAP_C = sum(TRAP_C, na.rm = TRUE),
            TRAP_P = sum(TRAP_P, na.rm = TRUE),
            TRAP_T = sum(TRAP_T, na.rm = TRUE))
base = merge(base,posição, by = "CODMUNRES", all.x = TRUE)

#Verificação do grupo ROBSON:

robson <- dados_sinasc_2 %>%
  mutate(TGROB_1 = ifelse(TPROBSON == "Grupo 1",1,0),
         TGROB_2 = ifelse(TPROBSON == "Grupo 2",1,0),
         TGROB_3 = ifelse(TPROBSON == "Grupo 3",1,0),
         TGROB_4 = ifelse(TPROBSON == "Grupo 4",1,0),
         TGROB_5 = ifelse(TPROBSON == "Grupo 5",1,0),
         TGROB_6 = ifelse(TPROBSON == "Grupo 6",1,0),
         TGROB_7 = ifelse(TPROBSON == "Grupo 7",1,0),
         TGROB_8 = ifelse(TPROBSON == "Grupo 8",1,0),
         TGROB_9 = ifelse(TPROBSON == "Grupo 9",1,0),
         TGROB_10 = ifelse(TPROBSON == "Grupo 10",1,0)
  ) %>%
  group_by(CODMUNRES) %>%
  summarise(TGROB_1 = sum(TGROB_1, na.rm = TRUE),
            TGROB_2 = sum(TGROB_2, na.rm = TRUE),
            TGROB_3 = sum(TGROB_3, na.rm = TRUE),
            TGROB_4 = sum(TGROB_4, na.rm = TRUE),
            TGROB_5 = sum(TGROB_5, na.rm = TRUE),
            TGROB_6 = sum(TGROB_6, na.rm = TRUE),
            TGROB_7 = sum(TGROB_7, na.rm = TRUE),
            TGROB_8 = sum(TGROB_8, na.rm = TRUE),
            TGROB_9 = sum(TGROB_9, na.rm = TRUE),
            TGROB_10 = sum(TGROB_10, na.rm = TRUE))
base = merge(base,robson, by = "CODMUNRES", all.x = TRUE)


#Local de nascimento:

local_nasc <- dados_sinasc_2 %>%
  mutate(TNLOC_H = ifelse(LOCNASC == "Hospital",1,0),
         TNLOC_ES = ifelse(LOCNASC == "Outros establecimentos de saúde",1,0),
         TNLOc_D = ifelse(LOCNASC == "Domicílio",1,0),
         TNLOC_O = ifelse(LOCNASC == "Outros",1,0),
         TNLOC_AI = ifelse(LOCNASC == "Aldeia Indígena",1,0)
  ) %>%
  group_by(CODMUNRES) %>%
  summarise(TNLOC_H = sum(TNLOC_H, na.rm = TRUE),
            TNLOC_ES = sum(TNLOC_ES, na.rm = TRUE),
            TNLOc_D = sum(TNLOc_D, na.rm = TRUE),
            TNLOC_O = sum(TNLOC_O, na.rm = TRUE),
            TNLOC_AI = sum(TNLOC_AI, na.rm = TRUE))
base = merge(base,local_nasc, by = "CODMUNRES", all.x = TRUE)

#Sexo de recém-nascido:

sexo_nasc <- dados_sinasc_2 %>%
  mutate(TRS_M = ifelse(SEXO == "Masculino",1,0),
       TRS_F = ifelse(SEXO == "Feminino",1,0)
       ) %>%
  group_by(CODMUNRES) %>%
  summarise(TRS_M = sum(TRS_M, na.rm = TRUE),
            TRS_F = sum(TRS_F, na.rm = TRUE))
base = merge(base,sexo_nasc, by = "CODMUNRES", all.x = TRUE)

#Raça/cor do recém-nascido:

raça_nasc <- dados_sinasc_2 %>%
  mutate(TRRC_B = ifelse(RACACOR == "Branca",1,0),
         TRRC_PT = ifelse(RACACOR == "Preta",1,0),
         TRRC_A = ifelse(RACACOR == "Amarela",1,0),
         TRRC_P = ifelse(RACACOR == "Parda",1,0),
         TRRC_I = ifelse(RACACOR == "Indígena",1,0)
  )%>%
  group_by(CODMUNRES) %>%
  summarise(TRRC_B = sum(TRRC_B,na.rm = TRUE),
            TRRC_PT = sum(TRRC_PT, na.rm = TRUE),
            TRRC_A = sum(TRRC_A, na.rm = TRUE),
            TRRC_P = sum(TRRC_P, na.rm = TRUE),
            TRRC_I = sum(TRRC_I, na.rm = TRUE))

base = merge(base,raça_nasc, by = "CODMUNRES", all.x = TRUE)

#Percentil e categorização do peso do recém-nascido:

peso_nasc <- dados_sinasc_2 %>%
  group_by(CODMUNRES) %>%
  summarise(PESO_P25 = round(quantile(PESO, probs = 0.25, na.rm = TRUE),2),
            PESO_P50 = round(quantile(PESO, probs = 0.50, na.rm = TRUE),2),
            PESO_P75 = round(quantile(PESO, probs = 0.75, na.rm = TRUE),2),
            PESO_MD = round(mean(PESO),2),
            PESO_DP = round(sd(PESO),2))
base = merge(base, peso_nasc, by = "CODMUNRES", all.x = TRUE)

categoria_peso_nasc <- dados_sinasc_2 %>%
  mutate(TRP_BP = ifelse(F_PESO == "Baixo peso",1,0),
         TRP_N = ifelse(F_PESO == "Peso normal",1,0),
         TRP_M = ifelse(F_PESO == "Macrossomia",1,0)
         )%>%
  group_by(CODMUNRES) %>%
  summarise(TRP_BP = sum(TRP_BP,na.rm = TRUE),
            TRP_N = sum(TRP_N,na.rm = TRUE),
            TRP_M = sum(TRP_M,na.rm = TRUE))
base = merge(base,categoria_peso_nasc, by = "CODMUNRES", all.x = TRUE)

#Verificação PIG:

pig <- dados_sinasc_2 %>%
  mutate(TRPIG_P = ifelse(F_PIG == "PIG",1,0),
         TRPIG_A = ifelse(F_PIG == "AIG",1,0),
         TRPIG_G = ifelse(F_PIG == "GIG",1,0)
  )%>%
  group_by(CODMUNRES)%>%
  summarise(TRPIG_P = sum(TRPIG_P,na.rm = TRUE),
            TRPIG_A = sum(TRPIG_A,na.rm = TRUE),
            TRPIG_G = sum(TRPIG_G,na.rm = TRUE))
base = merge(base,pig, by = "CODMUNRES", all.x = TRUE)

#Verificação e análise estatística de APGAR5:

apgar_nasc <- dados_sinasc_2 %>%
  mutate(TRAPG5_B = ifelse(APGAR5 < 7,1,0),
         TRAPG5_N = ifelse(APGAR5 >= 7,1,0),
         )%>%
  group_by(CODMUNRES) %>%
  summarise(TRAPG5_B = sum(TRAPG5_B,na.rm = TRUE),
            TRAPG5_N = sum(TRAPG5_N,na.rm = TRUE))

base = merge(base,apgar_nasc, by = "CODMUNRES", all.x = TRUE)

apgar_nasc2 <- dados_sinasc_2 %>%
  group_by(CODMUNRES) %>%
  summarise(APG5_MD = round(mean(APGAR5,na.rm = TRUE),2),
            APG5_DP = round(sd(APGAR5,na.rm = TRUE),2))
base = merge(base,apgar_nasc2, by = "CODMUNRES", all.x = TRUE)

#Verificação de anomalia:

anomalia_nasc <- dados_sinasc_2 %>%
  mutate(TRAC = ifelse(IDANOMAL == "Sim",1,0),
         TRSAC = ifelse(IDANOMAL == "Não",1,0)
         )%>%
  group_by(CODMUNRES) %>%
  summarise(TRAC = sum(TRAC,na.rm = TRUE),
            TRSAC = sum(TRSAC,na.rm = TRUE))
base = merge(base,anomalia_nasc, by = "CODMUNRES", all.x = TRUE)

#Determinação do ano de estudo do banco de dados:

base <- base %>%
  mutate(ANO = 2015) %>%
  select(ANO, everything())

#Determinação das contínuas:

cols_contagem = setdiff(names(base), c("CODMUNRES","IM_MD","IM_DP","IM_P25",
                                        "IM_P50","IM_P75","DG_MD","DG_DP","DG_P25","DG_P50","DG_P75","PESO_MD","PESO_DP","PESO_P25","PESO_P50","PESO_P75", "APG5_MD","APG5_DP"))
   
base[cols_contagem][is.na(base[cols_contagem])] = 0


# Inserindo agora linha da UF
linha_estado = base[1, ]
linha_estado[,] = NA

cols_contagem = setdiff( names(base), c("CODMUNRES","IM_MD","IM_DP","IM_P25",
                                        "IM_P50","IM_P75","DG_MD","DG_DP","DG_P25","DG_P50","DG_P75","PESO_MD","PESO_DP","PESO_P25","PESO_P50","PESO_P75", "APG5_MD","APG5_DP"))



linha_estado[cols_contagem] = colSums(base[cols_contagem], na.rm = TRUE)

#Finalizando o banco de dados:

linha_estado$CODMUNRES = 25
SINASC_PB <- rbind(linha_estado, base)

SINASC_PB$NIVEL <- c("UF", rep("MUNICIPIO", nrow(SINASC_AC)-1))
SINASC_PB$ANO   <- 2015

SINASC_PB <- SINASC_PB[, c("ANO","NIVEL","CODMUNRES",
                           names(SINASC_PB)[!names(SINASC_PB) %in% c("ANO","NIVEL","CODMUNRES")])]

#Exportando o banco de dados:

write.csv(SINASC_PB, "SINASC_PB.csv")

# Ao terminar a ETAPA 1 commite e envie para o repositório REMOTO com o comentário "Dados da UF e Script Etapa 1"



##################################
# ETAPA 2: BANCO DE DADOS DO SIM
##################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 2

# Tarefa 1. Leitura do banco de dados Mortalidade_Geral_2015 do SIM 2015 com 1216475 linhas e 87 colunas
# verificar se a leitura foi feita corretamente e a estrutura dos dados
# nomeie o banco de dados como dados_sim


# Tarefa 2. Reduzir dados_sim apenas para as colunas que serão utilizadas, nomeando este novo banco de dados como dados_sim_1
# as colunas serão (a informar)
# nomes das respectivas variáveis: CONTADOR, TIPOBITO, CODMUNNATU, IDADE,  SEXO,  RACACOR,  ESTCIV, ESC2010, 
# CODMUNRES,  LOCOCOR, CODMUNOCOR, TPMORTEOCO,  OBITOGRAV, OBITOPUERP, CAUSABAS, CAUSABAS_O, TPOBITOCOR, MORTEPARTO



#####################################################
# ETAPA 3: OUTROS BANCOS DE DADOS: IBGE, SNIS, ...
#####################################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 3

# Tarefa 1. Acesso aos bancos de dados e obtenção da informação



#####################################################################################################
# ETAPA 4: GERAR BANCO DE DADOS FINAL DO ESTADO, BASEADO NAS ANÁLISES DE SINASC, SIM, IBGE, SNIS,...
######################################################################################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 4

# Cada aluno gerar um dataframe de uma única linha (referente ao seu estado) com as variáveis na ordem indicada pela professora



############################################################################################
# ETAPA 5: EMPILHAMENTO DOS DATAFRAMES DE CADA ESTADO, GERANDO UM DATAFRAME DE 27 LINHAS
############################################################################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 5

# 1. Enviar arquivos para as pastas do repositório da Professora no GitHUb
# 2. A professora fará o empilhamentos dos dataframes

