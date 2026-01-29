# 📘 Tutorial: Resolver 404 nas URLs Dinâmicas

Este guia explica **por que** as páginas de slug dão 404 e **como** corrigir de forma definitiva.

---

## 1. O que são “URLs dinâmicas” neste projeto?

São páginas criadas para cada **slug**, com um arquivo `.html` e um valor de **sub1** próprio:

| URL que você quer | Arquivo no projeto | sub1 no redirect |
|-------------------|--------------------|-------------------|
| `app.spinbookie.online/cr2_v6` | `cr2_v6.html` | `sub1=cr2_v6` |
| `app.spinbookie.online/cr1_v6` | `cr1_v6.html` | `sub1=cr1_v6` |
| `app.spinbookie.online/Flex_Cr2_v6` | `Flex_Cr2_v6.html` | `sub1=Flex_Cr2_v6` |
| etc. | `[slug].html` | `sub1=[slug]` |

Ou seja: **uma URL “limpa”** (sem `.html`) para cada página.

---

## 2. Por que dá 404?

No servidor (ex: Vercel), quando alguém acessa:

```
https://app.spinbookie.online/cr2_v6
```

o servidor procura um **recurso** chamado `cr2_v6`. No seu projeto, o que existe é o **arquivo** `cr2_v6.html`, não um recurso chamado `cr2_v6`. Por isso o servidor responde **404 Not Found**.

Resumindo:
- **Você acessa:** `/cr2_v6` (sem `.html`)
- **O que existe no repo:** `cr2_v6.html`
- **Resultado:** 404, porque o caminho não bate.

A solução é dizer ao Vercel: “quando pedirem `/:slug`, sirva o arquivo `/:slug.html`”.

---

## 3. Solução: `vercel.json` com rewrite

O Vercel usa o arquivo **`vercel.json`** na **raiz do projeto** para regras de redirecionamento e **rewrite**.

### O que é “rewrite”?

- **Redirect:** o navegador muda a URL (ex: `/cr2_v6` → `/cr2_v6.html`).
- **Rewrite:** o servidor **entrega** o conteúdo de outro caminho **sem mudar** a URL na barra do navegador. O usuário continua vendo `app.spinbookie.online/cr2_v6`, mas o Vercel serve o conteúdo de `cr2_v6.html`.

Para as URLs dinâmicas, queremos **rewrite**, não redirect, para manter a URL limpa.

---

## 4. Passo a passo para resolver o 404

### Passo 1: Arquivo na raiz do projeto

Na **raiz** do repositório (mesmo nível que `index.html`), crie ou edite o arquivo:

**`vercel.json`**

Conteúdo:

```json
{
  "rewrites": [
    {
      "source": "/:slug",
      "destination": "/:slug.html"
    }
  ]
}
```

O que cada parte faz:
- **`"source": "/:slug"`** – qualquer caminho com um único segmento: `/cr2_v6`, `/cr1_v6`, `/Flex_Cr2_v6`, etc.
- **`"destination": "/:slug.html"`** – o Vercel entrega o arquivo com esse nome: `cr2_v6.html`, `cr1_v6.html`, etc.

Assim, `app.spinbookie.online/cr2_v6` passa a servir o conteúdo de `cr2_v6.html` sem 404.

### Passo 2: Não reescrever a raiz

**Não** use regras que mandem tudo para `index.html`, por exemplo:

```json
{
  "rewrites": [
    { "source": "/(.*)", "destination": "/index.html" }
  ]
}
```

Isso faria **todas** as URLs (inclusive `/cr2_v6`) virarem `index.html` e quebraria as páginas de slug.

A regra correta é só **`/:slug` → `/:slug.html`**, como no Passo 1.

### Passo 3: Salvar, commitar e enviar ao GitHub

No terminal, na pasta do projeto:

```bash
cd "/Users/guilhermesimas/Cursor.ai/Redirect espanha"

# Ver se vercel.json está na raiz
ls vercel.json

# Adicionar e commitar
git add vercel.json
git commit -m "Configurar rewrite para URLs dinâmicas (corrigir 404)"

# Enviar (use seu token se pedir senha)
git push origin main
```

### Passo 4: Deploy no Vercel

- Se o projeto já está conectado ao GitHub, o Vercel faz o deploy sozinho após o `git push`.
- Aguarde 1–2 minutos e teste de novo.

### Passo 5: Testar

1. Abra: `https://app.spinbookie.online/cr2_v6`  
   - Deve carregar a página (conteúdo de `cr2_v6.html`) **sem** 404.
2. Abra: `https://app.spinbookie.online/cr1_v6`  
   - Deve carregar a página de `cr1_v6.html`.
3. Se ainda aparecer 404:
   - Confirme que `vercel.json` está na **raiz** e no **GitHub**.
   - No Vercel: **Deployments** → último deploy → **Logs** (para ver se há erro).
   - Tente um **Redeploy** no Vercel e teste de novo.

---

## 5. Resumo visual

```
Usuário acessa:  app.spinbookie.online/cr2_v6
                          │
                          ▼
                 Vercel lê vercel.json
                          │
                          ▼
                 Regra: /:slug → /:slug.html
                          │
                          ▼
                 Entrega: cr2_v6.html
                          │
                          ▼
                 Página abre, sem 404.
```

---

## 6. Checklist final

- [ ] `vercel.json` na **raiz** do projeto (junto de `index.html`).
- [ ] Conteúdo com **apenas** a regra `/:slug` → `/:slug.html` (sem mandar tudo para `index.html`).
- [ ] Arquivo commitado e enviado ao GitHub (`git push origin main`).
- [ ] Deploy do Vercel concluído (ver **Deployments**).
- [ ] Teste em: `app.spinbookie.online/cr2_v6` (e outros slugs).

Se todos os itens estiverem ok, as URLs dinâmicas deixam de dar 404.
