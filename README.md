# MD2DSTU
Джентльменский набор для создания документов по стандарту ДСТУ-3008-95 из markdown файлов.

## Установка

```bash
docker build -t local/dstu-pandoc .

./md2dstu -c -b bibliography.bib -t title.tex -o example1.pdf -v main.md
```

Пути указываются относительно /input_files

## Примеры страниц

### Титулка

![titul](https://github.com/vangaa/markdown-dstu-3008-95/blob/master/images/title.png)

### Текст, заголовки, формулы

![text](https://github.com/vangaa/markdown-dstu-3008-95/blob/master/images/part.png)

### Изображения, списки

![images](https://github.com/vangaa/markdown-dstu-3008-95/blob/master/images/images.png)

Таблицы

![tables](https://github.com/vangaa/markdown-dstu-3008-95/blob/master/images/tables.png)

### Список литературы

![references](https://github.com/vangaa/markdown-dstu-3008-95/blob/master/images/literature.png)
