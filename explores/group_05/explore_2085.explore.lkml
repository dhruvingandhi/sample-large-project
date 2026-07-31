# Update for 500 file diff target
# Explore: explore_2085
# Auto-generated LookML Explore File

include: "/views/domain_06/view_06256.view.lkml"
include: "/views/domain_08/view_06258.view.lkml"
include: "/views/domain_09/view_06259.view.lkml"
include: "/views/domain_10/view_06260.view.lkml"

explore: explore_2085 {
  label: "Explore Explore 2085"
  description: "Comprehensive analytics explore joining base view_06256 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06256
  
  always_filter: {
    filters: [view_06256.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06256.created_at_date: "7 days"]
    unless: [view_06256.id, view_06256.status]
  }

  join: view_06258 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06256.user_id} = ${view_06258.id} ;;
    required_joins: []
  }

  join: view_06259 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06256.account_id} = ${view_06259.account_id} ;;
    required_joins: [view_06258]
  }

  join: view_06260 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06256.category} = ${view_06260.category} ;;
  }

  access_filter: {
    field: view_06256.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06256.is_deleted} = false ;;
}
