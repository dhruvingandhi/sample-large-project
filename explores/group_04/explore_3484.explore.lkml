# Explore: explore_3484
# Auto-generated LookML Explore File

include: "/views/domain_03/view_10453.view.lkml"
include: "/views/domain_05/view_10455.view.lkml"
include: "/views/domain_06/view_10456.view.lkml"
include: "/views/domain_07/view_10457.view.lkml"

explore: explore_3484 {
  label: "Explore Explore 3484"
  description: "Comprehensive analytics explore joining base view_10453 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10453
  
  always_filter: {
    filters: [view_10453.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10453.created_at_date: "7 days"]
    unless: [view_10453.id, view_10453.status]
  }

  join: view_10455 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10453.user_id} = ${view_10455.id} ;;
    required_joins: []
  }

  join: view_10456 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10453.account_id} = ${view_10456.account_id} ;;
    required_joins: [view_10455]
  }

  join: view_10457 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10453.category} = ${view_10457.category} ;;
  }

  access_filter: {
    field: view_10453.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10453.is_deleted} = false ;;
}
