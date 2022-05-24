# Tarea

## Finanzas Públicas

###### Instituto Tecnológico Autónomo de México

###### Carlos Lezama

### ISR e IVA

A continuación, se muestran simulaciones de recaudación e ingresos de acuerdo al **impuesto sobre la renta** (ISR) y el **subsidio para el empleo** con base en los artículos 152 y décimo transitorio de la **Ley del Impuesto sobre la Renta**.

Para ilustrarlo, se consideró una secuencia de ingresos entre $\$ 0$ y $\$3,500,000$ con incrementos de $\$1,000$.

![](out/out-1.png)

![](out/out-2.png)

![](out/out-3.png)

![](out/out-4.png)

### Impuestos indirectos óptimos

Dada una economía con $2$ individuos que generan utilidad sobre el consumo de dos bienes distintos ($x$, $y$), y su consumo de ocio $h$, las funciones de utilidad de tales individuos están determinadas por

$$
u_1(x_1, y_1, h_1) = \frac{1}{2}\log(x_1) + \frac{3}{2}\log(y_1) + \log(h_1),
$$

y

$$
u_2(x_2, y_2, h_2) = 2\log(x_2) + \log(y_2) + \log(h_2).
$$

El salario del individuo $1$ es de $\$100$ por hora, mientras que el salario del individuo $2$ es de $\$40$ por hora. Ambos individuos cuentan con $24$ horas que distribuyen entre ocio y trabajo. Ambos bienes se producen en competencia perfecta con precios al productor $q_x = 1$ y $q_y = 4$ antes de impuestos. El gobierno decide que debe recaudar $\$20$ a través de impuestos unitarios al consumo de cada uno de los bienes ($t_x$, $t_y$).

#### Caso general

$$
\max_{\{x_i, y_i, l_i\}} \alpha_{1, i} \log(x_i) + \alpha_{2, i} \log(y_i) + \alpha_{3, i} \log(h_i)
$$

sujeto a

$$
p_x x_i + p_y y_i = w_i l_i, \quad h_i + l_i = 24, \quad \forall i = 1, 2.
$$

Esto implica los siguientes resultados:

$$
\begin{align}
x_i^* &= \frac{1}{p_x} \left( \frac{24 w_i}{ 1 + \frac{\alpha_{2, i}}{\alpha_{1, i}} + \frac{\alpha_{3, i}}{\alpha_{1, i}} } \right)\\
y_i^* &= \frac{1}{p_y} \left( \frac{24 w_i}{ 1 + \frac{\alpha_{1, i}}{\alpha_{2, i}} + \frac{\alpha_{3, i}}{\alpha_{2, i}} } \right) \\
l_i^* &= 24 - \left( \frac{24}{ 1 + \frac{\alpha_{1, i}}{\alpha_{3, i}} + \frac{\alpha_{2, i}}{\alpha_{3, i}} } \right) \\
\end{align}
$$

tales que

$$
\begin{align}
x_1^* &= \frac{400}{p_x}, & x_2^* &= \frac{480}{p_x}, \\
y_1^* &= \frac{1200}{p_y}, & y_2^* &= \frac{240}{p_y}, \\
l_1^* &= 16, & l_2^* &= 18.
\end{align}
$$

Consecuentemente,

$$
V_1(p_x, p_y) = c_1 - \frac{1}{2} \log(p_x) - \frac{3}{2} \log(p_y), \\
V_2(p_x, p_y) = c_2 - 2 \log(p_x) - \log(p_y),
$$

donde $c_1 \approx 15.7103$ y $c_2 \approx 19.6199$.

#### Problema del gobierno

$$
\max_{\{t_x, t_y\}} z_1 V_1 + z_2 V_2
$$

sujeto a

$$
t_x(x_1 + x_2) + t_y(y_1 + y_2).
$$

### Impuestos laborales

Sea una economía de individuo representativo con función de utilidad Cobb-Douglas sobre dos bienes (ocio y un bien compuesto — $h$ y $c$) tal que $\displaystyle u(h, c) = 2\log(c) + \frac{3}{2}\log(h)$ con una dotación de horas del individuo es $20$ para trabajo y ocio, supongamos que el salario del individuo es $\$500$ y el precio del bien compuesto está normalizado a $\$1$.

### Bienes públicos

Una economía está compuesta por $2$ tipos de individuos diferentes con funciones de utilidad sobre un bien privado $x$ y un bien público $y$ tales que:

$$
u_1(x_1, y) = \log(x_1) + \log(y),
$$

y

$$
u_2(x_2, y) = 2\log(x_2) + \log(y).
$$

Además, la función de producción del bien público tiene una tasa marginal de transformación técnica constante e igual a $1$ — i.e., una unidad de bien privado se transforma en una unidad de bien público. La dotación inicial de cada individuo es de $50$ unidades de bien privado.

Finalmente, supongamos que la función de utilidad social es aditiva y el gobierno otorga un pero igual a $1$ a la utilidad de cada individuo. Asimismo, supongamos que existen $10$ individuos de tipo $1$ y $15$ de tipo $2$.

### Externalidades

Consideremos una ciudad con un lago y dos empresas que producen un bien que lo contamina. La función de demanda inversa está dada por la siguiente ecuación: $P = 300 - 8Q$. Ambas empresas producen tomando los precios como dados (en competencia perfecta a pesar de ser $2$ empresas). La función de costos totales de la empresa $1$ está dada por $C_1 = 3Q_1^2$ y la función de costos totales de la empresa $2$ es $\displaystyle C_2 = \frac{3}{2} Q_2^2$, donde $Q_i$ es la cantidad de unidades producidas por la empresa $i$. El daño marginal causado por la producción del bien es constante e igual a $DM = 50$.

### Análisis costo-beneficio

El alcalde de una ciudad anuncia una licitación para contruir un segundo piso sobre la vía más transitada de la demarcación. La obra tiene un costo inicial de $\$1,000$ millones de pesos en el año $0$ y un costo de mantenimiento de $\$100$ millones en términos reales a partir del año $1$.

Supongamos que se realizan $500, 000$ viajes al año en dicho tramo, mismo que se recorre actualmente en $3$ horas. Con la obra, se espera que el número de viajes se mantenga constante y el tiempo de translado se reduzca a la mitad.

El Estado no tiene superávit ni déficit, ni otros proyectos a financiar. La tasa de interés de deuda pública es $10\%$ nominal, la rentabilidad promedio de las empresas localizadas en el Estado es de $15\%$ nominal, la tasa de interés en tarjetas de crédito es de $20\%$ y la tasa de inflación promedio es igual a $5\%$.
