# Explore: explore_0388
# Auto-generated LookML Explore File

include: "/views/domain_15/view_01165.view.lkml"
include: "/views/domain_17/view_01167.view.lkml"
include: "/views/domain_18/view_01168.view.lkml"
include: "/views/domain_19/view_01169.view.lkml"

explore: explore_0388 {
  label: "Explore Explore 0388"
  description: "Comprehensive analytics explore joining base view_01165 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01165
  
  always_filter: {
    filters: [view_01165.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01165.created_at_date: "7 days"]
    unless: [view_01165.id, view_01165.status]
  }

  join: view_01167 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01165.user_id} = ${view_01167.id} ;;
    required_joins: []
  }

  join: view_01168 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01165.account_id} = ${view_01168.account_id} ;;
    required_joins: [view_01167]
  }

  join: view_01169 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01165.category} = ${view_01169.category} ;;
  }

  access_filter: {
    field: view_01165.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01165.is_deleted} = false ;;
}
