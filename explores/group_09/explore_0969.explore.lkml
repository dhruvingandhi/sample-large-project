# Explore: explore_0969
# Auto-generated LookML Explore File

include: "/views/domain_08/view_02908.view.lkml"
include: "/views/domain_10/view_02910.view.lkml"
include: "/views/domain_11/view_02911.view.lkml"
include: "/views/domain_12/view_02912.view.lkml"

explore: explore_0969 {
  label: "Explore Explore 0969"
  description: "Comprehensive analytics explore joining base view_02908 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02908
  
  always_filter: {
    filters: [view_02908.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02908.created_at_date: "7 days"]
    unless: [view_02908.id, view_02908.status]
  }

  join: view_02910 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02908.user_id} = ${view_02910.id} ;;
    required_joins: []
  }

  join: view_02911 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02908.account_id} = ${view_02911.account_id} ;;
    required_joins: [view_02910]
  }

  join: view_02912 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02908.category} = ${view_02912.category} ;;
  }

  access_filter: {
    field: view_02908.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02908.is_deleted} = false ;;
}
