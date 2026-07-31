# Antigravity modified: branch dg-3
# Explore: explore_0425
# Auto-generated LookML Explore File

include: "/views/domain_26/view_01276.view.lkml"
include: "/views/domain_28/view_01278.view.lkml"
include: "/views/domain_29/view_01279.view.lkml"
include: "/views/domain_30/view_01280.view.lkml"

explore: explore_0425 {
  label: "Explore Explore 0425"
  description: "Comprehensive analytics explore joining base view_01276 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01276
  
  always_filter: {
    filters: [view_01276.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01276.created_at_date: "7 days"]
    unless: [view_01276.id, view_01276.status]
  }

  join: view_01278 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01276.user_id} = ${view_01278.id} ;;
    required_joins: []
  }

  join: view_01279 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01276.account_id} = ${view_01279.account_id} ;;
    required_joins: [view_01278]
  }

  join: view_01280 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01276.category} = ${view_01280.category} ;;
  }

  access_filter: {
    field: view_01276.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01276.is_deleted} = false ;;
}
