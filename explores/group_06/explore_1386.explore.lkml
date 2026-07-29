# Explore: explore_1386
# Auto-generated LookML Explore File

include: "/views/domain_09/view_04159.view.lkml"
include: "/views/domain_11/view_04161.view.lkml"
include: "/views/domain_12/view_04162.view.lkml"
include: "/views/domain_13/view_04163.view.lkml"

explore: explore_1386 {
  label: "Explore Explore 1386"
  description: "Comprehensive analytics explore joining base view_04159 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04159
  
  always_filter: {
    filters: [view_04159.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04159.created_at_date: "7 days"]
    unless: [view_04159.id, view_04159.status]
  }

  join: view_04161 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04159.user_id} = ${view_04161.id} ;;
    required_joins: []
  }

  join: view_04162 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04159.account_id} = ${view_04162.account_id} ;;
    required_joins: [view_04161]
  }

  join: view_04163 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04159.category} = ${view_04163.category} ;;
  }

  access_filter: {
    field: view_04159.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04159.is_deleted} = false ;;
}
