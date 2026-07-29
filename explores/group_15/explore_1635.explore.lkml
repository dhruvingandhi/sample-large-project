# Explore: explore_1635
# Auto-generated LookML Explore File

include: "/views/domain_06/view_04906.view.lkml"
include: "/views/domain_08/view_04908.view.lkml"
include: "/views/domain_09/view_04909.view.lkml"
include: "/views/domain_10/view_04910.view.lkml"

explore: explore_1635 {
  label: "Explore Explore 1635"
  description: "Comprehensive analytics explore joining base view_04906 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04906
  
  always_filter: {
    filters: [view_04906.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04906.created_at_date: "7 days"]
    unless: [view_04906.id, view_04906.status]
  }

  join: view_04908 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04906.user_id} = ${view_04908.id} ;;
    required_joins: []
  }

  join: view_04909 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04906.account_id} = ${view_04909.account_id} ;;
    required_joins: [view_04908]
  }

  join: view_04910 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04906.category} = ${view_04910.category} ;;
  }

  access_filter: {
    field: view_04906.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04906.is_deleted} = false ;;
}
