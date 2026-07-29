# Explore: explore_1443
# Auto-generated LookML Explore File

include: "/views/domain_30/view_04330.view.lkml"
include: "/views/domain_32/view_04332.view.lkml"
include: "/views/domain_33/view_04333.view.lkml"
include: "/views/domain_34/view_04334.view.lkml"

explore: explore_1443 {
  label: "Explore Explore 1443"
  description: "Comprehensive analytics explore joining base view_04330 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04330
  
  always_filter: {
    filters: [view_04330.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04330.created_at_date: "7 days"]
    unless: [view_04330.id, view_04330.status]
  }

  join: view_04332 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04330.user_id} = ${view_04332.id} ;;
    required_joins: []
  }

  join: view_04333 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04330.account_id} = ${view_04333.account_id} ;;
    required_joins: [view_04332]
  }

  join: view_04334 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04330.category} = ${view_04334.category} ;;
  }

  access_filter: {
    field: view_04330.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04330.is_deleted} = false ;;
}
