# Explore: explore_3434
# Auto-generated LookML Explore File

include: "/views/domain_03/view_10303.view.lkml"
include: "/views/domain_05/view_10305.view.lkml"
include: "/views/domain_06/view_10306.view.lkml"
include: "/views/domain_07/view_10307.view.lkml"

explore: explore_3434 {
  label: "Explore Explore 3434"
  description: "Comprehensive analytics explore joining base view_10303 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10303
  
  always_filter: {
    filters: [view_10303.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10303.created_at_date: "7 days"]
    unless: [view_10303.id, view_10303.status]
  }

  join: view_10305 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10303.user_id} = ${view_10305.id} ;;
    required_joins: []
  }

  join: view_10306 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10303.account_id} = ${view_10306.account_id} ;;
    required_joins: [view_10305]
  }

  join: view_10307 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10303.category} = ${view_10307.category} ;;
  }

  access_filter: {
    field: view_10303.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10303.is_deleted} = false ;;
}
