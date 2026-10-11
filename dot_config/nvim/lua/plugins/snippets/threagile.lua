
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  s("threagile-model", {
    t({ "threagile_version: 1.0.0", "", "title: " }), i(1, "title"),
    t({ "", "", "date: " }), i(2, "date"),
    t({ "", "", "author:", "  name: " }), i(3, "name"),
    t({ "", "  homepage: " }), i(4, "https://example.com"),
    t({ "", "", "management_summary_comment: " }), i(5),
    t({ "", "", "business_criticality: " }), i(6, "business_criticality"),
    t({ "", "", "business_overview:", "  description: " }), i(7, "description"),
    t({ "", "  images:", "", "technical_overview:", "  description: " }), i(8, "description"),
    t({ "", "  images:", "", "questions:", "", "abuse_cases:", "", "security_requirements:", "", "tags_available:", "", "data_assets:", "", "technical_assets:", "", "trust_boundaries:", "", "shared_runtimes:", "", "individual_risk_categories:", "", "risk_tracking:", "" }),
    i(0)
  }),
  s("threagile-data-asset", {
    i(1, "DataAssetName"), t({ ":", "  id: " }), i(2, "id"),
    t({ "", "  description: " }), i(3, "description"),
    t({ "", "  usage: " }), i(4, "business"),
    t({ "", "  tags:", "  origin: " }), i(5, "origin"),
    t({ "", "  owner: " }), i(6, "owner"),
    t({ "", "  quantity: " }), i(7, "many"),
    t({ "", "  confidentiality: " }), i(8, "internal"),
    t({ "", "  integrity: " }), i(9, "important"),
    t({ "", "  availability: " }), i(10, "important"),
    t({ "", "  justification_cia_rating: " }), i(0)
  }),
  s("threagile-technical-asset", {
    i(1, "TechnicalAssetName"), t({ ":", "  id: " }), i(2, "id"),
    t({ "", "  description: " }), i(3, "description"),
    t({ "", "  type: " }), i(4, "process"),
    t({ "", "  usage: " }), i(5, "business"),
    t({ "", "  used_as_client_by_human: " }), i(6, "false"),
    t({ "", "  out_of_scope: false", "  justification_out_of_scope:", "  size: " }), i(7, "component"),
    t({ "", "  technology: " }), i(8, "technology"),
    t({ "", "  tags: " }), i(9, "tags"),
    t({ "", "  internet: " }), i(10, "false"),
    t({ "", "  machine: " }), i(11, "false"),
    t({ "", "  encryption: " }), i(12, "transparent"),
    t({ "", "  owner: " }), i(13, "owner"),
    t({ "", "  confidentiality: " }), i(14, "internal"),
    t({ "", "  integrity: " }), i(15, "important"),
    t({ "", "  availability: " }), i(16, "important"),
    t({ "", "  justification_cia_rating:", "  multi_tenant: " }), i(17, "false"),
    t({ "", "  redundant: " }), i(18, "false"),
    t({ "", "  custom_developed_parts: " }), i(19, "false"),
    t({ "", "  data_assets_processed:", "  data_assets_stored:", "  data_formats_accepted:", "  communication_links:", "" }),
    i(0)
  }),
  s("threagile-communication-link", {
    i(1, "CommunicationLinkName"), t({ ":", "  target: " }), i(2, "target_id"),
    t({ "", "  description: " }), i(3, "description"),
    t({ "", "  protocol: " }), i(4, "HTTPS"),
    t({ "", "  authentication: " }), i(5, "authentication"),
    t({ "", "  authorization: " }), i(6, "authorization"),
    t({ "", "  tags: " }), i(7, "tags"),
    t({ "", "  vpn: " }), i(8, "false"),
    t({ "", "  ip_filtered: " }), i(9, "false"),
    t({ "", "  readonly: " }), i(10, "false"),
    t({ "", "  usage: " }), i(11, "business"),
    t({ "", "  data_assets_sent:", "  data_assets_received:", "" }), i(0)
  }),
  s("threagile-trust-boundary", {
    i(1, "TrustBoundaryName"), t({ ":", "  id: " }), i(2, "id"),
    t({ "", "  description: " }), i(3, "description"),
    t({ "", "  type: " }), i(4, "network-cloud-provider"),
    t({ "", "  tags: " }), i(5, "tags"),
    t({ "", "  technical_assets_inside:", "  trust_boundaries_nested:", "" }), i(0)
  }),
  s("threagile-shared-runtime", {
    i(1, "SharedRuntimeName"), t({ ":", "  id: " }), i(2, "id"),
    t({ "", "  description: " }), i(3, "description"),
    t({ "", "  tags: " }), i(4, "tags"),
    t({ "", "  technical_assets_running:", "" }), i(0)
  }),
  s("threagile-risk-category", {
    i(1, "IndividualRiskCategoryName"), t({ ":", "  id: " }), i(2, "id"),
    t({ "", "  description: " }), i(3, "description"),
    t({ "", "  impact: " }), i(4, "impact"), t({ "", "  asvs: " }), i(5, "asvs"),
    t({ "", "  cheat_sheet: " }), i(6, "cheat_sheet"), t({ "", "  action: " }), i(7, "action"),
    t({ "", "  mitigation: " }), i(8, "mitigation"), t({ "", "  check: " }), i(9, "check"),
    t({ "", "  function: " }), i(10, "function"), t({ "", "  stride: " }), i(11, "stride"),
    t({ "", "  detection_logic: " }), i(12, "detection_logic"), t({ "", "  risk_assessment: " }), i(13, "risk_assessment"),
    t({ "", "  false_positives: " }), i(14, "false_positives"),
    t({ "", "  model_failure_possible_reason: " }), i(15, "reason"),
    t({ "", "  cwe: " }), i(16, "cwe"), t({ "", "  risks_identified:", "" }), i(0)
  }),
  s("threagile-risk-instance", {
    i(1, "IndividualRiskInstanceName"), t({ ":", "  severity: " }), i(2, "medium"),
    t({ "", "  exploitation_likelihood: " }), i(3, "medium"),
    t({ "", "  exploitation_impact: " }), i(4, "medium"),
    t({ "", "  data_breach_probability: " }), i(5, "unlikely"),
    t({ "", "  data_breach_technical_assets:", "    " }), i(6, "technical-asset-id"),
    t({ "", "  most_relevant_data_asset: " }), i(7, "data-asset-id"),
    t({ "", "  most_relevant_technical_asset: " }), i(8, "technical-asset-id"),
    t({ "", "  most_relevant_trust_boundary: " }), i(9, "trust-boundary-id"),
    t({ "", "  most_relevant_shared_runtime: " }), i(10, "shared-runtime-id"), i(0)
  }),
  s("threagile-risk-tracking", {
    i(1, "RiskID"), t({ ": # wildcards '*' between the @ characters are possible", "  status: " }), i(2, "open"),
    t({ "", "  justification: " }), i(3, "justification"),
    t({ "", "  ticket: " }), i(4, "ticket"), t({ "", "  date: " }), i(5, "date"),
    t({ "", "  checked_by: " }), i(6, "checked_by"), i(0)
  }),
}
