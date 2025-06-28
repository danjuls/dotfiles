local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("if", {
    t({ "{% if condition %}", "	", "{% endif %}" }),
  }),
  s("block", {
    t({ "{% block name %}", "	", "{% endblock %}" }),
  }),
  s("include", {
    t({ "{% include 'file.twig' %}" }),
  }),
}
