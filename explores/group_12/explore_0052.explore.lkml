# Explore: explore_0052
# Auto-generated LookML Explore File

include: "/views/domain_07/view_00157.view.lkml"
include: "/views/domain_09/view_00159.view.lkml"
include: "/views/domain_10/view_00160.view.lkml"
include: "/views/domain_11/view_00161.view.lkml"

explore: explore_0052 {
  label: "Explore Explore 0052"
  description: "Comprehensive analytics explore joining base view_00157 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00157
  
  always_filter: {
    filters: [view_00157.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00157.created_at_date: "7 days"]
    unless: [view_00157.id, view_00157.status]
  }

  join: view_00159 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00157.user_id} = ${view_00159.id} ;;
    required_joins: []
  }

  join: view_00160 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00157.account_id} = ${view_00160.account_id} ;;
    required_joins: [view_00159]
  }

  join: view_00161 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00157.category} = ${view_00161.category} ;;
  }

  access_filter: {
    field: view_00157.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00157.is_deleted} = false ;;
}
