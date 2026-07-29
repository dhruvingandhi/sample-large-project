# Explore: explore_0936
# Auto-generated LookML Explore File

include: "/views/domain_09/view_02809.view.lkml"
include: "/views/domain_11/view_02811.view.lkml"
include: "/views/domain_12/view_02812.view.lkml"
include: "/views/domain_13/view_02813.view.lkml"

explore: explore_0936 {
  label: "Explore Explore 0936"
  description: "Comprehensive analytics explore joining base view_02809 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02809
  
  always_filter: {
    filters: [view_02809.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02809.created_at_date: "7 days"]
    unless: [view_02809.id, view_02809.status]
  }

  join: view_02811 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02809.user_id} = ${view_02811.id} ;;
    required_joins: []
  }

  join: view_02812 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02809.account_id} = ${view_02812.account_id} ;;
    required_joins: [view_02811]
  }

  join: view_02813 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02809.category} = ${view_02813.category} ;;
  }

  access_filter: {
    field: view_02809.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02809.is_deleted} = false ;;
}
