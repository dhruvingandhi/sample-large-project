# Antigravity modified: branch dg-3
# Explore: explore_0925
# Auto-generated LookML Explore File

include: "/views/domain_26/view_02776.view.lkml"
include: "/views/domain_28/view_02778.view.lkml"
include: "/views/domain_29/view_02779.view.lkml"
include: "/views/domain_30/view_02780.view.lkml"

explore: explore_0925 {
  label: "Explore Explore 0925"
  description: "Comprehensive analytics explore joining base view_02776 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02776
  
  always_filter: {
    filters: [view_02776.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02776.created_at_date: "7 days"]
    unless: [view_02776.id, view_02776.status]
  }

  join: view_02778 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02776.user_id} = ${view_02778.id} ;;
    required_joins: []
  }

  join: view_02779 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02776.account_id} = ${view_02779.account_id} ;;
    required_joins: [view_02778]
  }

  join: view_02780 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02776.category} = ${view_02780.category} ;;
  }

  access_filter: {
    field: view_02776.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02776.is_deleted} = false ;;
}
