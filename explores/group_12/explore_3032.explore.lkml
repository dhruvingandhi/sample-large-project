# Explore: explore_3032
# Auto-generated LookML Explore File

include: "/views/domain_47/view_09097.view.lkml"
include: "/views/domain_49/view_09099.view.lkml"
include: "/views/domain_50/view_09100.view.lkml"
include: "/views/domain_01/view_09101.view.lkml"

explore: explore_3032 {
  label: "Explore Explore 3032"
  description: "Comprehensive analytics explore joining base view_09097 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09097
  
  always_filter: {
    filters: [view_09097.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09097.created_at_date: "7 days"]
    unless: [view_09097.id, view_09097.status]
  }

  join: view_09099 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09097.user_id} = ${view_09099.id} ;;
    required_joins: []
  }

  join: view_09100 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09097.account_id} = ${view_09100.account_id} ;;
    required_joins: [view_09099]
  }

  join: view_09101 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09097.category} = ${view_09101.category} ;;
  }

  access_filter: {
    field: view_09097.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09097.is_deleted} = false ;;
}
