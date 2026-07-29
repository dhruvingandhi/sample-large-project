# Explore: explore_0790
# Auto-generated LookML Explore File

include: "/views/domain_21/view_02371.view.lkml"
include: "/views/domain_23/view_02373.view.lkml"
include: "/views/domain_24/view_02374.view.lkml"
include: "/views/domain_25/view_02375.view.lkml"

explore: explore_0790 {
  label: "Explore Explore 0790"
  description: "Comprehensive analytics explore joining base view_02371 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02371
  
  always_filter: {
    filters: [view_02371.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02371.created_at_date: "7 days"]
    unless: [view_02371.id, view_02371.status]
  }

  join: view_02373 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02371.user_id} = ${view_02373.id} ;;
    required_joins: []
  }

  join: view_02374 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02371.account_id} = ${view_02374.account_id} ;;
    required_joins: [view_02373]
  }

  join: view_02375 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02371.category} = ${view_02375.category} ;;
  }

  access_filter: {
    field: view_02371.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02371.is_deleted} = false ;;
}
