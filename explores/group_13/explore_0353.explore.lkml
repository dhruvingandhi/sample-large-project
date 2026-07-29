# Explore: explore_0353
# Auto-generated LookML Explore File

include: "/views/domain_10/view_01060.view.lkml"
include: "/views/domain_12/view_01062.view.lkml"
include: "/views/domain_13/view_01063.view.lkml"
include: "/views/domain_14/view_01064.view.lkml"

explore: explore_0353 {
  label: "Explore Explore 0353"
  description: "Comprehensive analytics explore joining base view_01060 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01060
  
  always_filter: {
    filters: [view_01060.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01060.created_at_date: "7 days"]
    unless: [view_01060.id, view_01060.status]
  }

  join: view_01062 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01060.user_id} = ${view_01062.id} ;;
    required_joins: []
  }

  join: view_01063 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01060.account_id} = ${view_01063.account_id} ;;
    required_joins: [view_01062]
  }

  join: view_01064 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01060.category} = ${view_01064.category} ;;
  }

  access_filter: {
    field: view_01060.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01060.is_deleted} = false ;;
}
