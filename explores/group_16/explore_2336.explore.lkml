# Explore: explore_2336
# Auto-generated LookML Explore File

include: "/views/domain_09/view_07009.view.lkml"
include: "/views/domain_11/view_07011.view.lkml"
include: "/views/domain_12/view_07012.view.lkml"
include: "/views/domain_13/view_07013.view.lkml"

explore: explore_2336 {
  label: "Explore Explore 2336"
  description: "Comprehensive analytics explore joining base view_07009 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07009
  
  always_filter: {
    filters: [view_07009.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07009.created_at_date: "7 days"]
    unless: [view_07009.id, view_07009.status]
  }

  join: view_07011 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07009.user_id} = ${view_07011.id} ;;
    required_joins: []
  }

  join: view_07012 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07009.account_id} = ${view_07012.account_id} ;;
    required_joins: [view_07011]
  }

  join: view_07013 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07009.category} = ${view_07013.category} ;;
  }

  access_filter: {
    field: view_07009.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07009.is_deleted} = false ;;
}
