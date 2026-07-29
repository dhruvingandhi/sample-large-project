# Explore: explore_1150
# Auto-generated LookML Explore File

include: "/views/domain_01/view_03451.view.lkml"
include: "/views/domain_03/view_03453.view.lkml"
include: "/views/domain_04/view_03454.view.lkml"
include: "/views/domain_05/view_03455.view.lkml"

explore: explore_1150 {
  label: "Explore Explore 1150"
  description: "Comprehensive analytics explore joining base view_03451 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03451
  
  always_filter: {
    filters: [view_03451.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03451.created_at_date: "7 days"]
    unless: [view_03451.id, view_03451.status]
  }

  join: view_03453 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03451.user_id} = ${view_03453.id} ;;
    required_joins: []
  }

  join: view_03454 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03451.account_id} = ${view_03454.account_id} ;;
    required_joins: [view_03453]
  }

  join: view_03455 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03451.category} = ${view_03455.category} ;;
  }

  access_filter: {
    field: view_03451.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03451.is_deleted} = false ;;
}
