# Explore: explore_0754
# Auto-generated LookML Explore File

include: "/views/domain_13/view_02263.view.lkml"
include: "/views/domain_15/view_02265.view.lkml"
include: "/views/domain_16/view_02266.view.lkml"
include: "/views/domain_17/view_02267.view.lkml"

explore: explore_0754 {
  label: "Explore Explore 0754"
  description: "Comprehensive analytics explore joining base view_02263 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02263
  
  always_filter: {
    filters: [view_02263.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02263.created_at_date: "7 days"]
    unless: [view_02263.id, view_02263.status]
  }

  join: view_02265 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02263.user_id} = ${view_02265.id} ;;
    required_joins: []
  }

  join: view_02266 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02263.account_id} = ${view_02266.account_id} ;;
    required_joins: [view_02265]
  }

  join: view_02267 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02263.category} = ${view_02267.category} ;;
  }

  access_filter: {
    field: view_02263.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02263.is_deleted} = false ;;
}
