# Explore: explore_2484
# Auto-generated LookML Explore File

include: "/views/domain_03/view_07453.view.lkml"
include: "/views/domain_05/view_07455.view.lkml"
include: "/views/domain_06/view_07456.view.lkml"
include: "/views/domain_07/view_07457.view.lkml"

explore: explore_2484 {
  label: "Explore Explore 2484"
  description: "Comprehensive analytics explore joining base view_07453 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07453
  
  always_filter: {
    filters: [view_07453.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07453.created_at_date: "7 days"]
    unless: [view_07453.id, view_07453.status]
  }

  join: view_07455 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07453.user_id} = ${view_07455.id} ;;
    required_joins: []
  }

  join: view_07456 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07453.account_id} = ${view_07456.account_id} ;;
    required_joins: [view_07455]
  }

  join: view_07457 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07453.category} = ${view_07457.category} ;;
  }

  access_filter: {
    field: view_07453.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07453.is_deleted} = false ;;
}
