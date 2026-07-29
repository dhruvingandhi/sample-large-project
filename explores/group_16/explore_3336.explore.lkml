# Explore: explore_3336
# Auto-generated LookML Explore File

include: "/views/domain_09/view_10009.view.lkml"
include: "/views/domain_11/view_10011.view.lkml"
include: "/views/domain_12/view_10012.view.lkml"
include: "/views/domain_13/view_10013.view.lkml"

explore: explore_3336 {
  label: "Explore Explore 3336"
  description: "Comprehensive analytics explore joining base view_10009 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10009
  
  always_filter: {
    filters: [view_10009.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10009.created_at_date: "7 days"]
    unless: [view_10009.id, view_10009.status]
  }

  join: view_10011 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10009.user_id} = ${view_10011.id} ;;
    required_joins: []
  }

  join: view_10012 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10009.account_id} = ${view_10012.account_id} ;;
    required_joins: [view_10011]
  }

  join: view_10013 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10009.category} = ${view_10013.category} ;;
  }

  access_filter: {
    field: view_10009.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10009.is_deleted} = false ;;
}
