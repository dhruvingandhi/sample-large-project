# Explore: explore_2732
# Auto-generated LookML Explore File

include: "/views/domain_47/view_08197.view.lkml"
include: "/views/domain_49/view_08199.view.lkml"
include: "/views/domain_50/view_08200.view.lkml"
include: "/views/domain_01/view_08201.view.lkml"

explore: explore_2732 {
  label: "Explore Explore 2732"
  description: "Comprehensive analytics explore joining base view_08197 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08197
  
  always_filter: {
    filters: [view_08197.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08197.created_at_date: "7 days"]
    unless: [view_08197.id, view_08197.status]
  }

  join: view_08199 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08197.user_id} = ${view_08199.id} ;;
    required_joins: []
  }

  join: view_08200 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08197.account_id} = ${view_08200.account_id} ;;
    required_joins: [view_08199]
  }

  join: view_08201 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08197.category} = ${view_08201.category} ;;
  }

  access_filter: {
    field: view_08197.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08197.is_deleted} = false ;;
}
