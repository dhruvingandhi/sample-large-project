# Explore: explore_0401
# Auto-generated LookML Explore File

include: "/views/domain_04/view_01204.view.lkml"
include: "/views/domain_06/view_01206.view.lkml"
include: "/views/domain_07/view_01207.view.lkml"
include: "/views/domain_08/view_01208.view.lkml"

explore: explore_0401 {
  label: "Explore Explore 0401"
  description: "Comprehensive analytics explore joining base view_01204 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01204
  
  always_filter: {
    filters: [view_01204.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01204.created_at_date: "7 days"]
    unless: [view_01204.id, view_01204.status]
  }

  join: view_01206 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01204.user_id} = ${view_01206.id} ;;
    required_joins: []
  }

  join: view_01207 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01204.account_id} = ${view_01207.account_id} ;;
    required_joins: [view_01206]
  }

  join: view_01208 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01204.category} = ${view_01208.category} ;;
  }

  access_filter: {
    field: view_01204.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01204.is_deleted} = false ;;
}
