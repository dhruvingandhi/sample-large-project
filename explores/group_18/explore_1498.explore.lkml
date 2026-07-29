# Explore: explore_1498
# Auto-generated LookML Explore File

include: "/views/domain_45/view_04495.view.lkml"
include: "/views/domain_47/view_04497.view.lkml"
include: "/views/domain_48/view_04498.view.lkml"
include: "/views/domain_49/view_04499.view.lkml"

explore: explore_1498 {
  label: "Explore Explore 1498"
  description: "Comprehensive analytics explore joining base view_04495 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04495
  
  always_filter: {
    filters: [view_04495.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04495.created_at_date: "7 days"]
    unless: [view_04495.id, view_04495.status]
  }

  join: view_04497 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04495.user_id} = ${view_04497.id} ;;
    required_joins: []
  }

  join: view_04498 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04495.account_id} = ${view_04498.account_id} ;;
    required_joins: [view_04497]
  }

  join: view_04499 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04495.category} = ${view_04499.category} ;;
  }

  access_filter: {
    field: view_04495.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04495.is_deleted} = false ;;
}
