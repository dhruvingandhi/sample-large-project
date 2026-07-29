# Explore: explore_2969
# Auto-generated LookML Explore File

include: "/views/domain_08/view_08908.view.lkml"
include: "/views/domain_10/view_08910.view.lkml"
include: "/views/domain_11/view_08911.view.lkml"
include: "/views/domain_12/view_08912.view.lkml"

explore: explore_2969 {
  label: "Explore Explore 2969"
  description: "Comprehensive analytics explore joining base view_08908 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08908
  
  always_filter: {
    filters: [view_08908.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08908.created_at_date: "7 days"]
    unless: [view_08908.id, view_08908.status]
  }

  join: view_08910 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08908.user_id} = ${view_08910.id} ;;
    required_joins: []
  }

  join: view_08911 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08908.account_id} = ${view_08911.account_id} ;;
    required_joins: [view_08910]
  }

  join: view_08912 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08908.category} = ${view_08912.category} ;;
  }

  access_filter: {
    field: view_08908.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08908.is_deleted} = false ;;
}
