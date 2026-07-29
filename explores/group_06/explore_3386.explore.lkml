# Explore: explore_3386
# Auto-generated LookML Explore File

include: "/views/domain_09/view_10159.view.lkml"
include: "/views/domain_11/view_10161.view.lkml"
include: "/views/domain_12/view_10162.view.lkml"
include: "/views/domain_13/view_10163.view.lkml"

explore: explore_3386 {
  label: "Explore Explore 3386"
  description: "Comprehensive analytics explore joining base view_10159 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10159
  
  always_filter: {
    filters: [view_10159.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10159.created_at_date: "7 days"]
    unless: [view_10159.id, view_10159.status]
  }

  join: view_10161 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10159.user_id} = ${view_10161.id} ;;
    required_joins: []
  }

  join: view_10162 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10159.account_id} = ${view_10162.account_id} ;;
    required_joins: [view_10161]
  }

  join: view_10163 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10159.category} = ${view_10163.category} ;;
  }

  access_filter: {
    field: view_10159.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10159.is_deleted} = false ;;
}
