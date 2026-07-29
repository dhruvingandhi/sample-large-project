# Explore: explore_1388
# Auto-generated LookML Explore File

include: "/views/domain_15/view_04165.view.lkml"
include: "/views/domain_17/view_04167.view.lkml"
include: "/views/domain_18/view_04168.view.lkml"
include: "/views/domain_19/view_04169.view.lkml"

explore: explore_1388 {
  label: "Explore Explore 1388"
  description: "Comprehensive analytics explore joining base view_04165 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04165
  
  always_filter: {
    filters: [view_04165.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04165.created_at_date: "7 days"]
    unless: [view_04165.id, view_04165.status]
  }

  join: view_04167 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04165.user_id} = ${view_04167.id} ;;
    required_joins: []
  }

  join: view_04168 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04165.account_id} = ${view_04168.account_id} ;;
    required_joins: [view_04167]
  }

  join: view_04169 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04165.category} = ${view_04169.category} ;;
  }

  access_filter: {
    field: view_04165.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04165.is_deleted} = false ;;
}
