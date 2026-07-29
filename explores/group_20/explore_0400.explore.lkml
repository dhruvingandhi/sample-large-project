# Explore: explore_0400
# Auto-generated LookML Explore File

include: "/views/domain_01/view_01201.view.lkml"
include: "/views/domain_03/view_01203.view.lkml"
include: "/views/domain_04/view_01204.view.lkml"
include: "/views/domain_05/view_01205.view.lkml"

explore: explore_0400 {
  label: "Explore Explore 0400"
  description: "Comprehensive analytics explore joining base view_01201 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01201
  
  always_filter: {
    filters: [view_01201.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01201.created_at_date: "7 days"]
    unless: [view_01201.id, view_01201.status]
  }

  join: view_01203 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01201.user_id} = ${view_01203.id} ;;
    required_joins: []
  }

  join: view_01204 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01201.account_id} = ${view_01204.account_id} ;;
    required_joins: [view_01203]
  }

  join: view_01205 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01201.category} = ${view_01205.category} ;;
  }

  access_filter: {
    field: view_01201.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01201.is_deleted} = false ;;
}
