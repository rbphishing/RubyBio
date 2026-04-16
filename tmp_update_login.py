from pathlib import Path
content = '''<div class="min-h-screen bg-[#050505] text-white flex items-center justify-center px-6 py-12">
  <div class="w-full max-w-md">
    <div class="relative overflow-hidden rounded-[2.5rem] border border-white/10 bg-[#09090b]/95 p-8 shadow-[0_30px_90px_rgba(0,0,0,0.45)] backdrop-blur-xl sm:p-10">
      <div class="absolute inset-x-0 top-0 h-1 bg-gradient-to-r from-violet-500 via-fuchsia-500 to-violet-500 opacity-90"></div>
      <div class="absolute inset-0 bg-[radial-gradient(circle_at_top_right,_rgba(139,92,246,0.18),_transparent_35%),radial-gradient(circle_at_bottom_left,_rgba(168,85,247,0.12),_transparent_30%)]"></div>

      <div class="relative z-10 flex flex-col items-center gap-4 text-center mb-10">
        <img src="<%= asset_path('diamond-purple.svg') %>" alt="BioDiamante" class="w-20 h-20" />
        <p class="text-xs uppercase tracking-[0.35em] text-violet-300/70">LINK NA BIO QUE CONVERTE</p>
        <h1 class="text-4xl font-semibold tracking-tight text-white">Bem-vindo de volta</h1>
        <p class="max-w-sm text-sm text-white/60">Entre para gerenciar seus links e analisar suas conversões</p>
      </div>

      <%= form_with url: login_path, method: :post, local: true, html: { class: "relative z-10 space-y-5" } do |f| %>
        <div class="space-y-5">
          <div>
            <%= f.label :email, "E-mail", class: "block text-sm font-semibold text-white/70 mb-2 tracking-tight" %>
            <%= f.email_field :email,
                              autofocus: true,
                              autocomplete: "email",
                              placeholder: "seu@email.com",
                              class: "w-full rounded-[1.75rem] border border-white/10 bg-white/5 px-5 py-4 text-white placeholder:text-white/40 shadow-[0_20px_50px_rgba(0,0,0,0.15)] outline-none transition duration-200 focus:border-violet-400 focus:ring-2 focus:ring-violet-500/20" %>
          </div>

          <div>
            <%= f.label :password, "Senha", class: "block text-sm font-semibold text-white/70 mb-2 tracking-tight" %>
            <%= f.password_field :password,
                                 autocomplete: "current-password",
                                 placeholder: "••••••••",
                                 class: "w-full rounded-[1.75rem] border border-white/10 bg-white/5 px-5 py-4 text-white placeholder:text-white/40 shadow-[0_20px_50px_rgba(0,0,0,0.15)] outline-none transition duration-200 focus:border-violet-400 focus:ring-2 focus:ring-violet-500/20" %>
          </div>
        </div>

        <%= f.submit "Entrar na minha conta",
                    class: "w-full rounded-[1.75rem] bg-gradient-to-r from-violet-600 via-purple-600 to-violet-500 px-6 py-4 text-lg font-semibold text-white shadow-[0_18px_60px_rgba(139,92,246,0.28)] transition duration-200 hover:-translate-y-0.5 hover:shadow-[0_25px_75px_rgba(139,92,246,0.35)] active:scale-[0.99]" %>
      <% end %>

      <div class="relative z-10 mt-8 space-y-4 text-center text-sm text-white/60">
        <%= link_to "Esqueceu sua senha?", "#", class: "text-violet-300 hover:text-violet-200 transition" %>
        <p>Não tem conta? <%= link_to "Criar agora", "#", class: "text-violet-300 hover:text-violet-200 transition font-semibold" %></p>
      </div>

      <p class="relative z-10 mt-10 text-center text-xs text-white/30">© 2026 BioDiamante • Feito para quem vende</p>
    </div>
  </div>
</div>
'''
Path(r'app/views/sessions/new.html.erb').write_text(content, encoding='utf-8')
