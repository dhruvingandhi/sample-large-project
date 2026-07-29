# Explore: explore_2069
# Auto-generated LookML Explore File

include: "/views/domain_08/view_06208.view.lkml"
include: "/views/domain_10/view_06210.view.lkml"
include: "/views/domain_11/view_06211.view.lkml"
include: "/views/domain_12/view_06212.view.lkml"

explore: explore_2069 {
  label: "Explore Explore 2069"
  description: "Comprehensive analytics explore joining base view_06208 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06208
  
  always_filter: {
    filters: [view_06208.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06208.created_at_date: "7 days"]
    unless: [view_06208.id, view_06208.status]
  }

  join: view_06210 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06208.user_id} = ${view_06210.id} ;;
    required_joins: []
  }

  join: view_06211 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06208.account_id} = ${view_06211.account_id} ;;
    required_joins: [view_06210]
  }

  join: view_06212 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06208.category} = ${view_06212.category} ;;
  }

  access_filter: {
    field: view_06208.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06208.is_deleted} = false ;;
}
