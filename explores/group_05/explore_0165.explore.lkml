# Antigravity modified: branch dg-3
# Explore: explore_0165
# Auto-generated LookML Explore File

include: "/views/domain_46/view_00496.view.lkml"
include: "/views/domain_48/view_00498.view.lkml"
include: "/views/domain_49/view_00499.view.lkml"
include: "/views/domain_50/view_00500.view.lkml"

explore: explore_0165 {
  label: "Explore Explore 0165"
  description: "Comprehensive analytics explore joining base view_00496 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00496
  
  always_filter: {
    filters: [view_00496.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00496.created_at_date: "7 days"]
    unless: [view_00496.id, view_00496.status]
  }

  join: view_00498 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00496.user_id} = ${view_00498.id} ;;
    required_joins: []
  }

  join: view_00499 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00496.account_id} = ${view_00499.account_id} ;;
    required_joins: [view_00498]
  }

  join: view_00500 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00496.category} = ${view_00500.category} ;;
  }

  access_filter: {
    field: view_00496.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00496.is_deleted} = false ;;
}
