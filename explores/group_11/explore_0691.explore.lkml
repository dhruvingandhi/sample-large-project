# Explore: explore_0691
# Auto-generated LookML Explore File

include: "/views/domain_24/view_02074.view.lkml"
include: "/views/domain_26/view_02076.view.lkml"
include: "/views/domain_27/view_02077.view.lkml"
include: "/views/domain_28/view_02078.view.lkml"

explore: explore_0691 {
  label: "Explore Explore 0691"
  description: "Comprehensive analytics explore joining base view_02074 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02074
  
  always_filter: {
    filters: [view_02074.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02074.created_at_date: "7 days"]
    unless: [view_02074.id, view_02074.status]
  }

  join: view_02076 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02074.user_id} = ${view_02076.id} ;;
    required_joins: []
  }

  join: view_02077 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02074.account_id} = ${view_02077.account_id} ;;
    required_joins: [view_02076]
  }

  join: view_02078 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02074.category} = ${view_02078.category} ;;
  }

  access_filter: {
    field: view_02074.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02074.is_deleted} = false ;;
}
