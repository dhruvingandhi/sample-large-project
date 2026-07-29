# Explore: explore_0150
# Auto-generated LookML Explore File

include: "/views/domain_01/view_00451.view.lkml"
include: "/views/domain_03/view_00453.view.lkml"
include: "/views/domain_04/view_00454.view.lkml"
include: "/views/domain_05/view_00455.view.lkml"

explore: explore_0150 {
  label: "Explore Explore 0150"
  description: "Comprehensive analytics explore joining base view_00451 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00451
  
  always_filter: {
    filters: [view_00451.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00451.created_at_date: "7 days"]
    unless: [view_00451.id, view_00451.status]
  }

  join: view_00453 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00451.user_id} = ${view_00453.id} ;;
    required_joins: []
  }

  join: view_00454 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00451.account_id} = ${view_00454.account_id} ;;
    required_joins: [view_00453]
  }

  join: view_00455 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00451.category} = ${view_00455.category} ;;
  }

  access_filter: {
    field: view_00451.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00451.is_deleted} = false ;;
}
