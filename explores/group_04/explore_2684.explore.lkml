# Explore: explore_2684
# Auto-generated LookML Explore File

include: "/views/domain_03/view_08053.view.lkml"
include: "/views/domain_05/view_08055.view.lkml"
include: "/views/domain_06/view_08056.view.lkml"
include: "/views/domain_07/view_08057.view.lkml"

explore: explore_2684 {
  label: "Explore Explore 2684"
  description: "Comprehensive analytics explore joining base view_08053 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08053
  
  always_filter: {
    filters: [view_08053.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08053.created_at_date: "7 days"]
    unless: [view_08053.id, view_08053.status]
  }

  join: view_08055 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08053.user_id} = ${view_08055.id} ;;
    required_joins: []
  }

  join: view_08056 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08053.account_id} = ${view_08056.account_id} ;;
    required_joins: [view_08055]
  }

  join: view_08057 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08053.category} = ${view_08057.category} ;;
  }

  access_filter: {
    field: view_08053.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08053.is_deleted} = false ;;
}
