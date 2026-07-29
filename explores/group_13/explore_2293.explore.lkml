# Explore: explore_2293
# Auto-generated LookML Explore File

include: "/views/domain_30/view_06880.view.lkml"
include: "/views/domain_32/view_06882.view.lkml"
include: "/views/domain_33/view_06883.view.lkml"
include: "/views/domain_34/view_06884.view.lkml"

explore: explore_2293 {
  label: "Explore Explore 2293"
  description: "Comprehensive analytics explore joining base view_06880 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06880
  
  always_filter: {
    filters: [view_06880.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06880.created_at_date: "7 days"]
    unless: [view_06880.id, view_06880.status]
  }

  join: view_06882 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06880.user_id} = ${view_06882.id} ;;
    required_joins: []
  }

  join: view_06883 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06880.account_id} = ${view_06883.account_id} ;;
    required_joins: [view_06882]
  }

  join: view_06884 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06880.category} = ${view_06884.category} ;;
  }

  access_filter: {
    field: view_06880.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06880.is_deleted} = false ;;
}
