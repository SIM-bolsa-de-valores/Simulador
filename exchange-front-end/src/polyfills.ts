/**
 * Este arquivo inclui polyfills necessários pelo Angular e é carregado antes da aplicação.
 * Você pode adicionar seus próprios polyfills extras a este arquivo.
 *
 * Este arquivo é dividido em 2 seções:
 *   1. Polyfills do navegador. Estes são aplicados antes de carregar o ZoneJS e são classificados por navegadores.
 *   2. Importações da aplicação. Arquivos importados após o ZoneJS que devem ser carregados antes do seu arquivo principal.
 *
 * A configuração atual é para os chamados navegadores "evergreen"; as últimas versões de navegadores que
 * se atualizam automaticamente. Isso inclui Safari >= 10, Chrome >= 55 (incluindo Opera),
 * Edge >= 13 no desktop e iOS 10 e Chrome no mobile.
 *
 * Saiba mais em https://angular.io/guide/browser-support
 */

/***************************************************************************************************
 * POLYFILLS DO NAVEGADOR
 */

/** O IE10 e IE11 requerem o seguinte para o suporte NgClass em elementos SVG */
// import 'classlist.js';  // Execute `npm install --save classlist.js`.

/**
 * Animações da Web `@angular/platform-browser/animations`
 * Somente necessário se AnimationBuilder for usado dentro da aplicação e estiver usando IE/Edge ou Safari.
 * O suporte padrão a animações no Angular NÃO requer nenhum polyfill (a partir do Angular 6.0).
 */
// import 'web-animations-js';  // Execute `npm install --save web-animations-js`.

/**
 * Por padrão, zone.js irá aplicar patch em todas as macroTask e DomEvents possíveis
 * o usuário pode desativar partes do patch macroTask/DomEvents definindo as seguintes flags
 * porque essas flags precisam ser definidas antes do carregamento do `zone.js`, e o webpack
 * colocará a importação no topo do pacote, então o usuário precisa criar um arquivo separado
 * neste diretório (por exemplo: zone-flags.ts), e colocar as seguintes flags
 * nesse arquivo e, em seguida, adicionar o seguinte código antes de importar o zone.js.
 * import './zone-flags';
 *
 * As flags permitidas em zone-flags.ts estão listadas aqui.
 *
 * As seguintes flags funcionarão para todos os navegadores.
 *
 * (window as any).__Zone_disable_requestAnimationFrame = true; // desativar o patch requestAnimationFrame
 * (window as any).__Zone_disable_on_property = true; // desativar o patch onProperty como onclick
 * (window as any).__zone_symbol__UNPATCHED_EVENTS = ['scroll', 'mousemove']; // desativar o patch de eventNames especificados
 *
 *  no IE/Edge developer tools, o addEventListener também será envolto por zone.js
 *  com a seguinte flag, ele irá ignorar o patch do `zone.js` para IE/Edge
 *
 *  (window as any).__Zone_enable_cross_context_check = true;
 *
 */

/***************************************************************************************************
 * Zone JS é necessário por padrão para o próprio Angular.
 */
import 'zone.js/dist/zone';  // Incluído com Angular CLI.


/***************************************************************************************************
 * IMPORTAÇÕES DA APLICAÇÃO
 */
