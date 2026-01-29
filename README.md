# 🎰 SpinBookie - Landing Page de Redirecionamento

Landing page mobile-friendly com redirecionamento automático após 2 segundos.

## 📋 Características

- ✅ Layout responsivo (mobile-first)
- ✅ Animações suaves e otimizadas (60fps)
- ✅ Redirecionamento automático após 2 segundos
- ✅ Design moderno com efeitos neon verde
- ✅ Gradiente escuro de fundo
- ✅ Animações de pulso e fade-in

## 🚀 Como Usar

### 1. Configurar URL de Redirecionamento

Edite o arquivo `index.html` e altere a variável `PLACEHOLDER_URL` no JavaScript:

```javascript
const PLACEHOLDER_URL = 'https://sua-url-destino.com';
```

### 2. Verificar Caminhos das Imagens

Certifique-se de que as imagens estão nos seguintes caminhos:
- Logo: `/images/Logo Spinbook.jpeg`
- Imagem do bono: `/public/images/300-Bonos.webp`

### 3. Servir o Arquivo

#### Opção A: Servidor Local (Python)
```bash
# Python 3
python3 -m http.server 8000

# Acesse: http://localhost:8000
```

#### Opção B: Servidor Local (Node.js)
```bash
# Instalar http-server globalmente
npm install -g http-server

# Executar
http-server -p 8000

# Acesse: http://localhost:8000
```

#### Opção C: Servidor Local (PHP)
```bash
php -S localhost:8000
```

## 📁 Estrutura de Arquivos

```
.
├── index.html                 # Landing page principal
├── images/
│   └── Logo Spinbook.jpeg     # Logo da SpinBookie
└── public/
    └── images/
        └── 300-Bonos.webp     # Imagem promocional do bono
```

## 🎨 Especificações Técnicas

### Cores
- Neon Green: `#00ff88`
- Background Dark: `#000000` → `#0a2f1f` (gradiente)
- Texto: `#ffffff`

### Animações
- **Fade-in da página**: 0.6s ease-in
- **Pulso do card**: 2s infinite ease-in-out
- **Pulso dos dots**: 1.4s infinite ease-in-out (com delay escalonado)

### Breakpoints
- Mobile: `max-width: 768px`
- Desktop: acima de 768px

## 🔧 Personalização

### Alterar Tempo de Redirecionamento

No arquivo `index.html`, altere o valor em milissegundos:

```javascript
setTimeout(function() {
    // ...
}, 2000); // Altere 2000 para o tempo desejado (em milissegundos)
```

### Alterar Cores

Edite as variáveis CSS no início do arquivo:

```css
:root {
    --neon-green: #00ff88;
    --dark-bg: #000000;
    --dark-green: #0a2f1f;
    --white: #ffffff;
}
```

## 📱 Testes

Teste a página em diferentes dispositivos:
- Desktop (1920x1080)
- Tablet (768x1024)
- Mobile (375x667, 414x896)

## 🐛 Debug

O console do navegador mostrará uma mensagem antes do redirecionamento:
```
Redirigiendo a: [URL]
```

Abra o DevTools (F12) para verificar.

## 📝 Notas

- A página usa caminhos absolutos (`/images/`, `/public/images/`)
- Certifique-se de que o servidor está configurado corretamente
- As animações usam `transform` e `opacity` para performance otimizada
- Compatível com todos os navegadores modernos

## 🔒 Segurança

⚠️ **Importante**: Atualize a URL de redirecionamento antes de fazer deploy em produção!


