# Explore: explore_0498
# Auto-generated LookML Explore File

include: "/views/domain_45/view_01495.view.lkml"
include: "/views/domain_47/view_01497.view.lkml"
include: "/views/domain_48/view_01498.view.lkml"
include: "/views/domain_49/view_01499.view.lkml"

explore: explore_0498 {
  label: "Explore Explore 0498"
  description: "Comprehensive analytics explore joining base view_01495 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01495
  
  always_filter: {
    filters: [view_01495.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01495.created_at_date: "7 days"]
    unless: [view_01495.id, view_01495.status]
  }

  join: view_01497 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01495.user_id} = ${view_01497.id} ;;
    required_joins: []
  }

  join: view_01498 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01495.account_id} = ${view_01498.account_id} ;;
    required_joins: [view_01497]
  }

  join: view_01499 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01495.category} = ${view_01499.category} ;;
  }

  access_filter: {
    field: view_01495.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01495.is_deleted} = false ;;
}
