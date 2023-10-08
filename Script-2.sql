CREATE TABLE IF NOT EXISTS public.readers
(
    reader_id integer PRIMARY KEY,
    full_name text NOT NULL,
    city text NOT NULL
);
CREATE TABLE IF NOT EXISTS public.publishing
(
    publishing_id integer PRIMARY KEY,
    publishing_name text NOT NULL,
    publishing_city text NOT NULL
);

CREATE TABLE IF NOT EXISTS public.books
(
    isbn_id integer PRIMARY KEY,
    title character varying(128) NOT NULL,
    year smallint,
    pages smallint,
    price money,
    quantity smallint NOT null,
    fk_publishing_id integer REFERENCES public.publishing(publishing_id) NOT NULL
   
);

CREATE TABLE IF NOT EXISTS public.authors
(
    author_id integer PRIMARY KEY,
    author_full_name text NOT NULL
);
CREATE TABLE IF NOT EXISTS public.lending_library
(
    reader_id integer REFERENCES public.readers(reader_id) NOT NULL,
    isbn_id integer REFERENCES public.books(isbn_id) NOT NULL,
    start_date date,
    due_date date
);
CREATE TABLE IF NOT EXISTS public.books_of_authors
(
    isbn_id integer REFERENCES public.books(isbn_id) NOT NULL,
    author_id integer REFERENCES public.authors(author_id) NOT null
);