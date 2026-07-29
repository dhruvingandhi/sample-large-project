# Explore: explore_1052
# Auto-generated LookML Explore File

include: "/views/domain_07/view_03157.view.lkml"
include: "/views/domain_09/view_03159.view.lkml"
include: "/views/domain_10/view_03160.view.lkml"
include: "/views/domain_11/view_03161.view.lkml"

explore: explore_1052 {
  label: "Explore Explore 1052"
  description: "Comprehensive analytics explore joining base view_03157 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03157
  
  always_filter: {
    filters: [view_03157.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03157.created_at_date: "7 days"]
    unless: [view_03157.id, view_03157.status]
  }

  join: view_03159 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03157.user_id} = ${view_03159.id} ;;
    required_joins: []
  }

  join: view_03160 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03157.account_id} = ${view_03160.account_id} ;;
    required_joins: [view_03159]
  }

  join: view_03161 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03157.category} = ${view_03161.category} ;;
  }

  access_filter: {
    field: view_03157.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03157.is_deleted} = false ;;
}
