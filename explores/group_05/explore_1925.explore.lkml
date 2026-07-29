# Explore: explore_1925
# Auto-generated LookML Explore File

include: "/views/domain_26/view_05776.view.lkml"
include: "/views/domain_28/view_05778.view.lkml"
include: "/views/domain_29/view_05779.view.lkml"
include: "/views/domain_30/view_05780.view.lkml"

explore: explore_1925 {
  label: "Explore Explore 1925"
  description: "Comprehensive analytics explore joining base view_05776 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05776
  
  always_filter: {
    filters: [view_05776.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05776.created_at_date: "7 days"]
    unless: [view_05776.id, view_05776.status]
  }

  join: view_05778 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05776.user_id} = ${view_05778.id} ;;
    required_joins: []
  }

  join: view_05779 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05776.account_id} = ${view_05779.account_id} ;;
    required_joins: [view_05778]
  }

  join: view_05780 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05776.category} = ${view_05780.category} ;;
  }

  access_filter: {
    field: view_05776.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05776.is_deleted} = false ;;
}
