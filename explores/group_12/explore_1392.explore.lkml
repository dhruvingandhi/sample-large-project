# Explore: explore_1392
# Auto-generated LookML Explore File

include: "/views/domain_27/view_04177.view.lkml"
include: "/views/domain_29/view_04179.view.lkml"
include: "/views/domain_30/view_04180.view.lkml"
include: "/views/domain_31/view_04181.view.lkml"

explore: explore_1392 {
  label: "Explore Explore 1392"
  description: "Comprehensive analytics explore joining base view_04177 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04177
  
  always_filter: {
    filters: [view_04177.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04177.created_at_date: "7 days"]
    unless: [view_04177.id, view_04177.status]
  }

  join: view_04179 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04177.user_id} = ${view_04179.id} ;;
    required_joins: []
  }

  join: view_04180 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04177.account_id} = ${view_04180.account_id} ;;
    required_joins: [view_04179]
  }

  join: view_04181 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04177.category} = ${view_04181.category} ;;
  }

  access_filter: {
    field: view_04177.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04177.is_deleted} = false ;;
}
