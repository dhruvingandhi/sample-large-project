# Explore: explore_3150
# Auto-generated LookML Explore File

include: "/views/domain_01/view_09451.view.lkml"
include: "/views/domain_03/view_09453.view.lkml"
include: "/views/domain_04/view_09454.view.lkml"
include: "/views/domain_05/view_09455.view.lkml"

explore: explore_3150 {
  label: "Explore Explore 3150"
  description: "Comprehensive analytics explore joining base view_09451 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09451
  
  always_filter: {
    filters: [view_09451.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09451.created_at_date: "7 days"]
    unless: [view_09451.id, view_09451.status]
  }

  join: view_09453 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09451.user_id} = ${view_09453.id} ;;
    required_joins: []
  }

  join: view_09454 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09451.account_id} = ${view_09454.account_id} ;;
    required_joins: [view_09453]
  }

  join: view_09455 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09451.category} = ${view_09455.category} ;;
  }

  access_filter: {
    field: view_09451.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09451.is_deleted} = false ;;
}
