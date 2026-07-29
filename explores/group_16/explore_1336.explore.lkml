# Explore: explore_1336
# Auto-generated LookML Explore File

include: "/views/domain_09/view_04009.view.lkml"
include: "/views/domain_11/view_04011.view.lkml"
include: "/views/domain_12/view_04012.view.lkml"
include: "/views/domain_13/view_04013.view.lkml"

explore: explore_1336 {
  label: "Explore Explore 1336"
  description: "Comprehensive analytics explore joining base view_04009 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04009
  
  always_filter: {
    filters: [view_04009.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04009.created_at_date: "7 days"]
    unless: [view_04009.id, view_04009.status]
  }

  join: view_04011 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04009.user_id} = ${view_04011.id} ;;
    required_joins: []
  }

  join: view_04012 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04009.account_id} = ${view_04012.account_id} ;;
    required_joins: [view_04011]
  }

  join: view_04013 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04009.category} = ${view_04013.category} ;;
  }

  access_filter: {
    field: view_04009.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04009.is_deleted} = false ;;
}
