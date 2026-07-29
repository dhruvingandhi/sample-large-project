# Explore: explore_1490
# Auto-generated LookML Explore File

include: "/views/domain_21/view_04471.view.lkml"
include: "/views/domain_23/view_04473.view.lkml"
include: "/views/domain_24/view_04474.view.lkml"
include: "/views/domain_25/view_04475.view.lkml"

explore: explore_1490 {
  label: "Explore Explore 1490"
  description: "Comprehensive analytics explore joining base view_04471 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04471
  
  always_filter: {
    filters: [view_04471.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04471.created_at_date: "7 days"]
    unless: [view_04471.id, view_04471.status]
  }

  join: view_04473 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04471.user_id} = ${view_04473.id} ;;
    required_joins: []
  }

  join: view_04474 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04471.account_id} = ${view_04474.account_id} ;;
    required_joins: [view_04473]
  }

  join: view_04475 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04471.category} = ${view_04475.category} ;;
  }

  access_filter: {
    field: view_04471.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04471.is_deleted} = false ;;
}
