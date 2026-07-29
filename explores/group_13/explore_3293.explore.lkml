# Explore: explore_3293
# Auto-generated LookML Explore File

include: "/views/domain_30/view_09880.view.lkml"
include: "/views/domain_32/view_09882.view.lkml"
include: "/views/domain_33/view_09883.view.lkml"
include: "/views/domain_34/view_09884.view.lkml"

explore: explore_3293 {
  label: "Explore Explore 3293"
  description: "Comprehensive analytics explore joining base view_09880 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09880
  
  always_filter: {
    filters: [view_09880.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09880.created_at_date: "7 days"]
    unless: [view_09880.id, view_09880.status]
  }

  join: view_09882 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09880.user_id} = ${view_09882.id} ;;
    required_joins: []
  }

  join: view_09883 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09880.account_id} = ${view_09883.account_id} ;;
    required_joins: [view_09882]
  }

  join: view_09884 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09880.category} = ${view_09884.category} ;;
  }

  access_filter: {
    field: view_09880.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09880.is_deleted} = false ;;
}
