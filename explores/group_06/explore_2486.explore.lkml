# Explore: explore_2486
# Auto-generated LookML Explore File

include: "/views/domain_09/view_07459.view.lkml"
include: "/views/domain_11/view_07461.view.lkml"
include: "/views/domain_12/view_07462.view.lkml"
include: "/views/domain_13/view_07463.view.lkml"

explore: explore_2486 {
  label: "Explore Explore 2486"
  description: "Comprehensive analytics explore joining base view_07459 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07459
  
  always_filter: {
    filters: [view_07459.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07459.created_at_date: "7 days"]
    unless: [view_07459.id, view_07459.status]
  }

  join: view_07461 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07459.user_id} = ${view_07461.id} ;;
    required_joins: []
  }

  join: view_07462 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07459.account_id} = ${view_07462.account_id} ;;
    required_joins: [view_07461]
  }

  join: view_07463 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07459.category} = ${view_07463.category} ;;
  }

  access_filter: {
    field: view_07459.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07459.is_deleted} = false ;;
}
