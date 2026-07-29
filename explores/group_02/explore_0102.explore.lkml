# Explore: explore_0102
# Auto-generated LookML Explore File

include: "/views/domain_07/view_00307.view.lkml"
include: "/views/domain_09/view_00309.view.lkml"
include: "/views/domain_10/view_00310.view.lkml"
include: "/views/domain_11/view_00311.view.lkml"

explore: explore_0102 {
  label: "Explore Explore 0102"
  description: "Comprehensive analytics explore joining base view_00307 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00307
  
  always_filter: {
    filters: [view_00307.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00307.created_at_date: "7 days"]
    unless: [view_00307.id, view_00307.status]
  }

  join: view_00309 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00307.user_id} = ${view_00309.id} ;;
    required_joins: []
  }

  join: view_00310 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00307.account_id} = ${view_00310.account_id} ;;
    required_joins: [view_00309]
  }

  join: view_00311 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00307.category} = ${view_00311.category} ;;
  }

  access_filter: {
    field: view_00307.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00307.is_deleted} = false ;;
}
