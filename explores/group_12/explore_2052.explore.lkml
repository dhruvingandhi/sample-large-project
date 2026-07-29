# Explore: explore_2052
# Auto-generated LookML Explore File

include: "/views/domain_07/view_06157.view.lkml"
include: "/views/domain_09/view_06159.view.lkml"
include: "/views/domain_10/view_06160.view.lkml"
include: "/views/domain_11/view_06161.view.lkml"

explore: explore_2052 {
  label: "Explore Explore 2052"
  description: "Comprehensive analytics explore joining base view_06157 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06157
  
  always_filter: {
    filters: [view_06157.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06157.created_at_date: "7 days"]
    unless: [view_06157.id, view_06157.status]
  }

  join: view_06159 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06157.user_id} = ${view_06159.id} ;;
    required_joins: []
  }

  join: view_06160 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06157.account_id} = ${view_06160.account_id} ;;
    required_joins: [view_06159]
  }

  join: view_06161 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06157.category} = ${view_06161.category} ;;
  }

  access_filter: {
    field: view_06157.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06157.is_deleted} = false ;;
}
