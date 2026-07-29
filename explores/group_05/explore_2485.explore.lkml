# Explore: explore_2485
# Auto-generated LookML Explore File

include: "/views/domain_06/view_07456.view.lkml"
include: "/views/domain_08/view_07458.view.lkml"
include: "/views/domain_09/view_07459.view.lkml"
include: "/views/domain_10/view_07460.view.lkml"

explore: explore_2485 {
  label: "Explore Explore 2485"
  description: "Comprehensive analytics explore joining base view_07456 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07456
  
  always_filter: {
    filters: [view_07456.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07456.created_at_date: "7 days"]
    unless: [view_07456.id, view_07456.status]
  }

  join: view_07458 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07456.user_id} = ${view_07458.id} ;;
    required_joins: []
  }

  join: view_07459 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07456.account_id} = ${view_07459.account_id} ;;
    required_joins: [view_07458]
  }

  join: view_07460 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07456.category} = ${view_07460.category} ;;
  }

  access_filter: {
    field: view_07456.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07456.is_deleted} = false ;;
}
